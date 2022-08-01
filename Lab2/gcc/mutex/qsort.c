#include "qsort.h"

void qsort(int a[], int l, int r) {
	if (l >= r) {
		return;
	}
	int i = l, j = r, x = a[l];
	while (i < j) {
		while (i < j && x <= a[j]) {
			j--;
		}
		a[i] = a[j];
		while (i < j && a[i] < x) {
			i++;
		}
		a[j] = a[i];
	}
	a[j] = x;
	qsort(a, l, j - 1);
	qsort(a, j + 1, r);
	return;
}