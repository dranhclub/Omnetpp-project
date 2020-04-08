#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include <list>

using namespace omnetpp;
using namespace std;

// Lớp lưu thông tin về một bước di chuyển của tin nhắn
class Step {
public:
    string nodeName; // Tên của nút gửi
    int gateIndex; // Cổng dùng để gửi
    bool isReturnStep; // Có phải là bước quay lại hay không?

    Step(string nodeName, int gateIndex, bool isReturnStep) {
        this->nodeName = nodeName;
        this->gateIndex = gateIndex;
        this->isReturnStep = isReturnStep;
    }

    // So sánh bỏ qua thuộc tính isReturnStep
    bool equals(Step other) {
        return other.gateIndex == gateIndex && other.nodeName.compare(nodeName) == 0;
    }
};

// Lớp tin nhắn, dành riêng cho bài này
class TicToc10_4_msg: public cMessage {
public:
    int source; // Index của nút gửi
    int ** connectionMatrix; // Ma trận kết nối

    list<Step> stack; // Stack dùng để lưu các bước di chuyển theo cách duyệt DFS

    // Hàm kiểm tra xem một bước đi đã tồn tại trong stack hay chưa,
    // Nếu đã tồn tại thì xoá cái cũ đi
    // Sau đó push cái mới vào
    void checkAndPush(Step newStep){
        for(auto it = stack.begin(); it!=stack.end(); ++it){
            if(newStep.equals(*it)){
                stack.erase(it);
                break;
            }
        }
        stack.push_back(newStep);
    }
};

class Txc10_4: public cSimpleModule {
private:
    bool visited = false; // Đánh dấu nút đã thăm
protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Txc10_4);

void Txc10_4::initialize() {
    // Bắt đầu từ nút nguồn
    if (par("sendOnInit").boolValue()) {
        // Khởi tạo tin nhắn
        TicToc10_4_msg *msg = new TicToc10_4_msg();

        // Khởi tạo ma trận kết nối với tất cả các phần từ bằng 0
        msg->connectionMatrix = new int*[9];
        for (int i = 0; i < 9; i++) {
            msg->connectionMatrix[i] = new int[9];
            for (int j = 0; j < 9; j++) {
                msg->connectionMatrix[i][j] = 0;
            }
        }

        // Khởi tạo stack
        for (int i = 0; i < gateSize("gate"); i++) {
            msg->stack.push_back(*(new Step(getFullName(), i, false)));
        }

        // Đánh dấu đã thăm nút nguồn
        visited = true;

        msg->source = getIndex();

        // Lấy ra cổng đầu tiên để gửi (lấy top stack)
        int nextGate = (msg->stack.back()).gateIndex;

        send((cMessage*) msg, "gate$o", nextGate);
    }
}

void Txc10_4::handleMessage(cMessage *cMsg) {
    TicToc10_4_msg *msg = (TicToc10_4_msg*) cMsg;
    bool isReturnStep = msg->stack.back().isReturnStep;
    msg->stack.pop_back();

    if (!isReturnStep){
        // Điền vào ma trận
        int index1 = msg->source;
        int index2 = getIndex();
        msg->connectionMatrix[index1][index2] = 1;
        msg->connectionMatrix[index2][index1] = 1;

        // Tạo 1 bước đi để quay lại nút trước rồi push vào stack
        cGate* arrivalGate = msg->getArrivalGate();
        Step *returnStep = new Step(getFullName(), arrivalGate->getIndex(), true);
        msg->checkAndPush(*returnStep);


        if (!visited){
            // Tạo các bước đi mới (không trùng lặp với bước quay lại vừa tạo ở trên), rồi push vào stack
            for (int i = 0; i < gateSize("gate"); i++){
                if (gate("gate$i", i) != arrivalGate){
                    Step *newStep = new Step(getFullName(), i, false);
                    msg->checkAndPush(*newStep);
                }
            }
        }

        // Đánh dấu đã thăm nút hiện tại
        visited = true;
    }

    // Nếu stack rỗng tức là đã duyệt xong
    if (msg->stack.empty()) {
        EV << "Connection matrix: " << endl;
        for(int i = 0; i < 9; i++){
            for(int j = 0; j < 9; j++){
                EV << msg->connectionMatrix[i][j] << " ";
            }
            EV << endl;
        }
        delete msg;
    }
    else{
        // Lấy ra cổng tiếp theo (top stack) rồi gửi đi.
        int nextGate = (msg->stack.back()).gateIndex;
        msg->source = getIndex();
        send((cMessage*) msg, "gate$o", nextGate);
    }
}

