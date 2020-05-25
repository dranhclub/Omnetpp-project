#include "Initializer.h"
#include <vector>
#include <string>
#include <iostream>     // std::cout
#include <algorithm>    // std::shuffle
#include <random>       // std::default_random_engine
#include <chrono>       // std::chrono::system_clock

using namespace std;

Initializer *Initializer::singleton_ = nullptr;

Initializer* Initializer::getInstance() {
    if (singleton_ == nullptr) {
        singleton_ = new Initializer();
    }
    return singleton_;
}

Initializer::Initializer() {
    seed = std::chrono::system_clock::now().time_since_epoch().count();

    for (int x = 0; x < N; x++) {
        for (int y = 0; y < N; y++) {
            for (int z = 0; z < N; z++) {
                char name[10];
                sprintf(name, "h%d_%d_%d", x, y, z);
                hostNames.push_back(string(name));
            }
        }
    }

    shuffle(hostNames.begin(), hostNames.end(),
            std::default_random_engine(seed));

    std::cout << "shuffled elements:";
    for (auto &x : hostNames)
        std::cout << ' ' << x;
    std::cout << '\n';
}

bool Initializer::getDuty(std::string hostName) {
    for (int i = 0; i < hostNames.size() / 2; i++) {
        if (hostNames[i].compare(hostName) == 0) {
            return true;
        }
    }
    return false;
}

string Initializer::getPairHostName(std::string hostName) {
    int thisIndex = -1;
    int size = hostNames.size();
    for (int i = 0; i < size; i++) {
        if (hostNames[i].compare(hostName) == 0) {
            thisIndex = i;
            break;
        }
    }

    if (thisIndex == -1) {
        throw "ERROR";
    }

    if (thisIndex < size / 2) {
        return hostNames[thisIndex + size / 2];
    }
    else {
        return hostNames[thisIndex - size / 2];
    }
}
