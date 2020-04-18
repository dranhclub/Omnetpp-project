#include "Graph.h"
#include<string>

using namespace std;

void Graph::validateVertex(int v) {
    if (v < 0 || v >= V)
        throw "vertex " + to_string(v) + " is not between 0 and " + to_string(V - 1);
}

void Graph::addEdge(int v, int w) {
    validateVertex(v);
    validateVertex(w);
    E++;
    adj[v].push_back(w);
    adj[w].push_back(v);
}


int Graph::degree(int u) {
    return adj[u].size();
}

vector<int> Graph::hosts()
{
    return vector<int>();
}

vector<int> Graph::switches()
{
    return vector<int>();
}

bool Graph::isHostVertex(int v)
{
    return false;
}

bool Graph::isSwitchVertex(int v)
{
    return false;
}


