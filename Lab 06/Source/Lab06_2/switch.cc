#include <string.h>
#include <omnetpp.h>
#include <string>
#include <queue>

using namespace omnetpp;
using namespace std;

class Switch: public cSimpleModule {
private:
    double TIMEOUT;
    double INTERVAL;
    double CREDIT_DELAY;
    double OPERATION_TIME_PERIOD;

    int ENB_SIZE;
    int EXB_SIZE;

    int *receivedMsgCount;
    int arrayLength;
    int intervalCount = 0;

    cModule *hosts[3];

    queue<int> ENB[3]; // Entrance Buffer
    queue<int> EXB; // Exit Buffer

protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;

    int chooseENB(); // Gói tin tiếp theo được chuyển sang EXB nằm ở ENB nào?
    void ENBtoEXB(int ENBid); // Chuyển từ ENB sang EXB
};

Define_Module(Switch);

void Switch::initialize() {
    // Thiết lập các hằng số
    INTERVAL = getParentModule()->par("INTERVAL").doubleValue();
    TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
    CREDIT_DELAY = getParentModule()->par("CREDIT_DELAY").doubleValue();
    OPERATION_TIME_PERIOD = par("OPERATION_TIME_PERIOD").doubleValue();
    ENB_SIZE = par("ENB_SIZE").intValue();
    EXB_SIZE = par("EXB_SIZE").intValue();

    // Khởi tạo mảng
    arrayLength = TIMEOUT / INTERVAL;
    receivedMsgCount = new int[arrayLength];
    memset(receivedMsgCount, 0, arrayLength * sizeof(int));

    // Khởi tạo danh sách hosts
    hosts[0] = getParentModule()->getModuleByPath(".A");
    hosts[1] = getParentModule()->getModuleByPath(".B");
    hosts[2] = getParentModule()->getModuleByPath(".C");

    scheduleAt(0, new cMessage("nextInterval"));
    scheduleAt(0, new cMessage("nextPeriod"));
}

void Switch::handleMessage(cMessage *msg) {
    // Kiểm tra TIMEOUT
    if (simTime() >= TIMEOUT) {
        return;
    }

    const char *event = msg->getName();

    // Nhận và đếm số gói tin
    if (strcmp(event, "testMsg") == 0) {
        EV << msg->getArrivalGate()->getIndex();
        EV << "Received testMsg" << endl;
        receivedMsgCount[intervalCount]++;
        delete msg;
    }

    // Chuyển interval
    if (strcmp(event, "nextInterval") == 0) {
        intervalCount++;
        scheduleAt(simTime() + INTERVAL, msg);
    }

    // Chu kỳ hđ của switch
    if (strcmp(event, "nextPeriod") == 0) {
        if (EXB.size() < EXB_SIZE) {
            int ENBid = chooseENB();
            if (ENBid != -1) {
                ENBtoEXB(ENBid);

                // Baos laij
                cMessage *notifMsg = new cMessage("incNumSpaces");
                sendDirect(notifMsg, CREDIT_DELAY, 0, hosts[ENBid], "port$i");
            }
        }
        scheduleAt(simTime() + OPERATION_TIME_PERIOD, msg);
    }
}

void Switch::finish() {
    for (int i = 0; i < arrayLength; i++) {
        EV << "interval " << i << ", received " << receivedMsgCount[i]
                  << " messages" << endl;
    }
}

int Switch::chooseENB() {
    int minMsgId = INT32_MAX;
    int ENBid = -1;
    for (int i = 0; i < 3; i++) {
        if (!ENB[i].empty()) {
            if (ENB[i].front() < minMsgId) {
                minMsgId = ENB[i].front();
                ENBid = i;
            }
        }
    }
    return ENBid;
}

void Switch::ENBtoEXB(int ENBid) {
    if (ENB[ENBid].empty())
        return;
    int msgId = ENB[ENBid].front();
    ENB[ENBid].pop();
    EXB.push(msgId);

}

