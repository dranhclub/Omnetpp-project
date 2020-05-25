#ifndef __SWITCH_H__
#define __SWITCH_H__

#include <string.h>
#include <omnetpp.h>
#include <string>
#include "routing.h"

using namespace omnetpp;
using namespace std;

class Switch: public cSimpleModule {
private:
    map<string, int> routingTable;

    void printRoutingTable();
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

#endif
