#ifndef ROUTING_H_
#define ROUTING_H_

class Routing {
protected:
    Routing();
    static Routing* singleton_;

    int** conn;
    int size;
    void init();
    int next(int src, int dst);
    void printPath(int src, int dst);
public:
    Routing(Routing& other) = delete;
    void operator=(const Routing&) = delete;

    static Routing* getInstance();

};

#endif /* ROUTING_H_ */
