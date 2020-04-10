#include <omnetpp.h>
#include <string.h>

using namespace omnetpp;

class SimpleHost: public cSimpleModule {
private:
    int counter = 0;
    int limit = 0;
protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(SimpleHost);

void SimpleHost::initialize() {
    limit = par("limit").intValue();
    WATCH(counter);
    if (strcmp(getFullName(), "host[0]") == 0){
        cMessage *msg = new cMessage("hello");
        send(msg, "out");
    }
}

void SimpleHost::handleMessage(cMessage *msg) {
    counter++;
    if (counter < limit){
        send(msg, "out");
    }
    else{
        delete msg;
    }
}
