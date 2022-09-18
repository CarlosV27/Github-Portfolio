#pragma once

using namespace std;

struct Binnacle
{
	Date access_date;
	string ip;
	string message;
	Binnacle();
	Binnacle(Date acc_date, string ip, string message);
	bool operator>(Binnacle binnacle2);
	bool operator<(Binnacle binnacle2);
};

Binnacle::Binnacle()
{
	ip = "";
	message = "";
}

Binnacle::Binnacle(Date acc_date, string ip, string message)
{
	access_date = acc_date;
	this->ip = ip;
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