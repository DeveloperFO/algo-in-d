import std.stdio;
import std.algorithm;
import std.container;

void dfs(int vertex, int[][] graph, bool[] visited)
{
    visited[vertex] = true;
    write(vertex, " ");

    foreach (neighbor; graph[vertex])
    {
        if (!visited[neighbor])
        {
            dfs(neighbor, graph, visited);
        }
    }
}
