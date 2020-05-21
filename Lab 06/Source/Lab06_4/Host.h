#ifndef __LAB06_4_HOST_H__
#define __LAB06_4_HOST_H__

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

#endif
