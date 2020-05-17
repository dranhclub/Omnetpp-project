#include <string.h>
#include <omnetpp.h>
#include <string>
#include "routing.h"

using namespace omnetpp;
using namespace std;

class Switch: public cSimpleModule {
private:

protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Switch);

void Switch::initialize() {
    Routing* r = Routing::getInstance();
}

void Switch::handleMessage(cMessage *msg) {

}
