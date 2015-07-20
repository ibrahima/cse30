typedef struct node{
    int val;
    struct node *next;
} Node;

Node *newNode(int val);
Node *insertNext(Node *n, int val);
Node *append(Node *n, int val);
void printList(Node *start);
int removeVal(Node *n, int val);
