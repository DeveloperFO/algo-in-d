import std.stdio;
import std.algorithm;
import std.array;
import std.range;
import std.typecons;
import std.conv;

const double infinity = double.infinity;

struct Edge
{
    int destination;
    double weight;
}

void dijkstra(int source, Edge[][] graph, out double[] dist, out int[] prev)
{
    int numVertices = graph.length;

    dist.length = numVertices;
    prev.length = numVertices;

    foreach (i; 0..numVertices)
    {
        dist[i] = infinity;
        prev[i] = -1;
    }

    dist[source] = 0;
    PriorityQueue!(Tuple!(double, int)) pq;

    pq.insert(tuple(0.0, source));

    while (!pq.empty)
    {
        auto tuple = pq.front;
        double currentDistance = tuple[0];
        int currentVertex = tuple[1];
        pq.popFront();

        if (currentDistance > dist[currentVertex])
            continue;

        foreach (edge; graph[currentVertex])
        {
            int neighbor = edge.destination;
            double weight = edge.weight;
            double distance = dist[currentVertex] + weight;

            if (distance < dist[neighbor])
            {
                dist[neighbor] = distance;
                prev[neighbor] = currentVertex;
                pq.insert(tuple(distance, neighbor));
            }
        }
    }
}

void printShortestPath(int source, int target, int[] prev)
{
    int current = target;
    auto path = appender!int;

    while (current != -1)
    {
        path.put(current);
        current = prev[current];
    }

    path.put(target);

    auto pathArray = path.data;
    pathArray.reverse;

    write("Shortest Path from ", source, " to ", target, ": ");
    foreach (i, vertex; pathArray)
    {
        if (i != 0)
            write(" -> ");
        write(vertex);
    }
    writeln();
}
