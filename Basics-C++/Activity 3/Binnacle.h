#pragma once

#include "Date.h"

using namespace std;

struct Binnacle
{
	Date access_date;
	string message;
	Binnacle();
	Binnacle(Date acc_date, string message);
	bool operator>(Binnacle binnacle2);
	bool operator<(Binnacle binnacle2);
	friend ostream& operator<<(ostream& os, const Binnacle& bitc);
};

Binnacle::Binnacle()
{
	message = "";
}

Binnacle::Binnacle(Date acc_date, string message)
{
	access_date = acc_date;
	this->message = message;
}

bool Binnacle::operator<(Binnacle binnacle2)
{
	return (access_date < binnacle2.access_date);
}

bool Binnacle::operator>(Binnacle binnacle2)
{
	return (access_date > binnacle2.access_date);
}

ostream& operator<<(ostream& os, Binnacle& bitc)
{
	os << bitc.access_date.get_string_month() << " " << bitc.access_date.get_string_hour() <<  bitc.message;
	return os;
}