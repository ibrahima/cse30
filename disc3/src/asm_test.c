#include <stdio.h>
#include <stdlib.h>

int asm_func(int a, int b);

int main(int argc, char ** argv){
    if(argc < 3){
        fprintf(stderr, "Please provide 2 integer arguments");
    }
    int x = atoi(argv[1]);
    int y = atoi(argv[2]);
    int result = asm_func(x, y);
    printf("f(%d, %d) = %d", x, y, result);
    return 0;
}
