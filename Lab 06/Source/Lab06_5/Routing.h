#ifndef ROUTING_H_
#define ROUTING_H_

#include <string>
#include <vector>
#include <map>

class Routing {
protected:
    Routing();
    static Routing *singleton_;

    // Ma trận kết nối
    int **conn;
    int size;

    // Danh sách kề
    std::vector<std::vector<std::string>> adjList;

    // Map từ tên sang số hiệu
    std::map<std::string, int> switchesMap;
    std::map<std::string, int> hostsMap;


    void init();
    int next(int src, int dst);
    void printPath(int src, int dst);
    int next(const char *src, const char *dst);
public:
    Routing(Routing &other) = delete;
    void operator=(const Routing&) = delete;

    static Routing* getInstance();

    std::vector<std::vector<std::string>> getAdjList();

    std::map<std::string, int> getRoutingTable(const char *srcName);

};
#endif /* ROUTING_H_ */
