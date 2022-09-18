//Carlos Alberto Ramírez Viche - A00832076
//ITESM

#include <iostream>
#include <string>
#include <fstream>
//#include <vector>
#include "Date.h"
#include "Binnacle.h"
#include "DoublyLinkedList.h"
#include "Queue.h"

using namespace std;

void print_record_bin(Binnacle& bitac)
{
    cout << bitac.access_date.get_string_month() << " " << bitac.access_date.get_day() << " " << bitac.access_date.get_string_hour() << " " << bitac.ip << bitac.message << endl;
}

void print_complete_binnacle(DoublyLinkedList<Binnacle>& bitac)
{
    for (size_t i = 0; i != bitac.getSize(); i++)
    {
        print_record_bin(bitac[i]);
    }
}

void print_selective(DoublyLinkedList<Binnacle>& bitac, int inferior, int superior, DoublyLinkedList<Binnacle>& save)
{
    if (superior > inferior)
    {
        for (int i = inferior; i <= superior; i++)
        {
            print_record_bin(bitac[i]);
            save.addLast(bitac[i]);
        }
    }
    else
    {
        for (int i = inferior; i >= superior; i--)
        {
            print_record_bin(bitac[i]);
            save.addLast(bitac[i]);
        }
    }
}

void save_binnacle(DoublyLinkedList<Binnacle>& bitac, ofstream& file)
{
    for (size_t i = 0; i != bitac.getSize(); i++)
    {
        file << bitac[i].access_date.get_string_month() << " " << bitac[i].access_date.get_day() << " " << bitac[i].access_date.get_string_hour() << " " << bitac[i].ip << bitac[i].message << endl;
    }
}

int search_index(DoublyLinkedList<Binnacle> bitc, int cual, Date busca)
{
    while (true)
    {
        int left = 0;
        int right = bitc.getSize() - 1;
        int mid = (left + right) / 2;
        while (left <= right)
        {
            if (bitc[mid].access_date == busca) 
            {
                return mid;
            }
            else 
            {
                if (busca > bitc[mid].access_date)
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
        if (cual == 1)
        {
            busca.increase_date();
        }
        else
        {
            busca.decrease_date();
        }
    }
}

int main()
{
    DoublyLinkedList<Binnacle> binnacle_vector, searching;
    ifstream file_binnacle;
    file_binnacle.open("Binnacle.txt");
    ofstream out_binnacle_sort, out_binnacle_sort;
    out_binnacle_sort.open("out_searching.txt");
    out_binnacle_sort.open("out_sorting.txt");

    string month, ip, hour, message;
    int day, inf, sup;

    while (file_binnacle >> month)
    {
        file_binnacle >> day >> hour >> ip;
        getline(file_binnacle, message);
        Date DateReg(day, month, hour);
        Binnacle bitacoraNueva(DateReg, ip, message);
        binnacle_vector.addLast(bitacoraNueva);
    }

    binnacle_vector.sort_list(0, binnacle_vector.getSize()-1);

    string month_search, hour_search;
    int day_search;

    cout << "Enter the Start Date of the search: " << endl;
    cout << "Month (abbreviated): ";
    cin >> month_search;
    cout << "Day: ";
    cin >> day_search;
    cout << "Hour (Format hh:mm:ss): ";
    cin >> hour_search;

    Date limite_inf(day_search, month_search, hour_search);

    cout << "Enter the End Date of the search: " << endl;
    cout << "Month (abbreviated): ";
    cin >> month_search;
    cout << "Day: ";
    cin >> day_search;
    cout << "Hour (Format hh:mm:ss): ";
    cin >> hour_search;

    Date limite_sup(day_search, month_search, hour_search);

    if (limite_sup > limite_inf)
    {
        inf = search_index(binnacle_vector, 1, limite_inf);
        sup = search_index(binnacle_vector, 2, limite_sup);
    }
    else
    {
        inf = search_index(binnacle_vector, 2, limite_inf);
        sup = search_index(binnacle_vector, 1, limite_sup);
    }

    cout << endl << "Results: " << endl;

    print_selective(binnacle_vector, inf, sup, searching);

    save_binnacle(searching, out_binnacle_sort);
    save_binnacle(binnacle_vector, out_binnacle_sort);

    file_binnacle.close();
    out_binnacle_sort.close();
    out_binnacle_sort.close();
    return 0;
}