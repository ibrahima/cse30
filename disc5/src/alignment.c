#include <stdio.h>

struct t{
    char c;
    int x;
};

struct s{
    char c;
    int x;
    short s;
};
int main(){
    printf("%lu\n", sizeof(struct t));
    printf("%lu\n", sizeof(struct s));
    return 0;
}
