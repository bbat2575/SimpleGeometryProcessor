#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define BUFLEN (64) // Buffer size: allow buffer to take in 64 bytes at a time

// Calculate euclidean distance between two points
float distance(float x1, float y1, float x2, float y2) {
    return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

// Finds the sum of the distances between three points
float sum_of_distances(float x1, float y1, float x2, float y2, float x3, float y3) {
    float distance1 = distance(x1, y1, x2, y2);
    float distance2 = distance(x2, y2, x3, y3);
    float distance3 = distance(x3, y3, x1, y1);

    return distance1 + distance2 + distance3;
}

// Heron's formula for area of a triangle
float triangle_area(float x1, float y1, float x2, float y2, float x3, float y3) {
    // Calculate length of sides
    float side1 = sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
    float side2 = sqrt(pow(x2 - x3, 2) + pow(y2 - y3, 2));
    float side3 = sqrt(pow(x3 - x1, 2) + pow(y3 - y1, 2));

    // Calulcate semiperimeter
    float sem = (side1 + side2 + side3) / 2;

    // Calculate area
    return sqrt(sem * (sem - side1) * (sem - side2) * (sem - side3));
}

int main() {
    float points[1000][2]; // an array to store points (max 1000) in n rows of 2 columns
    int size = 0; // stores total number of points
    char buf[BUFLEN]; // array of 64 bytes to store incoming data
    char x[50]; // store point data for x-coordinate
    char y[50]; // stores point data for y-coordinate

    // Read from standard input (max. 1000 points)    
    while((fgets(buf, BUFLEN, stdin) != NULL) & (size != 1000)) {

        // Clear arrays x & y for new input
        for(int i = 0; i < 50; i++) {
            x[i] = '\0';
            y[i] = '\0';
        }
        
        int count = 0; // keep track of x & y indices
        char *ptr = buf; // assign array address to ptr (since array names are const - not modifiable)

        // Iterate over input characters to find x-coordinate
        while(*ptr) {
            // Read until comma or newline found (if newline, then only one input given = invalid format -> caught by y_invalid below)
            if((*ptr == ',') | (*ptr == '\n')) {
                ptr++; // increment to next character after comma
                break;
            }
            x[count] = *ptr;
            count++;
            ptr++;
        }

        // Check for whitespace after comma, if none, then format is invalid = skip these points
        if(*ptr != ' ') {
            continue;
        } else {
            ptr++; // increment to next character after whitespace
        }

        count = 0;

        // Iterate over input characters to find y-coordinate
        while(*ptr) {
            // Read until newline (if additional values exist delimited by commas, then y value will be invalid -> caught by y_invalid below)
            if(*ptr == '\n') {
                break;
            }
            y[count] = *ptr;
            count++;
            ptr++;
        }

        int x_invalid = 0; // counts any invalid character in x array
        int y_invalid = 0; // counts any invalid characts in y array
        
        // Check for invalid format
        for(int i = 0; i < 50; i++) {
            // Check that all x characters are either numeric, a decimal point, minus sign, or a null character
            if((isdigit(x[i]) == 0) & (x[i] != '.') & (x[i] != '-') & (x[i] != '+') & (x[i] != '\0')) {
                x_invalid++;
            // Check that a digit exists before the decimal point (0.2 vs .2), after the decimal point (2.0 vs 2.), and no more than 2 decimal places (or additional decimal points)
            } else if ((x[i] == '.') & ((isdigit(x[i-1]) == 0) | (isdigit(x[i+1]) == 0) | (x[i+3] != '\0'))) {
                x_invalid++;
            // Check if any characters exist before the '+' or '-' signs
            } else if (((x[i] == '+') | (x[i] == '-')) & (i != 0)) {
                x_invalid++;
            }
            // Check that all y characters are either numeric, a decimal point, minus sign, or a null character
            if((isdigit(y[i]) == 0) & (y[i] != '.') & (y[i] != '-') & (y[i] != '+') & (y[i] != '\0')) {
                y_invalid++;
            // Check that a digit exists before the decimal point (0.2 vs .2), after the decimal point (2.0 vs 2.), and no more than 2 decimal places (or additional decimal points)
            } else if ((y[i] == '.') & ((isdigit(y[i-1]) == 0) | (isdigit(y[i+1]) == 0) | (y[i+3] != '\0'))) {
                y_invalid++;
            // Check if any characters exist before the '+' or '-' signs
            } else if (((y[i] == '+') | (y[i] == '-')) & (i != 0)) {
                y_invalid++;
            }
        }

        // Check that x & y are within range [-50, 50], that neither contain invalid characters or are null (no value)
        if ((atof(x) >= -50) & (atof(x) <= 50) & (atof(y) >= -50) & (atof(y) <= 50) & (!x_invalid) & (!y_invalid) & (x[0] != '\0') & (y[0] != '\0')) {
            // Add x & y as floats to points array and increment the size (account for -0.00 entries and change them to 0)
            if(atof(x) == 0) {
                points[size][0] = 0;
            } else {
                points[size][0] = atof(x);
            }

            if(atof(y) == 0) {
                points[size][1] = 0;
            } else {
                points[size][1] = atof(y);
            }

            size++;
        }
    }

    float shortest_distance = sum_of_distances(-50, -50, 50, -50, 0, 50); // stores the shortest distance between three points (initially stores the largest possible)
    float total_area = 0; // stores the triangular area between 3 points

    int point1 = -1; // stores index of point 1
    int point2 = -1; // stores index of point 2
    int point3 = -1; // stores index of point 3

    // If only one point exists
    if(size == 1) {
        point1 = 0;
    // If only two points exist
    } else if (size == 2) {
        point1 = 0;
        point2 = 1;
    // If there's more than two points, find the three closest points using the sum of their distances
    } else if(size > 2) {
        for(int i = 0; i < size; i++) {
            for(int j = i+1; j < size; j++) {
                for(int k = j+1; k < size; k++) {
                    if(shortest_distance > sum_of_distances(points[i][0], points[i][1], points[j][0], points[j][1], points[k][0], points[k][1])) {
                        shortest_distance = sum_of_distances(points[i][0], points[i][1], points[j][0], points[j][1], points[k][0], points[k][1]);
                        point1 = i;
                        point2 = j;
                        point3 = k;
                    }
                }
            }
        }

        // Calculate the area between the 3 points
        total_area = triangle_area(points[point1][0], points[point1][1], points[point2][0], points[point2][1], points[point3][0], points[point3][1]);
    }

    // Print number of points read to stdout
    printf("read %d points\n", size);

    // Check that points were found before printing to stdout
    if(point1 != -1) {
        printf("%.2f, %.2f\n", points[point1][0], points[point1][1]);

        if(point2 != -1) {
            printf("%.2f, %.2f\n", points[point2][0], points[point2][1]);

            if(point3 != -1) {
                printf("%.2f, %.2f\n", points[point3][0], points[point3][1]);
            }
        }
    }
    
    // Check that smallest_area is greater than 0.001 and that a third point was found
    if (total_area > 0.001) {
        printf("This is a triangle\n");
    } else {
        printf("This is not a triangle\n");
    }

    return 0;
}