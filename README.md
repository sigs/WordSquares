# WordSquares

A simple C++ solver for dense word grids.

See this [YouTube Video](https://youtu.be/zWIsnrxL-Zc) for the best explanation.

## Results

With `MIN_FREQ_W 1000000` and `MIN_FREQ_H 1000000`,
```
Found 243181 solutions for 5x5 grid.
Found 2905 solutions for 6x6 grid.
```

## Tweakables

In `main.cpp`, you can tweak the following parameters:

- `PRINT_NUM_SOLUTIONS`: Whether to only print the number of solutions, `false` will actually print all of the solutions.
- `WORD_FREQUENCY_FILE`: The path to the word frequency file.
- `SIZE_W`: The width of the word grid.
- `SIZE_H`: The height of the word grid.
- `DIAGONALS`: Whether to include diagonals in the word grid.

See main.cpp for more details.
