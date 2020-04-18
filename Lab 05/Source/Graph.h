#ifndef GRAPH_H_
#define GRAPH_H_


#include <vector>

using namespace std;

class Graph{
public:
    Graph() {

    }

    void addEdge(int v, int w);

    int E;
    int V;

    vector<int>* adj;

    int degree(int u);

    virtual vector<int> hosts();

    virtual vector<int> switches();

    virtual bool isHostVertex(int v);

    virtual bool isSwitchVertex(int v);

private:
    void validateVertex(int v);
};

#endif
