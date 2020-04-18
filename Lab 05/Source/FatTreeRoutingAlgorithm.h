#ifndef FATTREEROUTINGALGORITHM_H_
#define FATTREEROUTINGALGORITHM_H_

#include <string>
#include <map>
#include <utility> // pair<>
#include <tuple> // tuple<>
#include <array>
#include <algorithm> // suffle
#include <random>       // std::default_random_engine
#include <chrono>       // std::chrono::system_clock
#include <iostream>
#include <list>

#include "RoutingPath.h"
#include "FatTreeGraph.h"

using namespace std;

class FatTreeRoutingAlgorithm
{
private:
	FatTreeGraph G;
	map<pair<int, int>, RoutingPath> precominsertedPaths;
	map<int, map<int, int>> suffixTables;
	map<int,
		map<tuple<int, int, int>, int>> prefixTables;
	map<int,
		map<pair<int, int>, int>> corePrefixTables;
	void buildTables();
public:
	
	FatTreeRoutingAlgorithm();

	FatTreeRoutingAlgorithm(FatTreeGraph G, bool precominserted);

	void PrintTables();

	int next(int source, int current, int destination);

	RoutingPath path(int source, int destination);
};

#endif