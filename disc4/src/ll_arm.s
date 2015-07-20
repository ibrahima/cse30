.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:
    push {r4-r11, ip, lr} @@ Save caller's registers on the stack
    @@ put your return value in r0
return:
    pop {r4-r11, ip, lr} @@ restore caller's registers
    BX lr
.endfunc

.end
