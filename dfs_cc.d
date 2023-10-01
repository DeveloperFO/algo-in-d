import std.stdio;
import std.algorithm;

void dfsConnectedComponents(int vertex, int[][] graph, bool[] visited, int[] componentId, int component)
{
    visited[vertex] = true;
    componentId[vertex] = component;

    foreach (neighbor; graph[vertex])
    {
        if (!visited[neighbor])
        {
            dfsConnectedComponents(neighbor, graph, visited, componentId, component);
        }
    }
}
