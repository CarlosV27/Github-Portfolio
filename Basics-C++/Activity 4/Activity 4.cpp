#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include "Graph.h"

using namespace std;

int main()
{
    ifstream archIp;
    archIp.open("binnacle_graph.txt");

    vector<string> vectIp;
    string ip;

    int cantIp, cantInci;

    archIp >> cantIp >> cantInci;

    for (int i = 0; i < cantIp; i++)
    {
        archIp >> ip;
        vectIp.push_back(ip);
    }
    
    Graph<string> ip_graph(vectIp);

    string month, hour, ipOri, ipDest, incidence;
    int day;

    for (int i = 0; i < cantInci; i++)
    {
        archIp >> month >> day >> hour >> ipOri >> ipDest;
        getline(archIp, incidence);
        ip_graph.insert(Edge<string>(ipOri.substr(0, ipOri.find(":")), ipDest.substr(0, ipDest.find(":"))));
    }

    ip_graph.highAdj();

    archIp.close();

    return 0;
}

