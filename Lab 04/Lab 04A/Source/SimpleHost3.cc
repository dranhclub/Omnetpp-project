#include <omnetpp.h>
#include <string.h>
#include <SimpleMessage_m.h>

using namespace omnetpp;

class SimpleHost3: public cSimpleModule {
private:
    int counter = 0;
    int limit;
    int numHosts;
protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    virtual SimpleMessage* generateMessage();
    virtual void forwardMessage(SimpleMessage *msg);
};

Define_Module(SimpleHost3);

void SimpleHost3::initialize() {
    limit = par("limit").intValue();
    numHosts = getParentModule()->par("numHosts").intValue();
    WATCH(counter);
    if (strcmp(getFullName(), "host[0]") == 0) {
        scheduleAt(0, new cMessage());
    }
}

void SimpleHost3::handleMessage(cMessage *_msg) {

    counter++;

    if (counter == limit && getIndex() == numHosts - 1){
        delete _msg;
        return;
    }

    if (getIndex() == 0) {
        delete _msg;
        send(generateMessage(), "out");
        return;
    }

    SimpleMessage *msg = check_and_cast<SimpleMessage*>(_msg);

    if (getIndex() == numHosts - 1) {
        EV <<"HOP COUNT = " << msg->getHopCount();
        delete msg;
        send(new cMessage(), "out");
    }
    else{
        forwardMessage(msg);
    }
}

SimpleMessage* SimpleHost3::generateMessage() {
    SimpleMessage *msg = new SimpleMessage();
    msg->setSource(0);
    msg->setDestination(numHosts - 1);
    msg->setHopCount(0);
    return msg;
}

void SimpleHost3::forwardMessage(SimpleMessage *msg) {
    msg->setHopCount(msg->getHopCount() + 1);
    send((cMessage*)msg, "out");
}
