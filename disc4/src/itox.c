#include <stdio.h>
#include <stdlib.h>

char *itohex(int x);

int main(int argc, char **argv){
    char *thing;
    if(argc>1){
        thing = itohex(atoi(argv[1]));
    }else{
        thing = itohex(255);
    }
    printf("%s\n", thing);
    return 0;
}
