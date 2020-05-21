#include <string.h>
#include <omnetpp.h>
#include <string>
#include "Routing.h"
#include "Switch.h"

using namespace omnetpp;
using namespace std;

Define_Module(Switch);

void Switch::initialize() {
    Routing* r = Routing::getInstance();
    routingTable = r->getRoutingTable(getName());
    printRoutingTable();
}

void Switch::handleMessage(cMessage *msg) {
    string dstName = string(msg->par("dst").stringValue());
    EV << "switch " << getName() << endl;
    EV << "dstName = " << dstName << endl;
    int portOut = routingTable.at(dstName);
    EV << "portOut = " << portOut;
    send(msg, "port$o", portOut);
}

void Switch::printRoutingTable() {
    EV << "Routing table at " << getName() << " :" << endl;
    for (auto it = routingTable.begin(); it != routingTable.end(); it++) {
        EV << it->first << " | " << it->second << endl;
    }
}
