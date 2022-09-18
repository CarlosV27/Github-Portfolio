//#ifndef DoublyLinkedList_h
//#define DoublyLinkedList_h

#include "NodoD.h"
#include "Queue.h"

using namespace std;

template<class T>
class DoublyLinkedList
{
	private:
		NodoD<T>* head;
		NodoD<T>* tail;
		int size;
	public:
		DoublyLinkedList();
		void operator=(DoublyLinkedList<T> lista);
		void operator=(initializer_list<T> lista);
		T& operator[](int index);
		void addFirst(T dato);
		void addLast(T dato);
		void push(T dato);
		bool deleteData(T dato);
		bool deleteAt(int index);
		T& getData(int index);
		void updateAt(int index, T valorNuevo);
		void updateData(T valorBusq, T valorNuevo);
		void insertAt(int index, T valorNuevo);
		int findData(T dato);
		void clear();
		void print();
		//void printReverse();
		bool isEmpty();
		int getSize();
		void merge(int star, int mid, int end);
		void sort_list(int start, int end);
};

template<class T>
DoublyLinkedList<T>::DoublyLinkedList()
{
	head = nullptr;
	tail = nullptr;
	size = 0;
}

template<class T>
void DoublyLinkedList<T>::addFirst(T dato)
{
	if (isEmpty())
	{
		head = new NodoD<T>(dato);
		tail = head;
	}
	else
	{
		head->anterior = new NodoD<T>(dato, head, nullptr);
		head = head->anterior;
	}
	size++;
}

template<class T>
void DoublyLinkedList<T>::addLast(T dato)
{
	if (isEmpty())
	{
		tail = new NodoD<T>(dato);
		head = tail;
	}
	else
	{
		tail->siguiente = new NodoD<T>(dato, nullptr, tail);
		tail = tail->siguiente;
	}
	size++;
}

template<class T>
void DoublyLinkedList<T>::push(T dato)
{
	if (isEmpty())
	{
		tail = new NodoD<T>(dato);
		head = tail;
	}
	else
	{
		tail->siguiente = new NodoD<T>(dato, nullptr, tail);
		tail = tail->siguiente;
	}
	size++;
}

template<class T>
T& DoublyLinkedList<T>::getData(int index)
{
	if (index >= 0 && index < size)
	{
		NodoD<T>* aux;
		if (index < size / 2)
		{
			aux = head;
			int indiceAux = 0;
			while (indiceAux < index)
			{
				aux = aux->siguiente;
				indiceAux++;
			}
		}
		else
		{
			aux = tail;
			int indiceAux = size - 1;
			while (indiceAux > index)
			{
				aux = aux->anterior;
				indiceAux--;
			}
		}
		return aux->dato;
	}
	else
	{
		throw out_of_range("�ndice fuera de rango");
	}
}

template<class T>
T& DoublyLinkedList<T>::operator[](int index)
{
	if (index >= 0 && index < size)
	{
		NodoD<T>* aux;
		if (index < size / 2)
		{
			aux = head;
			int indiceAux = 0;
			while (indiceAux < index)
			{
				aux = aux->siguiente;
				indiceAux++;
			}
		}
		else
		{
			aux = tail;
			int indiceAux = size - 1;
			while (indiceAux > index)
			{
				aux = aux->anterior;
				indiceAux--;
			}
		}
		return aux->dato;
	}
	else
	{
		throw out_of_range("�ndice fuera de rango");
	}
}

template<class T>
void DoublyLinkedList<T>::operator=(initializer_list<T> lista) {
	if (isEmpty()) {
		for (T data : lista) {
			push(data);
		}
	}
	else {
		throw runtime_error("Error: DoublyLinkedList no esta vacia");
	}
}

template<class T>
void DoublyLinkedList<T>::operator=(DoublyLinkedList<T> lista)
{
	clear();
	if (!lista.isEmpty())
	{
		NodoD<T>* aux = lista.head();
		while (aux != nullptr)
		{
			push(aux->dato);
			aux = aux->siguiente;
		}
		size = lista.size();
	}
}

template<class T>
int DoublyLinkedList<T>::findData(T dato)
{
	NodoD<T>* aux = head;
	int indiceAux = 0;
	while (aux != nullptr)
	{
		if (aux->dato == dato)
		{
			return indiceAux;
		}
		else
		{
			aux = aux->siguiente;
			indiceAux++;
		}
	}
	return -1;
}

template<class T>
bool DoublyLinkedList<T>::deleteAt(int index)
{
	if(index >=0 && index < size)
	{
		NodoD<T>* aux;
		if (index < size / 2)
		{
			aux = head;
			int indiceAux = 0;
			while (indiceAux < index)
			{
				aux = aux->siguiente;
				indiceAux++;
			}
		}
		else
		{
			aux = tail;
			int indiceAux = size - 1;
			while (indiceAux > index)
			{
				aux = aux->anterior;
				indiceAux--;
			}
		}
		if (head == tail)
		{
			head = nullptr;
			tail = nullptr;
		}
		else
		{
			if (aux == head)
			{
				head = head->siguiente;
				head->anterior = nullptr;
			}
			else
			{
				if (aux == tail)
				{
					tail = tail->anterior;
					tail->siguiente = nullptr;
				}
				else
				{
					aux->anterior->siguiente = aux->siguiente;
					aux->siguiente->anterior = aux->anterior;
				}
			}
		}
		delete aux;
		size--;
		return true;
	}
	else
	{
		return false;
	}
}

