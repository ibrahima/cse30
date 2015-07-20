#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

int main(){
    TreeNode *a = newTreeNode(1);
    insert(a, 4);
    insert(a, 2);
    insert(a, -1);
    insert(a, -3);
    insert(a, -2);
    printInOrder(a);
    printf("\n");
}
