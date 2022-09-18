#ifndef Graph_h
#define Graph_h

#include <vector>
#include <algorithm>
#include <queue>
#include "Edge.h"
#include "Heap.h"
#include "IpAdj.h"

using namespace std;

template<class T>
class Graph
{
	private:
		vector<vector<Edge<T>>> adjLista;
		vector<T> vertices;
		int numVertices;
		int findVertice(T vertice);
	public:
		Graph();
		Graph(vector<T> vertices);
		void print();
		void insert(Edge<T> edge);
		void remove(Edge<T> edge);
		void bfs(T vertice);
		void highAdj();
};

template<class T>
Graph<T>::Graph()
{
	numVertices = 0;
}

template<class T>
Graph<T>::Graph(vector<T> vertices)
{
	this->vertices = vertices;
	numVertices = vertices.size();
	vector<Edge<T>> edge;
	for (int i = 0; i < numVertices; i++)
	{
		adjLista.push_back(edge);
	}
}

template<class T>
int Graph<T>::findVertice(T vertice)
{
	auto it = find(vertices.begin(), vertices.end(), vertice);
	if (it != vertices.end())
	{
		int index = it - vertices.begin();
		return index;
	}
	else
	{
		return -1;
	}
}

template<class T>
void Graph<T>::insert(Edge<T> edge)
{
	int indiceFuente = findVertice(edge.fuente);
	if(indiceFuente == -1)
	{
		vertices.push_back(edge.fuente);
		indiceFuente = numVertices;
		numVertices++;
		vector<Edge<T>> edge;
		adjLista.push_back(edge);
	}
	int indiceDestino = findVertice(edge.destino);
	if (indiceDestino == -1)
	{
		vertices.push_back(edge.destino);
		indiceDestino = numVertices;
		numVertices++;
		vector<Edge<T>> edge;
		adjLista.push_back(edge);
	}
	adjLista[indiceFuente].push_back(edge);
}

template<class T>
inline void Graph<T>::bfs(T vertice)
{
	int indiceVertice = findVertice(vertice);
	if (indiceVertice >= 0)
	{
		queue<int> visited;
		vector<bool> status(numVertices, false);
		status[indiceVertice] = true;
		visited.push(indiceVertice);
		while (!visited.empty())
		{
			indiceVertice = visited.front();
			for (auto adj : adjLista[indiceVertice])
			{
				int adjIndice = findVertice(adj.target);
				if (adjIndice >= 0)
				{
					if (!status[adjIndice])
					{
						visited.push(adjIndice);
						status[adjIndice] = true;
					}
				}
			}
			cout << vertices[indiceVertice] << " ";
			visited.pop();
		}
		cout << endl;
	}
}

template<class T>
void Graph<T>::print()
{
	for (int i = 0; i < numVertices; i++)
	{
		cout << vertices[i] << " -> ";
		for (auto edge : adjLista[i])
		{
			cout << edge.destino << " : " << edge.peso << " - ";
		}
		cout << endl;
	}
}

template<class T>
void Graph<T>::highAdj()
{
	vector<IpAdj> ipAux;
	for (int i = 0; i < numVertices; i++)
	{
		ipAux.push_back(IpAdj(vertices[i], adjLista[i].size()));
	}
	Heap<IpAdj> heapAux(ipAux);

	cout << "Ip con m�s adyacencias: " << endl << endl;
	cout << heapAux.remove() << endl;
}

#endif