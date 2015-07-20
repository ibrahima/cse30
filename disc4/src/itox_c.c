#include <stdlib.h>

char *itohex(int x){
    int nibbles = sizeof(int)*2;
    char *out = malloc(nibbles+3);
    out[0] = '0';
    out[1] = 'x';
    for(int j=0; j<nibbles; j++){
        int mask = 0xF << 4*j;
        int tmp = (mask&x) >> 4*j;
        if (tmp < 10){
            out[nibbles-j+1] = '0' + tmp;
        }else{
            out[nibbles-j+1] = 'A'+tmp-10;
        }
    }
    out[nibbles+2] = '\0';
    return out;
}
