#include <string.h>
#include <omnetpp.h>
#include <string>
#include <queue>
#include "SendingHost.h"

using namespace omnetpp;
using namespace std;

class Switch: public cSimpleModule {
private:
    double TIMEOUT;
    double CREDIT_DELAY;
    double OPERATION_TIME_PERIOD;
    double CHANNEL_DELAY;

    int ENB_SIZE;
    int EXB_SIZE;

    cModule *hosts[3];

    queue<cMessage*> ENB[3]; // Entrance Buffer
    queue<cMessage*> EXB; // Exit Buffer

    int prevENBid = 0;
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;

    int chooseENB(); // Gói tin tiếp theo được chuyển sang EXB nằm ở ENB nào?
    void ENBtoEXB(int ENBid); // Chuyển từ ENB sang EXB
};

Define_Module(Switch);

void Switch::initialize() {
    // Thiết lập các hằng số

    TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
    CREDIT_DELAY = getParentModule()->par("CREDIT_DELAY").doubleValue();
    OPERATION_TIME_PERIOD = par("OPERATION_TIME_PERIOD").doubleValue();
    CHANNEL_DELAY =
            ((cDelayChannel*) gate("out")->getChannel())->getDelay().dbl();
    ENB_SIZE = par("ENB_SIZE").intValue();
    EXB_SIZE = par("EXB_SIZE").intValue();

    // Khởi tạo danh sách hosts
    hosts[0] = getParentModule()->getModuleByPath(".A");
    hosts[1] = getParentModule()->getModuleByPath(".B");
    hosts[2] = getParentModule()->getModuleByPath(".C");

    scheduleAt(0, new cMessage("nextPeriod"));
    scheduleAt(0, new cMessage("send"));
}

void Switch::handleMessage(cMessage *msg) {
    // Kiểm tra TIMEOUT
    if (simTime() >= TIMEOUT) {
        return;
    }

    const char *event = msg->getName();

    // Nhận gói tin vào các ENB
    if (strcmp(event, "testMsg") == 0) {
        int ENBid = msg->getArrivalGate()->getIndex();
        int msgId = msg->par("msgId").longValue();
        EV << "Switch received testMsg id = " << msgId << " at port" << ENBid << endl;
        ENB[ENBid].push(msg);
        return;
    }

    // Chuyển từ ENB sang EXB
    if (strcmp(event, "ENBtoEXB") == 0) {
        int ENBid = msg->par("ENBid").longValue();
        ENBtoEXB(ENBid);
        delete msg;

        // Sau 1 khoảng thời gian thì báo lại cho hop trước
        cMessage *notifMsg = new cMessage("incNumSpaces");
        prevENBid = ENBid;
        scheduleAt(simTime() + CREDIT_DELAY, notifMsg);
        return;
    }

    // Báo lại cho hop trước
    if (strcmp(event, "incNumSpaces") == 0) {
        EV << "ENBid = " << endl;
        int ENBid = prevENBid;
        SendingHost *sendingHost = check_and_cast<SendingHost*>(hosts[ENBid]);
        sendingHost->incNumSpacesOfNextENB();
        delete msg;
        return;
    }

    // EXB -> next hop
    if (strcmp(event, "send") == 0) {
        EV << "sending";
        if (!EXB.empty()){
            cMessage *sentMsg = EXB.front();
            EXB.pop();
            send(sentMsg, "out");
        }
        scheduleAt(simTime() + CHANNEL_DELAY, msg);
        return;
    }

    // Chu kỳ hđ của switch
    if (strcmp(event, "nextPeriod") == 0) {
        if (EXB.size() < EXB_SIZE) {
            // Chọn ra gói tin sẽ được gửi từ ENB sang EXB
            int ENBid = chooseENB();
            if (ENBid != -1) {
                // Ghi lại ENBid vào event và sau 1 chu kỳ thì chuyển gói tin từ ENB đó sang EXB
                cMessage *enb2exbNotif = new cMessage("ENBtoEXB");
                enb2exbNotif->addPar("ENBid");
                enb2exbNotif->par("ENBid").setLongValue(ENBid);
                scheduleAt(simTime() + OPERATION_TIME_PERIOD, enb2exbNotif);
            }
        }
        scheduleAt(simTime() + OPERATION_TIME_PERIOD, msg);
        return;
    }
}

int Switch::chooseENB() {
    int minMsgId = INT32_MAX;
    int ENBid = -1;
    for (int i = 0; i < 3; i++) {
        if (!ENB[i].empty()) {
            int msgId = ENB[i].front()->par("msgId").longValue();
            if (msgId < minMsgId) {
                minMsgId = msgId;
                ENBid = i;
            }
        }
    }
    return ENBid;
}

void Switch::ENBtoEXB(int ENBid) {
    if (ENB[ENBid].empty())
        return;
    cMessage* msg = ENB[ENBid].front();
    ENB[ENBid].pop();
    EXB.push(msg);

}
