#ifndef HashTable_h
#define HashTable_h

#include <vector>

using namespace std;

template<class T>
class HashTable
{
	private:
		vector<T> tabla;
		int size;
		int hashing(T dato);
        string borrarPunto(string ip);
	public:
        HashTable(int size);
		HashTable(vector<T> tab);
		int find(T dato);
		void add(T dato);
};

template<class T>
HashTable<T>::HashTable(int size)
{
    tabla.resize(size, "");
    this->size = size;
}

template<class T>
HashTable<T>::HashTable(vector<T> tab)
{
	size = tab.size();
    for (auto dato : tabla)
    {
        add(dato);
    }
}

template<class T>
int HashTable<T>::hashing(T dato)
{
    unsigned long long int datoNum = stoull(borrarPunto(dato));
    int index = datoNum % size;
    if (tabla[index] == "")
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
            if (new_index > tabla.size())
            {
                new_index -=size;
            }
            if (tabla[new_index] == "")
            {
                return new_index;
            }
            count++;
        }
    }
}

template<class T>
void HashTable<T>::add(T dato)
{
    tabla[hashing(dato)] = dato;
}

template<class T>
int HashTable<T>::find(T dato)
{
    unsigned long long int datoNum = stoull(borrarPunto(dato));
    int index = datoNum % size;
    if (tabla[index] == dato)
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
            if (new_index > tabla.size())
            {
                new_index -= size;
            }
            if (tabla[new_index] == dato)
            {
                return new_index;
            }
            count++;
        }
    }
}

template<class T>
string HashTable<T>::borrarPunto(string ip)
{
    string concat;
    for (int i = 0; i < ip.size(); i++)
    {
        if (ip[i] != '.')
        {
            concat += ip[i];
        }
    }
    return concat;
}
#endif 

