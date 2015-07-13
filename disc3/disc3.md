% CSE30 Discussion 5
% Ibrahim Awwal
% July 13, 2015

# Raspberry Pi setup Redux

## Port forwarding

- Makes a local port available on the internet on a different port (not needed from UCSD-PROTECTED)
- This means you can ssh into your Raspberry Pi from outside your LAN
- Run `rpi_upnp.sh` from **[github.com/ibrahima/raspi_networking](http://github.com/ibrahima/raspi_networking)**
    - Uses UPnP to automatically open an external port on your router
    - Default port is 10022
- `ssh pi@@your-public-ip -p 10022`

## Dynamic DNS

- Lets you set up a custom domain name for your public IP address (which could change)
- DuckDNS is a free no-nonsense service provider, feel free to use any other
- Detailed instructions are **[on github](http://github.com/ibrahima/raspi_networking/duckdns.md)**
- Once you've set this up, you can then do `ssh pi@@you.duckdns.org -p 10022`

## SSH configuration

- Can store commonly used hosts in `~/.ssh/config` (Linux/Mac)

~~~~ {.config}
\include{src/ssh_config}
~~~~

- If you **[set up an SSH key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2)** without a passphrase or use `ssh-agent`, you can avoid typing your password too
- Now you can just type `ssh rpi1` and log in immediately!

## Any questions?

# Programming Assignment 2

## Tips

- Come to lab hours
- If you're having issues with your Raspberry Pi, do the C parts first on ieng6 or your own computer
- If you get segfaults, run your program through gdb, get a backtrace
- Make sure to compile with `-g` for debug symbols

## Tips

- The array is sorted, so take advantage of this when appropriate
- Related to the above, make sure to keep the array sorted
- Make sure variables that need to live past the life of a function are heap allocated
- Any questions?

# ARM Assembly

## Assembly language

- Assembly language is a 1-to-1 mapping to machine code
- Instructions are basically mnemonics for the programmer to refer to binary
- *Assembler* is the program that turns these mnemonics into machine code
- Instructions operate on *registers*, small memory directly within the CPU

## Instruction Types

- Arithmetic:  Only processor and registers involved
\note{ADD, SUB, MUL, MOV}
- Data Transfer Instructions: Interacts with memory
\note{LDR, STR, various sizes}
- Control Transfer Instructions: Change flow of execution
\note{B, BL, BX}
- examples of each?
- **[ISA Quick Reference Card](http://infocenter.arm.com/help/topic/com.arm.doc.qrc0001m/QRC0001_UAL.pdf)**

## Arithmetic

- `ADD dest, op1, op2` - op2 can be a constant (immediate) encoded in the instruction
    - What's one way to copy the contents of one register into another?
- `MUL`/`SMULL` - what's the difference?
- Shifting: `LSL`, `LSR`, `ASL`, `ASR`
    - No instruction of their own, combine with other instruction (eg. `ADD`/`MOV`)
    - When might we use this instead of `MUL`? Why?
- Be aware of data sizes, sign, overflow bits
- `QADD`, `ADDS`, diff
. . .

- **[Reference on ARM instruction timing](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0388i/Cjaedcef.html)**

## Data Transfer

- `LDR` loads a word from memory into a register (4 bytes)
- `STR` stores a word from register into memory
- `LDR dest, [base #offset]`
- many options for calculating offset, updating the base register, pre-indexing vs post-indexing
- Why do we have all these options?

## Control Flow

- Branch instructions change the program counter (instead of incrementing by 1 instruction)
    - `B` **b**ranches to a label
    - `BL` **b**ranches to a label and **l**inks return address into `LR`
    - `BX` branches to a register\*
- Most instructions in ARM can be conditionally executed, not just branches!
- eg. `CMP r4, #0`; `BEQ *label*` --> `if(r4 != 0){}`
- What is the benefit of conditional execution?

## Comparisons

- `CMP r1, r2` or `CMP r1, #immediate` --> `r1 - r2`
- Stores result of comparison in status bits
    - N: Negative
    - Z: Zero
    - C: Carry (or Unsigned Overflow)
    - V: (Signed) Overflow
    - Status bits are also used when doing arithmetic with overflows
- Add a condition code to any instruction to execute it conditionally
    - eg. `EQ`, `NE`, `GE`, `LT`, etc.
- **[Reference on condition codes and status bits](http://community.arm.com/groups/processors/blog/2010/07/16/condition-codes-1-condition-flags-and-codes)**

## Generating Assembly from C

- `gcc source.c -S` will output source.s assembly
- `gcc -c -g -Wa,-a,-ad source.c > source.lst` will output a mixed C/assembly listing
- latter command taken from **[http://www.delorie.com/djgpp/v2faq/faq8_20.html](http://www.delorie.com/djgpp/v2faq/faq8_20.html)**
- tip: save these as aliases in your shell (eg. .bashrc)
    - `alias asmc="gcc -c -g -Wa,-a,-ad"`
    - use it like `asmc source.c > source.lst`

## Function calls

- To call a function, we need to transfer execution to a different location in code, with some arguments passed and a return value received
    - Transfer execution: `B` to a label
    - Function arguments: passed in r0-r3, more on stack
    - What about longs/doubles?
    - Return value is put into r0
- How do we get back to our code?

## Function calls

- We use the `BL` instruction to store the return address (next instruction) into `LR`
- Function call then returns by performing `BX LR`
- Function signatures are a contract that both callee and caller must obey
- Registers must be preserved across function calls
- **[ARM Architecture Procedure Call Standard (AAPCS)](http://infocenter.arm.com/help/topic/com.arm.doc.ihi0042e/IHI0042E_aapcs.pdf)**

## Diagram from Lecture

\includegraphics[page=29,width=\textwidth]{lec9_before.pdf}

## PA2 Starter Code

~~~~{.s .asm}
\include{src/func_skel.s}
~~~~

## Examples

~~~~{.c}
int fun(int a, int b, int c, int d, int e){
    return a + b - c + d - e;
}
~~~~
- Where does `e` go?

. . .

~~~~{.c}
long fun(int a, int b){
    return (long)a*(long)b;
}
~~~~

- Where do we store the return value?

## Tips

- Before you write, plan out detailed pseudocode
- Comment **every** line, with detailed overview for functions
- Trace execution, draw registers and how they change, how PC changes, etc

# Translating C language constructs to assembly

## Flow control

- if --> conditional branch, skip over some instructions
- loops --> jump back to start of loop if condition satisfied

## Accessing arrays, structs, pointers

- To index arrays, add index*sizeof(type) to base register
    - eg. `LDR r2, [r3 r4]` --> `r2 = r3[r4]`
    - what type could array r3 be?
    - what if we have an int array? <!-- LDR r2, [r3 r4 LSL #2] -->
- Struct fields are laid out sequentially in memory, aligned based on their size
    - **Important**: memory layout is aligned to size of variable
    - This means if you have a struct with char and int, the first field will be padded so that the second starts on a word boundary
    - **[Interesting article on struct packing](http://www.catb.org/esr/structure-packing/)**
    - The `offsetof()` macro can tell you the offset (in bytes) to a field of a struct
- Pointers are dereferenced in the same way as arrays - `LDR r2, [r3]` <--> r2=*r3

# ARM Assembly exercises

## Understanding instructions

- `ADD8 r0, r1, r2`
- `CMP r3, r4`
- `MOVEQ r2, #-1`
- `LDR r5, [r6, r7 LSL #4]`

\note{Put in some simple instructions, decode what they are doing}
\note{different arithmetic operations, moving values around, creating masks, memory addressing}

## Writing ARM: Exponentiation

Returns x^y (^ is bitwise XOR in C)

~~~~ {.c}
int exp(int x, int y);
~~~~

## Writing ARM: strcpy

~~~~{.c}
char * strcpy ( char * destination, const char * source );
~~~~

## Fun note: TIS-100

- There's an actual assembly language programming game called **[TIS-100](http://store.steampowered.com/app/370360)** on Steam
- Haven't tried it but it could be fun and educational
