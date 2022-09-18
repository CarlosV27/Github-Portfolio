#pragma once

using namespace std;

struct IpAdj
{
	string ips;
	int adj;
	IpAdj(string ips, int adj);
	bool operator<(IpAdj IpAdj2);
	bool operator>(IpAdj IpAdj2);
	bool operator<=(IpAdj IpAdj2);
	bool operator>=(IpAdj IpAdj2);
	friend ostream& operator<<(ostream& os, const IpAdj& ip);
};

IpAdj::IpAdj(string ips, int adj)
{
	this->ips = ips;
	this->adj = adj;
}

bool IpAdj::operator<(IpAdj ip2)
{
	return(adj < ip2.adj);
}

bool IpAdj::operator>(IpAdj ip2)
{
	return(adj > ip2.adj);
}

bool IpAdj::operator<=(IpAdj ip2)
{
	return(adj <= ip2.adj);
}

bool IpAdj::operator>=(IpAdj ip2)
{
	return(adj >= ip2.adj);
}

ostream& operator<<(ostream& os, const IpAdj& ip)
{
	os << "Ip: " << ip.ips << endl <<"Cantidad de Ips adjacentes: " << ip.adj << endl;
	return os;
}