#include <string.h>
#include <omnetpp.h>
#include <iostream>
#include <string>
#include <queue>
#include "SendingHost.h"

using namespace omnetpp;
using namespace std;

Define_Module(SendingHost);

void SendingHost::initialize() {
    // Thiết lập các hằng số
    MSG_GEN_TIME_PERIOD =
            getParentModule()->par("MSG_GEN_TIME_PERIOD").doubleValue();
    TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
    EXB_SIZE = par("EXB_SIZE").intValue();
    CHANNEL_DELAY =
            ((cDelayChannel*) gate("out")->getChannel())->getDelay().dbl();

    numSpacesOfNextENB = getParentModule()->getModuleByPath(".D")->par("ENB_SIZE").intValue();


    scheduleAt(0, new cMessage("generate"));
    scheduleAt(0, new cMessage("send"));
}

void SendingHost::handleMessage(cMessage *msg) {
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
        return;
    }

    // Hoạt động của Exit Buffer
    // Gửi tin nhắn theo chu kỳ
    if (strcmp(msg->getName(), "send") == 0) {
        if (numSpacesOfNextENB > 0) {
            sendMsg();
            // Giảm số chỗ trống của ENB kế tiếp đi 1
            numSpacesOfNextENB--;
            SQtoEXB();

        }
        scheduleAt(simTime() + CHANNEL_DELAY, msg);
        return;
    }
}

void SendingHost::generateMessage() {
    SQ.push(++lastestMsgId);
    EV << "message generated" << endl;
}

void SendingHost::SQtoEXB() {
    if (!SQ.empty()) {
        int msgId = SQ.front();
        SQ.pop();
        EXB.push(msgId);
    }
}

void SendingHost::sendMsg() {
    if (!EXB.empty()) {
        // Lấy ra id gói tin chuẩn bị gửi
        int sentMsgId = EXB.front();
        EXB.pop();

        // Tạo gói tin (giả lập)
        cMessage *sentMsg = new cMessage("testMsg");

        // Gắn id cho gói tin
        sentMsg->addPar("msgId");
        sentMsg->par("msgId").setLongValue(sentMsgId);

        // Gửi
        send(sentMsg, "out");
    }
}

void SendingHost::incNumSpacesOfNextENB() {
    numSpacesOfNextENB++;
}
