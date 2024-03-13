#include <stdlib.h>

int main() {
    int *ptr;
    while (1) {
        ptr = malloc(1024 * 1024); // Allokerer 1 MB minne
        if (ptr == NULL) {
            printf("Out of memory\n");
            break;
        }
    }
    return 0;
}