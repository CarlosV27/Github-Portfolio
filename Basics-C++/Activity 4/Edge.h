#pragma once

template<class T>
struct Edge
{
	T fuente;
	T destino;
	Edge();
	Edge(T fuente, T destino);
};

template<class T>
Edge<T>::Edge()
{

}

template<class T>
Edge<T>::Edge(T fuente, T destino)
{
	this->fuente = fuente;
	this->destino = destino;
}
