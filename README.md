Enter your notes about which git commits from your repository are for the marker. Using the submission # sequence is ideal. e.g. Submissions #4 #6 #10 #11 and #23

Submissions #1
- Started working on gen_points.py.
- Set up the program to take arguments using argparse module.
- Argument values are checked for validity (error messages to stderr + exit values).
- Arguments are passed to the main function.

Submissions #2
- Completed the functionality of the gen_points.py file.
- Points are now generated according to the value for N and mindist provided by the user.
- If rseed is provided, it now sets the seed value for the random number generator.
- Points are printed to stdout in the correct format.
- Fixes were made to the testing of argument validity:
    - If N value provided is 0, the program simply exits, not generating any points.
    - If mindist = 0, there was a zero division error caused by the condition args.N > (10000/args.mindist). This has now been solved using a more complex 
    conditional statement.

Submissions #3
- smallest_triangle.c
    - Solved: continuously taking input until EOF.
- gen_points.py
    - Changed mindist type to float.
    - Updated new saturation threshold in accordance with new specs -> 10000/(math.pi*(args.mindist**2)).
    - Updated new error message to stderr and exit value for missing arguments in accordance with new specs.
        - argparse no longer requires any arguments. Missing arguments are now handled explicitly using if else statements.

Submissions #4
- smallest_triangle.c
    - User input code has been optimised and also checks that values are within range [-50, 50].
    - Calculates the three closest points and their triangular area using newly added functions distance() & triangle_area().
    - Number of points read is printed to stdout, along with the three closest points and whether or not they form a triangle.

Submissions #5
- smallest_triangle.c
    - Three closest points are now found by the smallest sum of three triangle side lengths (instead of the smallest area between three points).
        - New function sum_of_distances().
    - FLT_MAX from float.h is no longer used and is replaced by the maximum possible value for that variable.
    - User input code optimised and no longer exceeds 1000.
    - Code optimised to work correctly for 1 or 2 inputs only.