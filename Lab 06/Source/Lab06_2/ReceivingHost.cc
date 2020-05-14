#include <string.h>
#include <omnetpp.h>
#include <iostream>
#include <string>
#include <queue>

using namespace omnetpp;
using namespace std;

class ReceivingHost: public cSimpleModule {
private:
    double TIMEOUT;
    double INTERVAL;

    int *receivedMsgCount;
    int arrayLength;
    int intervalCount = 0;

protected:
    virtual void initialize() override;
    virtual void finish() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(ReceivingHost);

void ReceivingHost::initialize() {
    // Thiết lập hằng số
    TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
    INTERVAL = getParentModule()->par("INTERVAL").doubleValue();

    // Khởi tạo mảng lưu kết quả
    arrayLength = TIMEOUT / INTERVAL;
    receivedMsgCount = new int[arrayLength];
    memset(receivedMsgCount, 0, arrayLength * sizeof(int));

    scheduleAt(0, new cMessage("nextInterval"));

}

void ReceivingHost::handleMessage(cMessage *msg) {
    // Kiểm tra TIMEOUT
    if (simTime() >= TIMEOUT) {
        return;
    }

    // Nhận và đếm gói tin
    if (strcmp(msg->getName(), "testMsg") == 0) {
        int msgId = msg->par("msgId").longValue();
        EV << "Switch received testMsg id = " << msgId << endl;
        receivedMsgCount[intervalCount]++;
        delete msg;
    }

    // Chuyển interval
    if (strcmp(msg->getName(), "nextInterval") == 0) {
        intervalCount++;
        scheduleAt(simTime() + INTERVAL, msg);
    }

}

void ReceivingHost::finish() {
    for (int i = 0; i < arrayLength; i++) {
        EV << "interval " << i << ", received " << receivedMsgCount[i]
                  << " messages" << endl;
    }
}
