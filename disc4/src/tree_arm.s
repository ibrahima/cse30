.syntax unified
.text
.align 8

@@ TreeNode *newTreeNode(int val);
.global newTreeNode
.func newTreeNode, newTreeNode
.type newTreeNode, %function
newTreeNode:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return1:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@@ TreeNode *insert(TreeNode *n, int val);
.global insert
.func insert, insert
.type insert, %function
insert:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return2:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@@ void printInOrder(TreeNode *n);
.global printInOrder
.func printInOrder, printInOrder
.type printInOrder, %function

printInOrder:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return3:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@@ int removeVal(TreeNode *n, int val);
.global removeVal
.func removeVal, removeVal
.type removeVal, %function
removeVal:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return4:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
