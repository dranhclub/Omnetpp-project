#include <string.h>
#include <omnetpp.h>
#include <iostream>
#include <string>
#include <queue>

using namespace omnetpp;
using namespace std;

class Host: public cSimpleModule {
private:

    // constant
    int EXB_SIZE;
    double TIMEOUT;
    double MSG_GEN_TIME_PERIOD;
    double CHANNEL_DELAY;
    bool isSender;

    int lastestMsgId = -1;

    // source queue
    queue<int> SQ;

    // exit buffer
    queue<int> EXB;

    // số chỗ trống của ENB của switch
    int numSpacesOfNextENB;

    void generateMessage();
    void SQtoEXB(); // Chuyển gói tin từ SQ sang EXB
    void sendMsg(); // Gửi từ EXB đi sang nút khác

protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;

public:
    void incNumSpacesOfNextENB();
};

Define_Module(Host);

void Host::initialize() {
    // Thiết lập các hằng số
    MSG_GEN_TIME_PERIOD =
            getParentModule()->par("MSG_GEN_TIME_PERIOD").doubleValue();
    TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
    EXB_SIZE = par("EXB_SIZE").intValue();
    CHANNEL_DELAY =
            ((cDelayChannel*) gate("port$o")->getChannel())->getDelay().dbl();
    isSender = par("isSender").boolValue();

    numSpacesOfNextENB = getParentModule()->getModuleByPath(".D")->par("ENB_SIZE").intValue();

    if (isSender){
        // Bắt đầu quá trình tạo các gói tin
        scheduleAt(0, new cMessage("generate"));
        // Bắt đầu quá trình gửi các gói tin
        scheduleAt(0, new cMessage("send"));
    }
}

void Host::handleMessage(cMessage *msg) {
    // Kiểm tra TIMEOUT
    if (simTime() >= TIMEOUT) {
        return;
    }

    // Hoạt động của Source Queue
    // Tạo tin nhắn theo chu kỳ
    if (strcmp(msg->getName(), "generate") == 0) {
        generateMessage();
        // Nếu EXB còn chỗ thì chuyển sang luôn
        if (EXB.size() < EXB_SIZE) {
            SQtoEXB();
        }

        scheduleAt(simTime() + MSG_GEN_TIME_PERIOD, msg);

    }

    // Hoạt động của Exit Buffer
    // Gửi tin nhắn theo chu kỳ
    if (strcmp(msg->getName(), "send") == 0) {
        sendMsg();
        SQtoEXB();

        scheduleAt(simTime() + CHANNEL_DELAY, msg);
    }

    // Tin báo tăng từ switch kế
    if (strcmp(msg->getName(), "incNumSpaces") == 0) {
        incNumSpacesOfNextENB();
        delete msg;
    }
}

void Host::generateMessage() {
    SQ.push(++lastestMsgId);
    EV << "message generated" << endl;
}

void Host::SQtoEXB() {
    if (!SQ.empty()) {
        int msgId = SQ.front();
        SQ.pop();
        EXB.push(msgId);
    }
}

void Host::sendMsg() {
    if (!EXB.empty() && numSpacesOfNextENB > 0) {
        // Lấy ra id gói tin chuẩn bị gửi
        int sentMsgId = EXB.front();
        EXB.pop();

        // Tạo gói tin (giả lập)
        cMessage *sentMsg = new cMessage("testMsg");

        // Gắn id cho gói tin
        cMsgPar *msgParam = new cMsgPar("msgId");
        msgParam->setLongValue(sentMsgId);
        sentMsg->addPar(msgParam);

        // Gửi
        send(sentMsg, "port$o");

        // Giảm số chỗ trống của ENB kế tiếp đi 1
        numSpacesOfNextENB--;
    }
}

void Host::incNumSpacesOfNextENB() {
    numSpacesOfNextENB++;
}
