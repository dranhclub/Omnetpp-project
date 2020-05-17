#include "Routing.h"
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <queue>
#include <list>

using namespace std;

Routing *Routing::singleton_ = nullptr;

Routing::Routing(){
    init();
}

Routing* Routing::getInstance() {
    if (singleton_ == nullptr) {
        singleton_ = new Routing();
    }
    return singleton_;
}

void Routing::init() {
    string line;
    ifstream myfile("./ConnectionsList.txt");
    vector<vector<string>> vec;
    if (myfile.is_open())
    {
        while (getline(myfile, line))
        {
            char buffer[7];
            int i = 0;
            vec.push_back(*new vector<string>);
            for (auto it = line.begin(); it != line.end(); it++) {
                if (*it != ' ') {
                    buffer[i++] = *it;
                }
                else {
                    string s = string(buffer, i);
                    vec.back().push_back(s);
                    i = 0;
                }
            }
            string s = string(buffer, i);
            vec.back().push_back(s);
        }
        myfile.close();
    }

    else cout << "Unable to open file";

    for (auto v : vec) {
        for (auto s : v) {
            cout << s << " ";
        }
        cout << "\n";
    }


    map<string, int> switchesMap;
    map<string, int> hostsMap;
    int k = 0;
    for (auto line : vec) {
        switchesMap.insert(pair<string, int>(line.front(), k));
        hostsMap.insert(pair<string, int>(line.back(), 1000 + k));
        k++;
    }

    size = vec.size();
    conn = new int* [size];

    for (int i = 0; i < vec.size(); i++) {
        conn[i] = new int[7];
        for (int j = 0; j < 6; j++) {
            conn[i][j] = switchesMap.at(vec[i][j + 1]);
        }
        conn[i][6] = hostsMap.at(vec[i][7]);
    }

    for (int i = 0; i < vec.size(); i++) {
        for (int j = 0; j < 7; j++) {
            cout << conn[i][j] << " ";
        }
        cout << endl;
    }

    printPath(0, 20);
}

int Routing::next(int src, int dst) {
    if (src == dst) {
        return -1;
    }
    bool* visited = new bool[size] {false};
    queue<list<pair<int, int>>> myqueue;
    for (int i = 0; i < 6; i++) {
        list<pair<int, int>> l1;
        l1.push_back(pair<int, int>(conn[src][i], i));
        myqueue.push(l1);
    }
    visited[src] = true;
    while (!myqueue.empty()) {
        list<pair<int, int>> l1 = myqueue.front();
        myqueue.pop();
        int hop = l1.back().first;
        if (hop == dst) {
            return l1.front().second;
        }
        for (int i = 0; i < 6; i++) {
            if (!visited[conn[hop][i]]) {
                list<pair<int, int>> l2(l1);
                l2.push_back(pair<int, int>(conn[hop][i], i));
                myqueue.push(l2);
            }
        }
        visited[hop] = true;
    }
    return -2;
}

void Routing::printPath(int src, int dst) {
    cout << "path from " << src << " to " << dst << endl;
    int nextPort = next(src, dst);
    while (nextPort != -1) {
        printf_s("(%d,%d)->", src, nextPort);
        src = conn[src][nextPort];
        nextPort = next(src, dst);
    }
    cout << dst;
}
