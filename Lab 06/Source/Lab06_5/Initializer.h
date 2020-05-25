#ifndef INITIALIZER_H_
#define INITIALIZER_H_


#include <string>
#include <vector>

class Initializer {
protected:
    Initializer();
    static Initializer *singleton_;

    const int N = 3;
    unsigned seed;
    std::vector<std::string> hostNames;
public:
    Initializer(Initializer &other) = delete;
    void operator=(const Initializer&) = delete;

    static Initializer* getInstance();

    bool getDuty(std::string hostName);
    std::string getPairHostName(std::string hostName);
};
#endif
