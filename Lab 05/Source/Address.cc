#include "Address.h"
#include <string>

using namespace std;

Address::Address() {

}

Address::Address(int _1, int _2, int _3, int _4) {
    this->_1 = _1;
    this->_2 = _2;
    this->_3 = _3;
    this->_4 = _4;
}


string Address::toString() {
    string delimiter = ".";
    return to_string(_1) + delimiter + to_string(_2) + delimiter + to_string(_3) + delimiter + to_string(_4);
}


