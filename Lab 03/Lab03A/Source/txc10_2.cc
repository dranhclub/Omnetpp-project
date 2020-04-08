#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include "tictoc10_2_m.h"

using namespace omnetpp;

class Txc10_2: public cSimpleModule {
protected:
    virtual void forwardMessage(TicTocMsg10_2 *msg);
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Txc10_2);

void Txc10_2::initialize() {
    if (par("sendOnInit").boolValue()) {
        TicTocMsg10_2 *msg = new TicTocMsg10_2("hello");
        for (int i = 0; i < 9; i++) {
            msg->setVisited(i, false);
        }
        scheduleAt(0.0, msg);
    }
}

void Txc10_2::handleMessage(cMessage *msg) {
    TicTocMsg10_2 *ttmsg = check_and_cast<TicTocMsg10_2*>(msg);

    // Đánh dấu nút đã đi qua
    ttmsg->setVisited(getIndex(), true);

    // Tăng giá trị hop count
    ttmsg->setHopCount(ttmsg->getHopCount() + 1);

    // Kiểm tra xem đã đi hết các nút hay chưa
    bool visitedAll = true;
    for (int i = 0; i < 9; i++) {
        if (ttmsg->getVisited(i) == false) {
            visitedAll = false;
            break;
        }
    }

    if (visitedAll) {
        // Done
        EV << "Visited all, hop count = " << ttmsg->getHopCount();
        delete msg;
    } else {
        forwardMessage(ttmsg);
    }
}

void Txc10_2::forwardMessage(TicTocMsg10_2 *msg) {
    int n = gateSize("gate");
    int k = intuniform(0, n-1);

    EV << "Forwarding message " << msg << " on gate[" << k << "]\n";
    send(msg, "gate$o", k);
}
