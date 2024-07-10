# Description

A simple geometry processor:
1. Generator: Generates a set of 2D points.
1. Searcher: Accepts a set of 2D points from stdin, calculates the three closest points and determines whether or not they form a triangle.

# Generator:

Specify the parameters of your set (-rseed is optional and order of arguments doesn't matter).

```bash
python3 gen_points.py -N=<number> -mindist=<mindist> -rseed=<rseed>
```

Example:

```bash
python3 gen_points.py -N=20 -mindist=3 -rseed=2
```

# Searcher:

Compile binary executable.

```bash
make
```

Execute it and input points separating x- and y-values by a comma, and each coordinate on a new line. Hit EOF key (CTRL + D) when done.

```bash
./smallest_triangle
3, 4
1, 5
2, 1
-3, 7
1, 9
6, 3
4, 2
<CTRL + D>
```

# Generator + Searcher:

Compile binary executable.

```bash
make
```

Pipe output of generator into input of searcher.

```bash
python3 gen_points.py -N=<number> -mindist=<mindist> -rseed=<rseed> | ./smallest_triangle
```

Example:

```bash
python3 gen_points.py -N=20 -mindist=3 -rseed=2 | ./smallest_triangle
```

# How To Run Tests

Simply execute the testing script.

```bash
./test.sh
```

NOTE: Ensure execution privileges are available.

```bash
chmod +x test.sh
```