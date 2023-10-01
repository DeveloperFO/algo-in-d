import std.stdio;

const double infinity = double.infinity;

void floydWarshall(double[][] graph)
{
    int numVertices = graph.length;

    double[][] dist = graph.dup;

    for (int k = 0; k < numVertices; k++)
    {
        for (int i = 0; i < numVertices; i++)
        {
            for (int j = 0; j < numVertices; j++)
            {
                if (dist[i][k] + dist[k][j] < dist[i][j])
                    dist[i][j] = dist[i][k] + dist[k][j];
            }
        }
    }

    writeln("Shortest Distances between All Pairs of Vertices:");
    for (int i = 0; i < numVertices; i++)
    {
        for (int j = 0; j < numVertices; j++)
        {
            if (dist[i][j] == infinity)
                write("INF\t");
            else
                write(dist[i][j], "\t");
        }
        writeln();
    }
}
