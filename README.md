# Simple Geometry Processor

**Generator:** Generates a set of 2D points based on parameters.  
**Searcher:** Accepts a set of 2D points from stdin, calculates the three closest points and determines whether or not they form a triangle.  

## Generator

Specify the parameters of your set:
* -N: the number of points to generate.  
* -mindist: the minimum distance between any two points.  
* -rseed [optional]: a number used to generate a particular set of points.

Syntax:

```bash
python3 gen_points.py -N=<number> -mindist=<mindist> -rseed=<rseed>
```

Example:

```bash
python3 gen_points.py -N=20 -mindist=3 -rseed=2
```

Output:
```bash
45.6, 44.78
-44.34, -41.51
33.55, 23.6
16.97, -19.19
10.59, 10.68
8.12, -34.16
-6.93, -10.65
22.3, 49.48
44.94, 4.42
-5.51, -23.18
-46.41, -47.26
-3.51, -18.15
-12.0, 39.18
2.58, 6.05
-26.39, -47.61
-17.49, -36.33
1.02, 49.87
17.45, -31.82
39.36, 29.68
23.44, 40.66
```

## Searcher

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

Output:

```bash
read 7 points
3.00, 4.00
2.00, 1.00
4.00, 2.00
This is a triangle
```

## Generator + Searcher

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

Output:
```bash
read 20 points
-6.93, -10.65
-5.51, -23.18
-3.51, -18.15
This is a triangle
```

## How To Run Tests

Simply execute the testing script.

```bash
./test.sh
```

NOTE: Ensure execution privileges are available.

```bash
chmod +x test.sh
```
