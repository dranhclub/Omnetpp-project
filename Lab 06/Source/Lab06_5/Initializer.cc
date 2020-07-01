#include "Initializer.h"
#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
#include <random>
#include <chrono>

#define TORUS3D

using namespace std;

Initializer *Initializer::singleton_ = nullptr;

Initializer* Initializer::getInstance() {
    if (singleton_ == nullptr) {
        singleton_ = new Initializer();
    }
    return singleton_;
}

/**
 * Xáo trộn danh sách các host
 */
Initializer::Initializer() {
    randomize();
}

void Initializer::randomize() {
    seed = std::chrono::system_clock::now().time_since_epoch().count();

#ifndef TORUS2D
    for (int x = 0; x < N; x++) {
        for (int y = 0; y < N; y++) {
            for (int z = 0; z < N; z++) {
                char name[10];
                sprintf(name, "h%d_%d_%d", x, y, z);
                hostNames.push_back(string(name));
            }
        }
    }
#else
    for (int x = 0; x < N; x++) {
        for (int y = 0; y < N; y++) {
            char name[10];
            sprintf(name, "h%d_%d_%d", x, y, 0);
            hostNames.push_back(string(name));
        }
    }
#endif

    shuffle(hostNames.begin(), hostNames.end(),
            std::default_random_engine(seed));
}


/**
 * Lấy ra nhiệm vụ của một host (gửi / nhận)
 * hostName: tên host
 * return: true nếu là host gửi, false nếu là host nhận
 */
bool Initializer::getDuty(std::string hostName) {
    for (int i = 0; i < hostNames.size() / 2; i++) {
        if (hostNames[i].compare(hostName) == 0) {
            return true;
        }
    }
    return false;
}

/**
 * Lấy ra nút cặp với host hiện tại
 * hostName: tên host
 * return: tên host còn lại
 */
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
