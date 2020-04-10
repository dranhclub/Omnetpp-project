#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include <vector>
#include <queue>
#include <list>
#include <math.h>

using namespace omnetpp;
using namespace std;

class MyMessage: public cMessage {
public:
    list<int> path; // Đường đi của tin nhắn
};

// Một gateID đi đến một nodeID duy nhất
class MyGate {
public:
    int gateID;
    int nodeID;
    MyGate(int gateID, int nodeID) {
        this->gateID = gateID;
        this->nodeID = nodeID;
    }
};

class Txc_l3b2: public cSimpleModule {
private:
    // Mảng lưu tất cả thông tin về cách kết nối của các nút qua các cổng như thế nào
    static vector<MyGate> *gates;

    // Mảng đánh dấu các nút đã đi qua
    static bool *visited;

    // Hàm tìm đường từ nút hiện tại đến nút cần tìm
    list<int> findPathTo(int nodeToFind);

    // Hàm tìm nút gần nhất với nút hiện tại mà chưa đi qua
    int closestNotVisiedNode();

protected:
    virtual void initialize() override;
    virtual void finish() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Txc_l3b2);

// Khai báo 2 mảng static
vector<MyGate> *Txc_l3b2::gates = new vector<MyGate> [100];
bool *Txc_l3b2::visited = new bool[100]{0};

list<int> Txc_l3b2::findPathTo(int nodeToFind) {
    queue<list<int>> myqueue;
    bool visited[100] = { 0 };
    list<int> initList = { getIndex() };
    myqueue.push(initList);
    while (!myqueue.empty()) {
        list<int> path = myqueue.front();
        myqueue.pop();
        int node = path.back();

        if (node == nodeToFind) {
            return path;
        }

        visited[node] = true;

        for (MyGate g : gates[node]) {
            int n = g.nodeID;
            if (!visited[n]) {
                list<int> newPath(path);
                newPath.push_back(n);
                myqueue.push(newPath);
            }
        }
    }
}

int Txc_l3b2::closestNotVisiedNode() {
    double pos_x_1 = par("pos_x").doubleValue();
    double pos_y_1 = par("pos_y").doubleValue();
    double pos_x_2 = 0;
    double pos_y_2 = 0;

    int closestNode = -1;
    double minDistance = 99999;

    for (int id = 0; id < 100; id++) {
        if (id != getIndex() && !visited[id]) {
            if (id < 64) {
                const double offset = 50;
                pos_x_2 = id / 8 * 1000 / 8 + offset;
                pos_y_2 = id % 8 * 1000 / 8 + offset;
            } else {
                const double offset = 110;
                pos_x_2 = (id - 64) / 6 * 1000 / 8 + offset;
                pos_y_2 = (id - 64) % 6 * 1000 / 8 + offset;
            }

            double distance = sqrt(
                    (pos_x_1 - pos_x_2) * (pos_x_1 - pos_x_2)
                            + (pos_y_1 - pos_y_2) * (pos_y_1 - pos_y_2));
            if (minDistance > distance) {
                minDistance = distance;
                closestNode = id;
            }
        }
    }
    EV << "destination = " << closestNode << endl;
    return closestNode;
}

void InitGatesInfo(vector<MyGate> *gates) {
    // Tạo danh sách các kết nối (chỉ chạy 1 lần khi khởi tạo nút 0)
    // Kết nối dọc, ngang cho 64 nút chẵn
    for (int i = 0; i < 64; i++) {
        for (int j = 0; j < 64; j++) {
            if (i + 1 == j && i % 8 != 7 || i + 8 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }

    // Kết nối dọc, ngang cho 36 nút lẻ
    for (int i = 64; i < 100; i++) {
        for (int j = 64; j < 100; j++) {
            if (i + 1 == j && (i - 64) % 6 != 5 || i + 6 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }

    // Kết nối chéo
    for (int i = 0; i <= 5; i++) {
        for (int j = 64; j <= 69; j++) {
            if (i + 64 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }
    for (int i = 8; i <= 13; i++) {
        for (int j = 70; j <= 75; j++) {
            if (i + 62 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }
    for (int i = 16; i <= 21; i++) {
        for (int j = 76; j <= 81; j++) {
            if (i + 60 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }
    for (int i = 24; i <= 29; i++) {
        for (int j = 82; j <= 87; j++) {
            if (i + 58 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }
    for (int i = 32; i <= 37; i++) {
        for (int j = 88; j <= 93; j++) {
            if (i + 56 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }
    for (int i = 40; i <= 45; i++) {
        for (int j = 94; j <= 99; j++) {
            if (i + 54 == j) {
                gates[i].push_back(*(new MyGate(gates[i].size(), j)));
                gates[j].push_back(*(new MyGate(gates[j].size(), i)));
            }
        }
    }

//    EV << "Initialized gates array:" <<endl;
//    for (int i = 0; i < 100; i++){
//        EV << "i = " << i << endl;
//        for (MyGate g : gates[i]){
//            EV << "gateID = " << g.gateID << ", " << "nodeID = " << g.nodeID << endl;
//        }
//    }
//    EV << "-----------------------" << endl;
}

void printPath(list<int> path) {
    EV << "path:";
    for (int i : path) {
        EV << i << "-";
    }
    EV << endl;
}

void Txc_l3b2::initialize() {
    // Đặt vị trí
    int id = getIndex();
    if (id < 64) {
        const double offset = 50;
        par("pos_x").setDoubleValue(id / 8 * 1000 / 8 + offset);
        par("pos_y").setDoubleValue(id % 8 * 1000 / 8 + offset);
    } else {
        const double offset = 110;
        par("pos_x").setDoubleValue((id - 64) / 6 * 1000 / 8 + offset);
        par("pos_y").setDoubleValue((id - 64) % 6 * 1000 / 8 + offset);
    }

    if (id == 0)
        InitGatesInfo(gates);

    // Khởi tạo tin nhắn
    if (id == 0) {
        MyMessage *msg = new MyMessage();
        scheduleAt(0, msg);
    }
}

void Txc_l3b2::finish(){
//    delete gates;
//    delete visited;
}

void Txc_l3b2::handleMessage(cMessage *_msg) {
    MyMessage *msg = check_and_cast<MyMessage*>(_msg);

    // Hiển thị màu vàng cho nút đã đi qua
    setDisplayString("i=block/routing,gold;p=$pos_x,$pos_y");

    // Đã đi tới đích, tìm đích mới rồi gửi đi
    if (msg->path.empty()) {
        int destination = closestNotVisiedNode();

        // Kiểm tra kết thúc
        if (destination < 0){
            EV << "DONE";
            cancelAndDelete(msg);
            return;
        }

        // Tìm đường đi
        msg->path = findPathTo(destination);

        // Đặt text cho tin nhắn
        msg->setName(
                ("from " + to_string(getIndex()) + " to " + to_string(destination)).c_str());

        printPath(msg->path);

        msg->path.pop_front(); // Bỏ nút đầu dư thừa trong path
    }

    // Lấy tiếp theo trong path để gửi
    int nextNodeId = msg->path.front();
    msg->path.pop_front();

    // Tìm cổng để gửi
    int gateToSend = -1;
    for (MyGate g : gates[getIndex()]) {
        if (g.nodeID == nextNodeId) {
            gateToSend = g.gateID;
        }
    }

    // Đánh dấu đã đi qua
    visited[getIndex()] = true;

    // Gửi
    send(msg, "gate$o", gateToSend);

}


