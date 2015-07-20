.syntax unified
.text
.align 8

@ Node *newNode(int val)
.global newNode
.func newNode, newNode
.type newNode, %function

newNode:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return1:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@ Node *insertNext(Node *n, int val)
.global insertNext
.func insertNext, insertNext
.type insertNext, %function

insertNext:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return2:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@ Node *append(Node *n, int val)
.global append
.func append, append
.type append, %function

append:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return3:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@ void printList(Node *start)
.global printList
.func printList, printList
.type printList, %function

printList:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return4:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

@ int *removeVal(Node *n, int val)
.global removeVal
.func removeVal, removeVal
.type removeVal, %function

removeVal:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return5:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
