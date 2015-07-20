.syntax unified
.text
.align 8
.global itohex
.func itohex, itohex
.type itohex, %function

itohex:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
    mov r0, #11
    mov r4, #0
    bl malloc @ r0 contains our pointer
    strb r4, [r0 #0]
return:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
