.syntax unified
.text
.align 8
.global itohex
.func itohex, itohex
.type itohex, %function

itohex:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
    mov r11, r0     @ Keep track of x
    mov r0, #11     @ malloc 11 bytes
    bl malloc       @ r0 contains our pointer
    mov r4, #0      @ want to null terminate the string
    strb r4, [r0, #10]  @ out[10] = '\0'
    mov r4, '0'
    strb r4, [r0, #0]   @ out[0] = '0'
    mov r4, 'x'
    strb r4, [r0, #1]   @ out[1] = 'x'
    mov r5, #0          @ j=r5
    mov r6, #8          @ nibbles=r6
loop:
    @ Compute the mask and store it in r7
    mov r8, r5, LSL #2   @ r8 is number of shifts
    mov r7, #15
    mov r7, r7, LSL r8  @ mask is in r7
    and r9, r7, r11     @ mask & x
    mov r9, r9, LSR r8  @ >> 4*j
    @ Convert digit to an ASCII code
    cmp r9, #10         @ if(r9 < 10)
    addlt r9, r9, '0'   @ '0' + digit if digit < 10
    addge r9, r9, 'A'   @ 'A' + digit if digit > 10
    subge r9, r9, #10   @ digit = digit - 10
    @ Now r9 has ASCII code for the digit
    rsb r10, r5, #9     @ compute offset
    strb r9, [r0, r10]  @ store character into array
    add r5, r5, #1      @ j++
    cmp r5, r6          @ Check if j<nibbles
    blt loop            @ if j<nibbles, then go back to loop
return:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
