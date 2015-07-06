#include <stdio.h>
#include <assert.h>
#include <string.h>

char *my_strcpy(char *dst, char *src){
    return 0;
}

int main(){
    char *input = "Hello";
    char target[6];
    my_strcpy(target, input);
    assert(strcmp(input, target) == 0);
    printf("Success!");
}
