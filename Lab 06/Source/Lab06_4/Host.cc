#include <string.h>
#include <omnetpp.h>
#include <string>

using namespace omnetpp;
using namespace std;

class Host: public cSimpleModule {
private:

protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Host);

void Host::initialize() {

}

void Host::handleMessage(cMessage *msg) {

}
