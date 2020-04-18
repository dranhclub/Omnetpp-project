#include "FatTreeRoutingAlgorithm.h"

FatTreeRoutingAlgorithm::FatTreeRoutingAlgorithm() {}

FatTreeRoutingAlgorithm::FatTreeRoutingAlgorithm(FatTreeGraph G, bool precominserted) {
	this->G = G;
	buildTables();
	if (precominserted) {
		vector<int> hosts = G.hosts();
		for (int i = 0; i < hosts.size() - 1; i++) {
			for (int j = i + 1; j < hosts.size(); j++) {
				int source = hosts[i];
				int destination = hosts[j];
				path(source, destination);
			}
		}
	}
}

void FatTreeRoutingAlgorithm::PrintTables()
{
	// print tables
	cout << "suffix tables" << endl << endl;
	for (map<int, map<int, int>>::iterator it0 = suffixTables.begin(); it0 != suffixTables.end(); ++it0) {
		cout << "suffix table at address " << G.getAddress(it0->first).toString() << ": " << endl;
		for (map<int, int>::iterator it1 = it0->second.begin(); it1 != it0->second.end(); ++it1) {
			cout << G.getAddress(it1->first).toString() << " - " << G.getAddress(it1->second).toString() << endl;
		}
	}
	cout << "---------------------------------" << endl;;


	cout << "prefix tables" << endl << endl;
	for (map<int, map<tuple<int, int, int>, int>>::iterator it0 = prefixTables.begin(); it0 != prefixTables.end(); ++it0) {
		cout << "prefix table at address " << it0->first << ": " << endl;
		for (map<tuple<int, int, int>, int>::iterator it1 = it0->second.begin(); it1 != it0->second.end(); ++it1) {
			tuple<int, int, int> ip = it1->first;
			int out = it1->second;
			cout << get<0>(ip) << "." << get<1>(ip) << "." << get<2>(ip) << ".0 - " << G.getAddress(out).toString() << endl;
		}
		cout << endl;
	}
	cout << "---------------------------------" << endl;;


	cout << "core prefix tables" << endl << endl;
	for (map<int, map<pair<int, int>, int>>::iterator it0 = corePrefixTables.begin(); it0 != corePrefixTables.end(); ++it0) {
		cout << "core prefix table at address: " << G.getAddress(it0->first).toString() << ": " << endl;
		for (map<pair<int, int>, int>::iterator it1 = it0->second.begin(); it1 != it0->second.end(); ++it1) {
			pair<int, int> ip = it1->first;
			int out = it1->second;
			cout << get<0>(ip) << "." << get<1>(ip) << ".0.0 - " << G.getAddress(out).toString() << endl;
		}
		cout << endl;
	}
	cout << "---------------------------------" << endl;;
}


void FatTreeRoutingAlgorithm::buildTables() {
	// TODO - build prefix - suffix routing table
	int k = G.getK();
	int numEachPod = k * k / 4 + k;

	for (int p = 0; p < k; p++) {
		int offset = numEachPod * p;
		for (int e = 0; e < k / 2; e++) {
			int edgeSwitch = offset + k * k / 4 + e;
			// create suffix table
			map<int, int> suffixTable;
			for (int suffix = 2; suffix <= k / 2 + 1; suffix++) {
				int agg = offset + k * k / 4 + (e + suffix - 2) % (k / 2)
					+ (k / 2);
				suffixTable.insert(pair<int, int>(suffix, agg));
			}
			suffixTables.insert(pair<int, map<int, int>>(edgeSwitch, suffixTable));
		}
	}

	// agg switches
	for (int p = 0; p < k; p++) {
		int offset = numEachPod * p;
		for (int a = 0; a < k / 2; a++) {
			int aggSwitch = offset + k * k / 4 + k / 2 + a;

			// create suffix table
			map < int, int > suffixTable;
			for (int suffix = 2; suffix <= k / 2 + 1; suffix++) {
				int core = a * k / 2 + (suffix + a - 2) % (k / 2)
					+ numEachPod * k;
				suffixTable.insert(pair<int, int>(suffix, core));
			}
			// inject to the behavior
			suffixTables.insert(pair<int, map<int, int>>(aggSwitch, suffixTable));

			// create prefix table
			map<tuple<int, int, int>, int> prefixTable;
			for (int e = 0; e < k / 2; e++) {
				int edgeSwitch = offset + k * k / 4 + e;
				prefixTable.insert(pair<tuple<int, int, int>, int>(tuple<int, int, int>(10, p, e), edgeSwitch));
			}
			prefixTables.insert(pair<int, map<tuple<int, int, int>, int>>(aggSwitch, prefixTable));
		}
	}

	// core switches
	for (int c = 0; c < k * k / 4; c++) {
		int core = k * k * k / 4 + k * k + c;

		// build core prefix
		map<pair<int, int>, int> corePrefixTable;
		for (int p = 0; p < k; p++) {
			int offset = numEachPod * p;
			int agg = (c / (k / 2)) + k / 2 + k * k / 4 + offset;
			corePrefixTable.insert(pair<pair<int, int>, int>(pair<int, int>(10, p), agg));
		}
		corePrefixTables.insert(pair<int, map<pair<int, int>, int>>(core, corePrefixTable));
	}
}


int FatTreeRoutingAlgorithm::next(int source, int current, int destination) {
	if (G.isHostVertex(current)) {
		return G.adj[current][0];
	}
	else if (std::find(G.adj[current].begin(), G.adj[current].end(), destination) != G.adj[current].end()) {
		return destination;
	}
	else {
		int type = G.switchType(current);
		if (type == FatTreeGraph::CORE) {
			Address address = G.getAddress(destination);
			pair<int, int> prefix = pair<int, int>(address._1, address._2);
			map<pair<int, int>, int> corePrefixTable =
				corePrefixTables[current];

			return corePrefixTable[prefix];
		}
		else if (type == FatTreeGraph::AGG) {
			Address address = G.getAddress(destination);

			tuple<int, int, int> prefix = tuple<int, int, int>(address._1, address._2, address._3);
			int suffix = address._4;

			map<tuple<int, int, int>, int> prefixTable =
				prefixTables[current];
			map<int, int> suffixTable = suffixTables[current];

			if (prefixTable.count(prefix)) {
				return prefixTable[prefix];
			}
			else {
				return suffixTable[suffix];
			}
		}
		else { // Edge switch
			Address address = G.getAddress(destination);
			int suffix = address._4;

			map<int, int> suffixTable = suffixTables[current];
			return suffixTable[suffix];
		}

	}
}

RoutingPath FatTreeRoutingAlgorithm::path(int source, int destination) {
	if (precominsertedPaths.count(pair<int, int>(source, destination))) {
		return precominsertedPaths[pair<int, int>(source, destination)];
	}
	else {
		RoutingPath rp;
		int current = source;
		while (current != destination) {
			//                System.out.println(current);
			if (current != source) {
				rp.path.push_back(current);
			}
			current = next(source, current, destination);

		}
		precominsertedPaths.insert(pair<pair<int, int>, RoutingPath>(pair<int, int>(source, destination), rp));
		return rp;
	}
}


