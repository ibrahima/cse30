typedef struct tree_node {
    int val;
    struct tree_node *left;
    struct tree_node *right;
} TreeNode;

TreeNode *newTreeNode(int val);
TreeNode *insert(TreeNode *n, int val);
void printInOrder(TreeNode *n);
int removeVal(TreeNode *n, int val);
