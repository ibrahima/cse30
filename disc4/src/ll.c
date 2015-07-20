#include <stdio.h>
#include <stdlib.h>
#include "ll.h"

int main(){
    Node *a = newNode(1);
    append(a, 5);
    append(a, 8);
    append(a, 3);
    append(a, 12);
    printList(a);
    printf("\n");
    removeVal(a, 8);
    printList(a);
    printf("\n");

}
