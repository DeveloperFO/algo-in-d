void bfsConnectedComponents(int startVertex, int[][] graph, bool[] visited, int[] componentId)
{
    int component = 0;
    foreach (i; 0..graph.length)
    {
        if (!visited[i])
        {
            component++;

            Queue!int queue;
            queue.insertBack(i);
            visited[i] = true;

            while (!queue.empty)
            {
                int vertex = queue.front;
                queue.popFront();
                componentId[vertex] = component;

                foreach (neighbor; graph[vertex])
                {
                    if (!visited[neighbor])
                    {
                        queue.insertBack(neighbor);
                        visited[neighbor] = true;
                    }
                }
            }
        }
    }
}