template<class T>
bool DoublyLinkedList<T>::deleteData(T dato)
{
	if (!isEmpty())
	{
		NodoD<T>* aux = head;
		while (aux->dato != dato && aux != nullptr)
		{
			aux = aux->siguiente;
		}
		if (aux != nullptr)
		{
			if (head == tail)
			{
				head = nullptr;
				tail = nullptr;
			}
			else
			{
				if (aux == head)
				{
					head = head->siguiente;
					head->siguiente = nullptr;
				}
				else
				{
					if (aux == tail)
					{
						tail = tail->anterior;
						tail->siguiente = nullptr;
					}
					else
					{
						aux->anterior->siguiente = aux->siguiente;
						aux->siguiente->anterior = aux->anterior;
					}
				}
			}
		}
		delete aux;
		size--;
		return true;
	}
	else
	{
		return false;
	}
}

template<class T>
void DoublyLinkedList<T>::updateAt(int index, T valorNuevo)
{
	if (index >= 0 && index < size)
	{
		NodoD<T>* aux;
		if (index < size / 2)
		{
			aux = head;
			int indiceAux = 0;
			while (indiceAux < index)
			{
				aux = aux->siguiente;
				indiceAux++;
			}
		}
		else
		{
			aux = tail;
			int indiceAux = size - 1;
			while (indiceAux > index)
			{
				aux = aux->anterior;
				indiceAux--;
			}
		}
		aux->dato = valorNuevo;
	}
	else
	{
		throw out_of_range("�ndice fuera de rango");
	}
}

template<class T>
void DoublyLinkedList<T>::updateData(T datoBusq, T nuevoValor)
{
	if (!isEmpty())
	{
		NodoD<T>* aux = head;
		while (aux->dato != datoBusq && aux != nullptr)
		{
			aux = aux->siguiente;
		}
		if (aux != nullptr)
		{
			aux->dato = nuevoValor;
		}
		else
		{
			throw out_of_range("Dato no encontrado");
		}
	}
	else
	{
		throw out_of_range("Lista vac�a");
	}
}

template<class T>
void DoublyLinkedList<T>::insertAt(int index, T nuevoValor)
{
	if (index >= 0 && index < size)
	{
		NodoD<T>* aux;
		if (index < size / 2)
		{
			aux = head;
			int indiceAux = 0;
			while (indiceAux < index)
			{
				aux = aux->siguiente;
				indiceAux++;
			}
		}
		else
		{
			aux = tail;
			int indiceAux = size - 1;
			while (indiceAux > index)
			{
				aux->anterior;
				indiceAux--;
			}
		}
		if (aux == head)
		{
			head->anterior = new NodoD<T>(nuevoValor, head, nullptr);
			head = head->anterior;
		}
		else
		{
			aux->anterior->siguiente = new NodoD<T>(nuevoValor, aux, aux->anterior);
			aux->anterior = aux->anterior->siguiente;
		}
		size++;
	}
	else
	{
		throw out_of_range("�ndice fuera de rango");
	}
}

template<class T>
void DoublyLinkedList<T>::print()
{
	if (!isEmpty())
	{
		NodoD<T>* aux = head;
		while (aux != nullptr)
		{
			cout << aux->dato << " ";
			aux = aux->next;
		}
		cout << endl;
	}
	else
	{
		cout << "Lista vac�a" << endl;
	}
}

//template<class T>
//void DoublyLinkedList<T>::printReverse()
//{
//	if (!isEmpty())
//	{
//		NodoD<T>* aux = tail;
//		while (aux != nullptr)
//		{
//			cout << aux->dato << " ";
//			aux = aux->anterior;
//		}
//		cout << endl;
//	}
//	else
//	{
//		cout << "Lista vac�a" << endl;
//	}
//}

template<class T>
void DoublyLinkedList<T>::clear()
{
	if (!isEmpty())
	{
		NodoD<T>* aux = head;
		while (aux != nullptr)
		{
			head = aux->siguiente;
			delete aux;
			aux = head;
		}
		size = 0;
		tail = nullptr;
	}
}

template<class T>
bool DoublyLinkedList<T>::isEmpty()
{
	return size == 0;
}

template<class T>
int DoublyLinkedList<T>::getSize()
{
 	return size;
}

//Funci�n de ordenamiento usando el m�todo de Merge Sort incorporando colas
template <class T>
void DoublyLinkedList<T>::merge(int start, int mid, int end) {
	Queue<T> left;
	Queue<T> right;
	int leftSize = mid - start + 1;
	int rightSize = end - mid;
	for (int i = 0; i < leftSize; i++) {
		left.push(this->getData(start + i));
	}
	for (int i = 0; i < rightSize; i++) {
		right.push(this->getData(i + mid + 1));
	}
	int pos = start;
	int leftPos = 0;
	int rightPos = 0;
	while (leftPos < leftSize && rightPos < rightSize) {
		if (left[leftPos] < right[rightPos]) {
			this->getData(pos) = left[leftPos];
			leftPos++;

		}
		else {
			this->getData(pos) = right[rightPos];
			rightPos++;
		}
		pos++;
	}
	while (leftPos < leftSize) {
		this->getData(pos) = left[leftPos];
		leftPos++;
		pos++;
	}
	while (rightPos < rightSize) {
		this->getData(pos) = right[rightPos];
		rightPos++;
		pos++;
	}
}

template <class T>
void DoublyLinkedList<T>::sort_list(int start, int end)
{
	if (end > start) {
		int mid = (start + end) / 2;
		sort_list(start, mid);
		sort_list(mid + 1, end);
		merge(start, mid, end);
	}
}

//#endif

