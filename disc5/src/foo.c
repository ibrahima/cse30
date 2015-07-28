#include <stdio.h>
int main(){
    int arr[4] = {-1, 1, 2, 3};
    int *ptr = arr;
    printf("%d\n", *(ptr+1));
}
