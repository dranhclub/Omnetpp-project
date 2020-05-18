#include <string.h>
#include <omnetpp.h>
#include <string>
#include "routing.h"

using namespace omnetpp;
using namespace std;

class Switch: public cSimpleModule {
private:
    map<string, int> routingTable;
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Switch);

void Switch::initialize() {
    Routing* r = Routing::getInstance();
    routingTable = r->getRoutingTable(getName());
    EV << "Routing table at " << getName() << " :" << endl;
    for (auto it = routingTable.begin(); it != routingTable.end(); it++) {
        EV << it->first << " | " << it->second << endl;
    }
}

void Switch::handleMessage(cMessage *msg) {

}
