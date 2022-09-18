#pragma once

template<class T>
struct NodoD
{
	T dato;
	NodoD<T>* anterior;
	NodoD<T>* siguiente;
	NodoD(T dato);
	NodoD(T dato, NodoD<T>* siguiente, NodoD<T>* anterior);
};

template<class T>
NodoD<T>::NodoD(T dato)
{
	this->dato = dato;
	this->siguiente = nullptr;
	this->anterior = nullptr;
}

template<class T>
NodoD<T>::NodoD(T dato, NodoD<T>* siguiente, NodoD<T>* anterior)
{
	this->dato = dato;
	this->siguiente = siguiente;
	this->anterior = anterior;
}

