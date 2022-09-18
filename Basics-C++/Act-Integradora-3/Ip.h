#pragma once
#include <string>
#include "Binnacle.h"

struct Ip
{
	//String que guarda el valor de la Ip sin considerar los puertos
	string ipCad;
	//Cantidad de registros que provienen de la misma direcci�n Ip
	int cantIp;
	//Vector en donde almacenado todas los registros de Bitacoras que tengan la misma Ip
	vector<Binnacle> bitacoras;
	Ip();
	Ip(string ipCad, Binnacle newBitacora);
	void appenBitc(Binnacle bitc);
	bool operator<(Ip ip2);
	bool operator>(Ip ip2);
	bool operator<=(Ip ip2);
	bool operator>=(Ip ip2);
	//Sobrecarga del operador << para poder imprimir la Ip en el formato que quer�a sin tener que cambiar algo en otros m�todos
	friend ostream& operator<<(ostream& os, const Ip& ip);
};

Ip::Ip()
{
	ipCad = "";
	cantIp = 0;
}

Ip::Ip(string ipCad, Binnacle newBitacora)
{
	cantIp = 0;
	this->ipCad = ipCad.substr(0, 13);
	bitacoras.push_back(newBitacora);
	cantIp++;
}

void Ip::appenBitc(Binnacle bitc)
{
	bitacoras.push_back(bitc);
	cantIp++;
}

bool Ip::operator<(Ip ip2)
{
	return(cantIp < ip2.cantIp);
}

bool Ip::operator>(Ip ip2)
{
	return(cantIp > ip2.cantIp);
}

bool Ip::operator<=(Ip ip2)
{
	return(cantIp <= ip2.cantIp);
}

bool Ip::operator>=(Ip ip2)
{
	return(cantIp >= ip2.cantIp);
}

//Con esto logr� que se imprimiera primero la Ip y luego de eso la cantidad de accesos que tuvo para no modificar otros m�todos como el HeapSort
ostream& operator<<(ostream& os, const Ip& ip)
{
	os << "Ip: " << ip.ipCad << "\tCantidad de accesos: " << ip.cantIp;
	return os;
}