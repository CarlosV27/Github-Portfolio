#ifndef Heap_h
#define Heap_h

#include <vector>;
#include <stack>

using namespace std;

template<class T>
class Heap
{
	private:
		vector<T> heap;
		int size;
		void swap(int a, int b);
		void downSort(int pos);
	public:
		Heap();
		Heap(vector<T> lista);
		void push(T dato);
		T remove();
		void heapSort(string order);
		//Sobrecargu� el m�todo HeapSort para adecuarlo y hacer que en lugar de imprimir el Heap ordenado lo guarde enfilehivo que paso como parametro
		void heapSort(string order, ofstream& file);
		//Cree un m�todo que imprime en pantalla las 5 Ips con m�s accesos ordenadas de forma descendente
		void cincoMasAcc();
		bool isEmpty();
		int getSize();
		void print();
};

template<class T>
Heap<T>::Heap()
{
	size = 0;
}

template<class T>
Heap<T>::Heap(vector<T> lista)
{
	if (lista.size() > 0)
	{
		heap = lista;
		size = lista.size();
		int aux = lista.size() / 2 - 1;
		while (aux >= 0)
		{
			int pos = aux;
			downSort(pos);
			aux--;
		}	
	}
}

template<class T>
void Heap<T>::swap(int a, int b)
{
	T aux = heap[a];
	heap[a] = heap[b];
	heap[b] = aux;
}

template<class T>
void Heap<T>::downSort(int pos)
{
	while ((2 * pos + 1) < size)
	{
		int hijo1 = 2 * pos + 1;
		int hijo2 = 2 * pos + 2;
		int hijoM;
		if ((hijo2) < size)
		{
			heap[hijo1] >= heap[hijo2] ? hijoM = hijo1 : hijoM = hijo2;
		}
		else
		{
			hijoM = hijo1;
		}
		if (heap[pos] < heap[hijoM])
		{
			swap(pos, hijoM);
			pos = hijoM;
		}
		else
		{
			pos = size;
		}
	}
}

template<class T>
T Heap<T>::remove()
{
	if (!isEmpty())
	{
		T aux = heap[0];
		swap(0, size - 1);
		heap.pop_back();
		size--;
		downSort(0);
		return aux;
	}
	else
	{
		throw out_of_range("El heap est� vac�o");
	}
}

//Tom� una secci�n de c�digo del m�todo HeapSort y solamente agregu� un formato para la salida
template<class T>
void Heap<T>::cincoMasAcc()
{
	Heap<T> auxHeap = heap;
	cout << "5 Ips con m�s acceso:" << endl;
	for (int i = 1; i <= 5; i++)
	{
		cout << i << ".- " << auxHeap.remove() << endl;
	}
	cout << endl;
}

template<class T>
void Heap<T>::heapSort(string order)
{
	Heap<T> auxHeap = heap;
	stack<T> auxStack;
	if (order == "asc")
	{
		while (!auxHeap.isEmpty())
		{
			auxStack.push(auxHeap.remove());
		}
		while (!auxStack.empty())
		{
			cout << auxStack.top() << endl;
			auxStack.pop();
		}
		cout << endl;
	}
	else
	{
		while (!auxHeap.isEmpty())
		{
			cout << auxHeap.remove() << endl;
		}
		cout << endl;
	}
}

//Este m�todo lo �nico que modifiqu� es que en lugar de cout los Nodos que voy sacando del Heap auxiliar los guardo filerchivo que paso como parametro
template<class T>
void Heap<T>::heapSort(string order, ofstream& file)
{
	Heap<T> auxHeap = heap;
	stack<T> auxStack;
	if (order == "asc")
	{
		while (!auxHeap.isEmpty())
		{
			auxStack.push(auxHeap.remove());
		}
		while (!auxStack.empty())
		{
			file << auxStack.top() << endl;
			auxStack.pop();
		}
		file << endl;
	}
	else
	{
		while (!auxHeap.isEmpty())
		{
			file << auxHeap.remove() << endl;
		}
		file << endl;
	}
}

template<class T>
void Heap<T>::push(T dato)
{
	heap.push_back(dato);
	size++;
	int pos = size - 1;
	while (pos != 0)
	{
		int padre = (pos - 1) / 2;
		if (heap[padre] < heap[pos])
		{
			swap(padre, pos);
			pos = padre;
		}
		else
		{
			pos = 0;
		}
	}
}

template<class T>
void Heap<T>::print()
{
	for (auto el : heap)
	{
		cout << el << " ";
	}
	cout << endl;
}

template<class T>
int Heap<T>::getSize()
{
	return size;
}

template<class T>
bool Heap<T>::isEmpty()
{
	return (size == 0);
}

#endif