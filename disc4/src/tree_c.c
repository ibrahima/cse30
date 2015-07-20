#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

TreeNode *newTreeNode(int val){
    TreeNode *n = malloc(sizeof(TreeNode));
    n->val = val;
    n->left = NULL;
    n->right = NULL;
    return n;
}

TreeNode *insert(TreeNode *n, int val){
    // If n->val < val, it goes into right tree
    // Else, it goes into left tree
    // We have found a space for it when
    if(val > n->val){
        if(n->right == NULL){
            n->right = newTreeNode(val);
            return n->right;
        }
        else{
            return insert(n->right, val);
        }
    }else{
        if(n->left == NULL){
            n->left = newTreeNode(val);
            return n->left;
        }else{
            return insert(n->left, val);
        }
    }
}

void printInOrder(TreeNode *n){
    if(n->left){
        printInOrder(n->left);
    }
    printf("%d ", n->val);
    if (n->right){
        printInOrder(n->right);
    }
}

int removeVal(TreeNode *n, int val){
    return -1;
}
