import std.stdio;

void bubbleSort(T)(T[] arr)
{
    for (int i = 0; i < arr.length - 1; i++)
    {
        bool swapped = false;

        for (int j = 0; j < arr.length - i - 1; j++)
        {
            if (arr[j] > arr[j + 1])
            {
                // Swap arr[j] and arr[j+1]
                T temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = true;
            }
        }

        if (!swapped)
            break;
    }
}
