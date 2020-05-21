#include <string.h>
#include <omnetpp.h>
#include <iostream>
#include <string>
#include <queue>
#include "ReceivingHost.h"

using namespace omnetpp;
using namespace std;

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
        return;
    }

    // Chuyển interval
    if (strcmp(msg->getName(), "nextInterval") == 0) {
        intervalCount++;
        scheduleAt(simTime() + INTERVAL, msg);
        return;
    }

}

void ReceivingHost::finish() {
    for (int i = 0; i < arrayLength; i++) {
        EV << "interval " << i << ", received " << receivedMsgCount[i]
                  << " messages" << endl;
    }
    int sum = 0;
    for (int i = 0; i < arrayLength; i++) {
        sum += receivedMsgCount[i];
    }
    EV << "Interval = " << INTERVAL * 1000 << " ms" << endl;
    EV << "Tổng số interval: " << arrayLength << endl;
    EV << "Tổng số gói tin nhận được " << sum << endl;
    EV << "Số gói tin nhận được trên 1s: " << 1.0 * sum / INTERVAL << endl;
}
