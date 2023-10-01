import std.stdio;
import std.algorithm;
import std.array;
import std.container;

struct Edge
{
    int source, destination;
    double weight;
}

bool edgeComparator(Edge a, Edge b)
{
    return a.weight < b.weight;
}

int find(int[] parent, int vertex)
{
    if (parent[vertex] == -1)
        return vertex;
    return find(parent, parent[vertex]);
}

void unionSets(int[] parent, int x, int y)
{
    int rootX = find(parent, x);
    int rootY = find(parent, y);
    parent[rootX] = rootY;
}

void kruskal(Edge[] edges, int numVertices)
{
    sort(edges, &edgeComparator);

    int[] parent = new int[numVertices];
    foreach (i; 0..numVertices)
    {
        parent[i] = -1;
    }

    Edge[] minimumSpanningTree;

    foreach (edge; edges)
    {
        int sourceRoot = find(parent, edge.source);
        int destinationRoot = find(parent, edge.destination);

        if (sourceRoot != destinationRoot)
        {
            minimumSpanningTree ~= edge;

            unionSets(parent, sourceRoot, destinationRoot);
        }
    }

    writeln("Minimum Spanning Tree:");
    foreach (edge; minimumSpanningTree)
    {
        writeln("Edge (", edge.source, " - ", edge.destination, ") Weight: ", edge.weight);
    }
}
