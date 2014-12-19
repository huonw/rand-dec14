#include <stdio.h>
#include <stdlib.h>
#include "dSFMT.h"

int main(int argc, char* argv[]) {
    int i, cnt, seed;
    double sum;
    const int NUM = 10000;
    dsfmt_t dsfmt;

    if (argc >= 2) {
        seed = strtol(argv[1], NULL, 10);
    } else {
        seed = 12345;
    }
    dsfmt_init_gen_rand(&dsfmt, seed);
    for (i = 0; i < 1000000000; i++) {
        sum += dsfmt_genrand_close_open(&dsfmt);
    }
    printf("%f\n", sum);
    return 0;
}
