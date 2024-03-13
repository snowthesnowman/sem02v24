#include <stdio.h>

void overflow(int num) {
	int arr[100];
	overflow(num + 1);
}

int main(void) {
	overflow(0);
	return 0;
}