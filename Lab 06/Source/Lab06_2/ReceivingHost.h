#ifndef __LAB06_2_RECEIVING_HOST_H_
#define __LAB06_2_RECEIVING_HOST_H_

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

#endif
