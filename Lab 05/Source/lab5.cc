#include <omnetpp.h>
#include <string>
#include <algorithm> // suffle
#include <random>       // std::default_random_engine
#include <chrono>       // std::chrono::system_clock
#include <iostream>

#include "FatTreeGraph.h"
#include "FatTreeRoutingAlgorithm.h"

using namespace omnetpp;
using namespace std;

class Node : public cSimpleModule{
protected:
    virtual void initialize();
};

Define_Module(Node);

void Node::initialize() {

    if (strcmp(getName(), "_10_0_0_1") == 0){
        cout << "/////////////////////////  LAB 5A   //////////////////////////////" << endl;
        // Xây dựng bảng định tuyến
        // Ví dụ cho trường hợp k = 4
        int k = 4;
        FatTreeGraph fatTreeGraph(4);
        FatTreeRoutingAlgorithm* ftra = new FatTreeRoutingAlgorithm(fatTreeGraph, true);

        // In ra màn hình
        ftra->PrintTables();



        cout << "/////////////////////////  LAB 5B   //////////////////////////////" << endl;
        // Ghép cặp ngẫu nhiên các hosts

        // Xác định các hosts
        vector<int> hosts;
        int numEachPod = k * k / 4 + k;
        for (int p = 0; p < k; p++) {
            int offset = numEachPod * p;

            for (int e = 0; e < k / 2; e++) {
                for (int s = 0; s < k / 2; s++) {
                    int server = offset + e * k / 2 + s;
                    hosts.push_back(server);
                }
            }
        }

        // Trộn ngẫu nhiên:
        // obtain a time-based seed:
        unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
        shuffle(hosts.begin(), hosts.end(), std::default_random_engine(seed));

        vector<pair<int,int>> randomPairs;
        int p = 0;
        int temp;
        for (auto i : hosts) {
            if (++p == 2) {
                p = 0;
                randomPairs.push_back(pair<int,int>(i,temp));
            }
            temp = i;
        }

        // In ra màn hình
        cout << "Danh sach host:" << endl;
        for (auto i : hosts) {
            cout << fatTreeGraph.getAddress(i).toString() << endl;
        }
        cout << endl;
        cout << "Ghep cap ngau nhien: " << endl;
        for (pair<int, int> p : randomPairs) {
            cout << fatTreeGraph.getAddress(p.first).toString() << " - " << fatTreeGraph.getAddress(p.second).toString() << endl;
        }
        cout << endl;




        cout << "/////////////////////////  LAB 5C   //////////////////////////////" << endl;
        // Với từng cặp nguồn nguồn đích, in ra đường đi giữa chúng, căn cứ vào bảng định tuyến
        for (pair<int, int> p : randomPairs) {
            cout << "Routing path of " <<
                fatTreeGraph.getAddress(p.first).toString()
                << " -> "
                << fatTreeGraph.getAddress(p.second).toString()
                << " :" << endl;

            cout << fatTreeGraph.getAddress(p.first).toString() << " -> ";
            for (int node : ftra->path(p.first, p.second).path) {
                cout << fatTreeGraph.getAddress(node).toString() << " -> ";
            }
            cout << fatTreeGraph.getAddress(p.second).toString() << endl;

            cout << endl;
        }
    }
}
