#include <stdio.h>
#include <assert.h>

int my_strlen(char *string){
    return 0;
}
int main(){
    char *input = "Hello";
    assert(my_strlen(input) == 5);
    printf("Success!");
}
