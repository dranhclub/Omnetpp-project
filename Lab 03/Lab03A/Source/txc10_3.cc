#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include <vector>
#include "tictoc10_3_m.h"

using namespace omnetpp;

class Txc10_3: public cSimpleModule {
private:
    std::vector<TicTocMsg10_3*> neighbors; // Lưu thông tin các nút láng giềng
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Txc10_3);

void Txc10_3::initialize() {
    // Tạo một mẫu thông điệp chứa thông tin về tên và bậc của nút gửi
    TicTocMsg10_3 *msg = new TicTocMsg10_3();
    msg->setSrc_name(getFullName());
    msg->setSrc_degree(gateSize("gate"));

    // Gửi bản sao thông điệp tới tất cả các nút láng giềng
    for(int i = 0; i < gateSize("gate"); i++){
        TicTocMsg10_3 *copyMsg = new TicTocMsg10_3(*msg);
        send(copyMsg, "gate$o", i);
    }

    // Xoá mẫu
    delete msg;
}

void Txc10_3::handleMessage(cMessage *msg) {
    TicTocMsg10_3 *ttmsg = check_and_cast<TicTocMsg10_3*>(msg);

    // Tạm lưu lại thông điệp vào danh sách
    neighbors.push_back(ttmsg);

    if(neighbors.size() == gateSize("gate")){
        // Đã nhận đủ thông điệp, in ra danh sách các nút láng giềng
        EV << "Neighbors of " << getFullName() << ":" << endl;
        for(auto m : neighbors){
            EV << m->getSrc_name() << " with degree = " << m->getSrc_degree() << endl;
            delete m;
        }
    }
}
