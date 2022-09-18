#ifndef Queue_h
#define Queue_h

#include "Nodo.h"

using namespace std;

template<class T>
class Queue
{
	private:
		Nodo<T>* head;
		Nodo<T>* tail;
		int size;
	public:
		Queue();
		void push(T dato);
		T pop();
		T front();
		T back();
		void imprimir();
		int getSize();
		bool isEmpty();
		T& operator[](int index);
};

template<class T>
Queue<T>::Queue()
{
	size = 0;
	this->head = nullptr;
	this->tail = nullptr;
}

template<class T>
void Queue<T>::push(T dato)
{
	Nodo<T>* aux = new Nodo<T>(dato);
	if (isEmpty())
	{
		head = aux;
		tail = aux;
	}
	else
	{
		tail->siguiente = aux;
		tail = aux;
	}
	size++;
}

template<class T>
T Queue<T>::pop()
{
	if (!isEmpty)
	{
		Nodo<T>* aux = head;
		T dato = aux->dato;
		head = aux->siguiente;
		delete aux;
		size--;
		if (head == nullptr)
		{
			tail = nullptr;
		}
		return dato;
	}
	else
	{
		throw runtime_error("La cola est� vac�a");
	}
}

template<class T>
T& Queue<T>::operator[](int index)
{
	if (index > size || index < 0)
	{
		throw out_of_range("index fuera de rango");
	}
	else
	{
		int count = 0;
		Nodo<T>* aux = head;
		while (count != index)
		{
			aux = aux->siguiente;
			count++;
		}
		return aux->dato;
	}
}

template<class T>
T Queue<T>::front()
{
	if (!isEmpty())
	{
		return head->dato;
	}
	throw runtime_error("La cola est� vac�a");
}

template<class T>
T Queue<T>::back()
{
	if (!isEmpty())
	{
		return tail->dato;
	}
	throw runtime_error("La cola est� vac�a");
}

template<class T>
bool Queue<T>::isEmpty()
{
	return(head == nullptr);
}

template<class T>
int Queue<T>::getSize()
{
	return size;
}

template<class T>
void Queue<T>::imprimir()
{
	Nodo<T>* aux = head;

	while (aux != nullptr)
	{
		cout << aux->dato << " ";
		aux = aux->siguiente;
	}
	cout << endl;
}

#endif