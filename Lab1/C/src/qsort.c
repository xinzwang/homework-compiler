#include<stdio.h>
#include<time.h>

int a[5000005] = {0};

void qsort(int l,int r){
    if(l>=r){
        return;
    }
    int i = l, j = r, x = a[l];
    while(i<j){
        while(i<j && x <= a[j]){
            j--;
        }
        a[i] = a[j];
        while(i<j && a[i] < x){
            i++;
        }
        a[j] = a[i];
    }
    a[j]= x;
    qsort(l,j-1);
    qsort(j+1,r);
    return;
}


int main(){
    int num;
    // Read data file
    FILE* fp=NULL;
    if((fp = fopen("../../5000000.txt","r"))==NULL){
        printf("File not exist\n");
        return 1;
    }
    fscanf(fp,"%d",&num);
    for(int i=0;i<num;i++){
        fscanf(fp,"%d",&a[i]);
    }
    fclose(fp);

    // Print Before sort
    printf("Before sort(top 10): ");
    for(int i=0;i<10;i++){
        printf("%d ",a[i]);
    }
    printf("\n\n");

    // Sort
    clock_t st,et;
    printf("Start\n");
    st = clock();
    qsort(0,num-1);
    et = clock();
    printf("Finish!\n\n");

    
    // Print After sort
    printf("After sort(top 10): ");
    for(int i=0;i<10;i++){
        printf("%d ",a[i]);
    }
    printf("\n\n");
    printf("run time: %f\n",(double)(et-st)/(CLOCKS_PER_SEC));
}