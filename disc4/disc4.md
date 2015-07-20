% CSE30 Discussion 7
% Ibrahim Awwal
% July 20, 2015

# ARM Assembly Review

## Conditional Execution

- `CMP` instruction: compares register(s) and/or immediates
- equivalent to `SUBS` without storing result of subtraction
- Why is this?
- After performing comparison, we can conditionally execute any instruction

## Conditional Execution - Examples

## Control Flow - if

## Control Flow - for

## Function Calls

## The Stack

- Stores automatic variables, return address, any registers we need to save before

## Memory Layout

![memory](program_in_memory2.png)

## Stack Nomenclature

- **Ascending** stack grows upwards, i.e. memory addresses go from low to high
- **Descending** stack grows downwards, i.e. memory addresses go from high to low
- **Empty** stack, the stack pointer points to the next free (empty) location on the stack
- **Full** stack, the stack pointer points to the topmost item in the stack

. . .

- The ARM Linux stack convention is to use a **full descending** stack
- That is, addresses grow downwards, and `$sp` points to the last item pushed onto the stack

## Push and Pop Instructions

- Push registers onto, and pop registers off a full descending stack.
- PUSH{cond} reglist
- POP{cond} reglist
- reglist is a non-empty list of registers, enclosed in braces. It can contain register ranges. It must be comma separated if it contains more than one register or register range.
- PUSH and POP are synonyms for STMDB and LDM (or LDMIA), with the base register sp (r13), and the adjusted address written back to the base register
- [source](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0204j/Babefbce.html)

## System Calls: Leveraging the OS

- You can think of it as calling functions which are part of the OS

# Exercises

## Linked Lists

## Tree recursion

## int to string
