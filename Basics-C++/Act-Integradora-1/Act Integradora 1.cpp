//Carlos Alberto Ramírez Viche - A00832076
//ITESM

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "Date.h"
#include "Binnacle.h"

using namespace std;

//Prints a specific record of the Binnacle
void print_record_bin(Binnacle& bitac)
{
    cout << bitac.access_date.get_string_month() << " " << bitac.access_date.get_day() << " " << bitac.access_date.get_string_hour() << " " << bitac.ip << bitac.message << endl;
}

//Prints all the records in the Binnacle
void print_complete_binnacle(vector<Binnacle>& bitac)
{
    for (size_t i = 0; i != bitac.size(); i++)
    {
        print_record_bin(bitac[i]);
    }
}

//Function that prints the records of a Binnacle-type vector according to a range and also saves those values in another result vector
void print_selective(vector<Binnacle>& bitac, int inferior, int superior, vector<Binnacle>& save)
{
    if (superior > inferior)
    {
        for (int i = inferior; i <= superior; i++)
        {
            print_record_bin(bitac[i]);
            save.push_back(bitac[i]);
        }
    }
    else
    {
        for (int i = inferior; i >= superior; i--)
        {
            print_record_bin(bitac[i]);
            save.push_back(bitac[i]);
        }
    }
}

//Function that saves all the records of a Binnacle vector in a file
void save_binnacle(vector<Binnacle>& bitac, ofstream& file)
{
    for (size_t i = 0; i != bitac.size(); i++)
    {
        file << bitac[i].access_date.get_string_month() << " " << bitac[i].access_date.get_day() << " " << bitac[i].access_date.get_string_hour() << " " << bitac[i].ip << bitac[i].message << endl;
    }
}

//Merge Sort functions
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

//Function that does the binary search of the object of type Date that the user creates
int search_index(vector<Binnacle> bitc, int cual, Date busca)
{
    while (true)
    {
        int left = 0;
        int right = bitc.size() - 1;
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
    vector<Binnacle> binnacle_vector, original, searching;
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
        binnacle_vector.push_back(bitacoraNueva);
    }

    original = binnacle_vector;

    sort_list(binnacle_vector, 0, binnacle_vector.size() - 1);

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