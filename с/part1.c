#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <pthread.h>

extern double factorial(int n);

double getRandomX() {
    srand(time(NULL));
    double randomX = (double)rand() / RAND_MAX;
    randomX = -110 + randomX * (16 + 110);
    return randomX;
}

int main(int argc, char** argv) {
    double x;
    struct timespec start;
    struct timespec end;
    int repeat = 1000;

    if (argc == 2 && argv[1][0] == 'c') {
        scanf("%lf", &x);
    } else if (argc == 2 && argv[1][0] == 'r') {
        x = getRandomX();
    } else if (argc == 4 && argv[1][0] == 'f') {
        FILE *input_file = fopen(argv[2], "r");
        fscanf(input_file, "%lf", &x);
    } else {
        printf("Input is incorrect");
        return 0;
    }

    double total = 0;
    double cur;
    double res = exp(-x);

    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int k = 0; k < repeat; k++) {
        total = 0;
        for (int i = 0; i < 1000; i++) {
            cur = pow(-1, i) * pow(x, i) / factorial(i);
            if (fabs(cur) > 0 && total + cur < INFINITY)
                total += cur;
            else
                break;
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &end);

    long long time_result = end.tv_nsec + end.tv_sec * 10e8 - start.tv_sec * 10e8 - start.tv_nsec;

    if (argc == 4) {
        FILE* output_file = fopen(argv[3], "w");
        fprintf(output_file, "Program working time: %lld ns\n", time_result);
        fprintf(output_file, "Program result: %.20lf\n", total);
        fprintf(output_file, "Precision: %.20lf %%", fabs(total - res) / res * 100);
    } else {
        printf("Program working time: %lld ns\n", time_result);
        printf("Program result: %.20lf\n", total);
        printf("Precision: %.20lf %%\n", fabs(total - res) / res * 100);
    }
}


