//Carlos Alberto Ramírez Viche - A00832076
//ITESM

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "Heap.h"
#include "Ip.h"

using namespace std;

template <class T>
void merge(vector<T>& list, int start, int mid, int end) {
    vector<T> left;
    vector<T> right;
    int leftSize = mid - start + 1;
    int rightSize = end - mid;
    for (int i = 0; i < leftSize; i++) {
        left.push_back(list[start + i]);
    }
    for (int i = 0; i < rightSize; i++) {
        right.push_back(list[i + mid + 1]);
    }
    int pos = start;
    int leftPos = 0;
    int rightPos = 0;
    while (leftPos < leftSize && rightPos < rightSize) {
        if (left[leftPos] < right[rightPos]) {
            list[pos] = left[leftPos];
            leftPos++;

        }
        else {
            list[pos] = right[rightPos];
            rightPos++;
        }
        pos++;
    }
    while (leftPos < leftSize) {
        list[pos] = left[leftPos];
        leftPos++;
        pos++;
    }
    while (rightPos < rightSize) {
        list[pos] = right[rightPos];
        rightPos++;
        pos++;
    }
}

template <class T>
void sort_list(vector<T>& list, int start, int end)
{
    if (end > start) {
        int mid = (start + end) / 2;
        sort_list(list, start, mid);
        sort_list(list, mid + 1, end);
        merge(list, start, mid, end);
    }
}

void save_file_ip(Heap<Ip> heapP, ofstream& file)
{
    Heap<Ip> auxHeap = heapP;
    stack<Ip> auxStack;
    while (!auxHeap.isEmpty())
    {
        auxStack.push(auxHeap.remove());
    }
    while (!auxStack.empty())
    {
        file << auxStack.top() << endl;
        sort_list(auxStack.top().bitacoras, 0, auxStack.top().bitacoras.size() - 1);
        for (int i = 0; i < auxStack.top().cantIp; i++)
        {
            file << "\t" << auxStack.top().bitacoras[i] << endl;
        }

        auxStack.pop();
    }
    file << endl;
}

int ip2num(string ipCad)
{
    string concatena;
    for (int i = 0; i < 13; i++)
    {
        if (!(i == 2 || i == 5 || i == 9))
        {
            concatena += ipCad[i];
        }
    }
    return stoi(concatena);
}

template<class T>
int search_index(vector<T> vectorBusq, int busc)
{
    int left = 0;
    int right = vectorBusq.size() - 1;
    int mid = (left + right) / 2;
    while (left <= right)
    {
       if (vectorBusq[mid] == busc)
       {
           return mid;
       }
       else
       {
           if (busc > vectorBusq[mid])
           {
                left = mid + 1;
           }
           else
           {
                right = mid - 1;
           }
       }
       mid = (left + right) / 2;
    }
    return -1;
}

int main()
{
    vector<Ip> vectIp;
    vector<int> ipDif;

    ifstream archIp;
    
    ofstream ipGroup, ipSorted;

    archIp.open("binnacle_Heap.txt");

    ipGroup.open("ip_grouped.txt");
    ipSorted.open("ip_sort.txt");
    
    string month, ip, hour, message;
    int day, inf, sup;

    while (archIp >> month)
    {
        archIp >> day >> hour >> ip;
        getline(archIp, message);
        Date new_date(day, month, hour);
        Binnacle new_binnacle(new_date, message);
        sort_list(ipDif, 0, ipDif.size() - 1);
        int ipNum = ip2num(ip);
        int ip_index = search_index(ipDif, ipNum);
        if (ip_index == -1)
        {
            ipDif.push_back(ipNum);
            Ip new_ip(ip, new_binnacle);
            vectIp.push_back(new_ip);
        }
        else
        {
            vectIp[ip_index].appenBitc(new_binnacle);
        }
    }

    Heap<Ip> heapIp(vectIp);

    save_file_ip(heapIp, ipGroup);

    heapIp.heapSort("asc", ipSorted);

    heapIp.cincoMasAcc();


    archIp.close();
    ipSorted.close();
    ipGroup.close();
    return 0;
}