import argparse
from sys import stderr
import random
import math


def main(quantity, mindist, rseed):
    # Create an empty list to store points
    points = []

    # If rseed was provided, set seed value of random number generator
    if(isinstance(rseed, int)):
        random.seed(rseed)

    # Generate first point coordinates and append to points list
    points.append((round(random.uniform(-50, 50), 2), round(random.uniform(-50, 50), 2)))

    # Generate remaining points ensuring that min distance is enforced
    while(len(points) != quantity):
        temp = (round(random.uniform(-50, 50), 2), round(random.uniform(-50, 50), 2))
        for i in points:
            if(math.dist(temp, i) > mindist):
                if i == points[-1]:
                    points.append(temp)
                else:
                    continue
            else:
                break
    
    # Print the points to stdout                
    for i in points:
        print(f"{i[0]}, {i[1]}")
    

if __name__ == '__main__':
    # Set up argparse to take arguments N (number of points), mindist (minimum distance), and rseed (seed value for random generator)
    parser = argparse.ArgumentParser()
    parser.add_argument("-N", type=int, help="number of points")
    parser.add_argument("-mindist", type=float, help="minimum distance between points")
    parser.add_argument("-rseed", type=int, help="to initialise number generater (optional)")
    args = parser.parse_args()
    
    # Check if required arguments are missing
    if args.N == None or args.mindist == None:
        print("invalid arguments", file=stderr)
        exit(-4)
    # Produce no points if N = 0
    elif args.N == 0:
        exit()
    # Check if N is negative
    elif args.N < 0:
        print("N less than zero", file=stderr)
        exit(-1)
    # Check if mindist is within range (0-10)
    elif args.mindist < 0 or args.mindist > 10:
        print("mindist outside range", file=stderr)
        exit(-2)
    # Check if N exceeds the saturation threshold
    elif (args.mindist > 0 and args.N > (10000/(math.pi*(args.mindist**2)))):
        print("point saturation", file=stderr)
        exit(-3)
    
    # Pass values to main function    
    main(args.N, args.mindist, args.rseed)
