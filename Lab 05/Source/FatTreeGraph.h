#ifndef FATTREEGRAPH_H_
#define FATTREEGRAPH_H_

#include "Graph.h"
#include "Address.h"
#include<list>
#include<vector>

class FatTreeGraph : public Graph {
private:
    int numServers;
    int numPodSwitches;
    int numCores;
    int k;


    void buildAddress();
public:
    static const int CORE = 1;
    static const int AGG = 2;
    static const int EDGE = 3;

    Address *address;

    FatTreeGraph() {};
    FatTreeGraph(int k);

    int getNumServers();
    int getNumPodSwitches();
    int getNumCores();


    int getK();

    Address getAddress(int u);

    vector<int> hosts();

    vector<int> switches();

    bool isHostVertex(int u);

    bool isSwitchVertex(int u);

    int switchType(int u);
};


#endif
