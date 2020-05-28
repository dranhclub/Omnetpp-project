#include <string.h>
#include <omnetpp.h>
#include <string>
#include <queue>
#include "Host.h"
#include "Initializer.h"

using namespace omnetpp;
using namespace std;

Define_Module(Host);

void Host::initialize() {
    // Paring
    Initializer *initializer = Initializer::getInstance();
    isSender = initializer->getDuty(string(getName()));
    pairHostName = initializer->getPairHostName(string(getName()));
    EV << "isSender = " << isSender << endl;
    EV << "pairHostName = " << pairHostName << endl;

    /**************************************
     *               SENDER
     */
    if (isSender) {
        // Thiết lập các hằng số
        MSG_GEN_TIME_PERIOD =
                getParentModule()->par("MSG_GEN_TIME_PERIOD").doubleValue();
        TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
        EXB_SIZE = par("EXB_SIZE").intValue();
        CHANNEL_DELAY = 0.0001;

        string myName = getName();
        numSpacesOfNextENB = getParentModule()->getModuleByPath(".sw0_0_0")->par("ENB_SIZE").intValue();

        scheduleAt(0, new cMessage("generate"));
        scheduleAt(0, new cMessage("send"));
    }
    /**************************************
     *              RECEIVER
     */
    else {
        // Thiết lập hằng số
        TIMEOUT = getParentModule()->par("TIMEOUT").doubleValue();
        INTERVAL = getParentModule()->par("INTERVAL").doubleValue();

        // Khởi tạo mảng lưu kết quả
        arrayLength = TIMEOUT / INTERVAL;
        receivedMsgCount = new int[arrayLength];
        memset(receivedMsgCount, 0, arrayLength * sizeof(int));

        scheduleAt(0, new cMessage("nextInterval"));
    }

}

void Host::handleMessage(cMessage *msg) {
    /**************************************
     *               SENDER
     */
    if (isSender) {
        // Kiểm tra TIMEOUT
        if (simTime() >= TIMEOUT) {
            delete msg;
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
    /**************************************
     *              RECEIVER
     */
    else {
        // Kiểm tra TIMEOUT
        if (simTime() >= TIMEOUT) {
            delete msg;
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
}

void Host::finish() {
    if (!isSender) {
        int sum = 0;
        for (int i = 0; i < arrayLength; i++) {
            sum += receivedMsgCount[i];
        }
        EV << "Số gói tin nhận được: " << sum << endl;
        EV << "-------------------" << endl;
    }
}

void Host::generateMessage() {
    SQ.push(++lastestMsgId);
}

void Host::SQtoEXB() {
    if (!SQ.empty()) {
        int msgId = SQ.front();
        SQ.pop();
        EXB.push(msgId);
    }
}

void Host::sendMsg() {
    if (!EXB.empty()) {
        // Lấy ra id gói tin chuẩn bị gửi
        int sentMsgId = EXB.front();
        EXB.pop();

        // Tạo gói tin (giả lập)
        cPacket *packet = new cPacket("testMsg");

        // Kích thước gói tin: 100Mbps
        packet->setBitLength(100000);

        // Gắn id cho gói tin
        packet->addPar("msgId");
        packet->par("msgId").setLongValue(sentMsgId);

        // Gắn địa chỉ đích
        packet->addPar("dst");
        packet->par("dst").setStringValue(pairHostName.c_str());

        // Gửi
        send(packet, "port$o", 0);
    }
}

void Host::incNumSpacesOfNextENB() {
    numSpacesOfNextENB++;
}
