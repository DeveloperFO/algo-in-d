import std.stdio;
import std.algorithm;

struct Point
{
    double x, y;

    this(double x, double y)
    {
        this.x = x;
        this.y = y;
    }
}

int orientation(Point p, Point q, Point r)
{
    double val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);
    if (val == 0)
        return 0; // Collinear
    return (val > 0) ? 1 : 2; // Clockwise or counterclockwise
}

void giftWrap(Point[] points)
{
    int n = points.length;
    if (n < 3)
    {
        writeln("Convex hull not possible with less than 3 points.");
        return;
    }

    // Initialize the convex hull with an empty list
    Point[] hull;

    // Find the leftmost point as the starting point
    int leftmost = 0;
    foreach (i, point; points[1..$])
    {
        if (point.x < points[leftmost].x)
            leftmost = i + 1;
    }

    int p = leftmost;
    do
    {
        // Add the current point to the convex hull
        hull ~= points[p];

        // Find the next point in the convex hull
        int q = (p + 1) % n;
        for (int i = 0; i < n; i++)
        {
            if (orientation(points[p], points[i], points[q]) == 2)
                q = i;
        }

        p = q;
    } while (p != leftmost);

    // Print the convex hull points
    writeln("Convex Hull Points:");
    foreach (point; hull)
    {
        writeln("(", point.x, ", ", point.y, ")");
    }
}
