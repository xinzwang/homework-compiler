#include <stdio.h>
#include <time.h>

#include "qsort.h"

int a[5000005] = {0};

int main( ) {
	int num;
	// Read data file
	FILE* fp = NULL;
	if ((fp = fopen("7.txt", "r")) == NULL) {
		printf("File not exist\n");
		return 1;
	}
	fscanf(fp, "%d", &num);
	for (int i = 0; i < num; i++) {
		fscanf(fp, "%d", &a[i]);
	}
	fclose(fp);

	// Print Before sort
	printf("Before sort: ");
	for (int i = 0; i < num; i++) {
		printf("%d ", a[i]);
	}
	printf("\n\n");

	// Sort
	clock_t st, et;
	printf("Start\n");
	st = clock( );
	qsort(a, 0, num - 1);
	et = clock( );
	printf("Finish!\n\n");

	// Print After sort
	printf("After sort: ");
	for (int i = 0; i < num; i++) {
		printf("%d ", a[i]);
	}
	printf("\n\n");
	printf("run time: %f\n", (double)(et - st) / (CLOCKS_PER_SEC));
}