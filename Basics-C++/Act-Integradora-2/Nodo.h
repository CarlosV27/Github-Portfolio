#pragma once

template<class T>
struct Nodo
{
	T dato;
	Nodo<T> *siguiente;
	Nodo();
	Nodo(T dato);
	Nodo(T dato, Nodo<T>* siguiente);
};

template<class T>
Nodo<T>::Nodo()
{
	this->siguiente = nullptr;
}

template<class T>
Nodo<T>::Nodo(T dato)
{
	this->dato = dato;
	this->siguiente = nullptr;
}

template<class T>
Nodo<T>::Nodo(T dato, Nodo<T>* siguiente)
{
	this->dato = dato;
	this->siguiente = siguiente;
}

