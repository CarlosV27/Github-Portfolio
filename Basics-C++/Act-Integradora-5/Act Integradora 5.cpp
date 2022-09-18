#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <vector>
#include "HashTable.h"

using namespace std;

int get_hash_index(unsigned long long int ip, vector<string> vectIp, string ip_search)
{
    int index = ip % 21121;
    if (vectIp[index] == ip_search)
    {
        return index;
    }
    else
    {

        int count = 1, new_index;
        while (true)
        {
            new_index = index;
            new_index += count * count;
            if (new_index > vectIp.size())
            {
                new_index -= vectIp.size();
            }
            if (vectIp[new_index] == ip_search)
            {
                return new_index;
            }
            count++;
        }
    }
    return -1;
}

void print_adjacent(vector<vector<string>> vectAdj, int ip_index)
{
    cout << "Adjacent IPs:" << endl;
    for (int i = 0; i < vectAdj[ip_index].size(); i++)
    {
        cout << "\t" << vectAdj[ip_index][i] << endl;
    }
}

int main()
{
    ifstream archIp;
    archIp.open("binnacle_graph.txt");


    HashTable<string> tablaIp(21121);
    vector<string> vectAux;
    vector<vector<string>> vectAdj(21121, vectAux);
    string ip;

    int cantIp, cantInci;

    archIp >> cantIp >> cantInci;

    for (int i = 0; i < cantIp; i++)
    {
        archIp >> ip;
        tablaIp.add(ip);
    }

    string month, hour, ipOri, ipDest, incidence;
    int day, ip_index;

    for (int i = 0; i < cantInci; i++)
    {
        archIp >> month >> day >> hour >> ipOri >> ipDest;
        getline(archIp, incidence);

        string ipOriCut = ipOri.substr(0, ipOri.find(":"));
        string ipDestCut = ipDest.substr(0, ipDest.find(":"));

        ip_index = tablaIp.find(ipOriCut);

        vectAdj[ip_index].push_back(ipDestCut);
        
    }

    int continue_search = 1;
    string ip_search;
    while (continue_search != 0)
    {
        cout << "Enter the IP you want to search for (in 127.0.0.1 format):";
        cin >> ip_search;
        ip_index = tablaIp.find(ip_search);
        print_adjacent(vectAdj, ip_index);
        cout << "Do you want to search for another IP? 1 = YES, 0 = NO" << endl;
        cin >> continue_search;
    }

    archIp.close();

    return 0;
}

