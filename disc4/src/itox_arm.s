.func itohex, itohex
.type itohex, %function

itohex:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
