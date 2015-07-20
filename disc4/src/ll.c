#include <stdio.h>
#include <stdlib.h>
#include "ll.h"

Node *newNode(int val){
    Node *n = malloc(sizeof(Node));
    n->val = val;
    n->next = NULL;
    return n;
}

Node *insertNext(Node *n, int val){
    Node *next = newNode(val);
    if(n->next != NULL){
        next->next = n->next;
    }
    n->next = next;
    return next;
}

Node *append(Node *n, int val){
    if(n->next == NULL){
        return insertNext(n, val);
    }else{
        return append(n->next, val);
    }
}

void printList(Node *start){
    printf("%d ", start->val);
    if(start->next != NULL){
        printList(start->next);
    }
}

int removeVal(Node *n, int val){
    if(n->next == NULL){
        return -1;
    }else{
        if(n->next->val == val){
            n->next = n->next->next;
            return 0;
        }else{
            return removeVal(n->next, val);
        }
    }
}

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
