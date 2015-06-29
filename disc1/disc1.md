% CSE30 Discussion 1
% Ibrahim Awwal
% June 29, 2015

# Raspberry Pi Setup

## Creating your SD Card
- Download the image file, unzip it, and use the appropriate tool for your platform to burn the contents to your SD card
- Linux: dd
- OS X: [Apple-Pi Baker](http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/)
- Windows: [Win32 Disk Imager](http://sourceforge.net/projects/win32diskimager/)
- More details from the [Raspbery Pi website](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

## Direct ethernet connection

- Plug an ethernet cable between your Raspberry Pi and your computer
- Set a static IP address on your computer on the 192.168.2.x *subnet*

## SSH
- Secure SHell: A command and protocol for secure remote login
- Generally, use a command of the form `ssh username@server`
- `ssh pi@rpi.local` or `ssh pi@192.168.2.2`
- To avoid having to type a password, look into ssh key generation
- Use `ssh-copy-id` or copy your *public* key to `~/.ssh/authorized_keys`
- Store frequently used host configurations in `~/.ssh/config`

## Connecting to Wifi
- Easier if you have a monitor connected via HDMI
- Run the command `wpa_gui` to select a network and authenticate
- Might be able to run this over SSH if you enable X forwarding (`ssh -X` or `ssh -Y`)and have an X server installed (see Xming on Windows)

## Basic Unix commands

- `ls`: List files in directory
- `pwd`: Print (current) working directory
- `cd *arg*`: Change directory
- `cp *source* *dest*`: Copy file from source to dest
- `mv *source* *dest*`: Move file from source to dest
- `scp user@host:/path/to/file .`: Secure copy, copy file over ssh from remote host to local machine
    - the last `.` says put it in the current directory

## Getting Help

- manpages: Built in manuals for most Unix commands
    - eg. `man ssh`
- Google
- Ask on Piazza or in office hours

## Bonus: Dynamic DNS and Remote SSH
- It would be convenient to stick your RPi somewhere and never have to carry it around
- Problems:
    1. We don't know the IP address
    2. The SSH port may be closed by our router's firewall (not the case on UCSD-PROTECTED)

## Bonus: Dynamic DNS and Remote SSH
- Solutions:
    1. Dynamic DNS: Our RPi can tell a DNS server online what its IP address is, so that we can have a nice name like `my-rpi.duckdns.org`
        - Some free services: [DuckDNS](https://www.duckdns.org/), [No-IP](http://www.noip.com/)
    2. Port forwarding: Open a port on your router for ssh, forward incoming traffic on that port to your Raspberry Pi
        - Eg. forward port 10022 on your router to port 22 on your Raspberry Pi
        - Instructions for doing this are router specific
        - Need to add an argument to ssh to use the correct port
        - If you don't control your router, you can set up a [reverse SSH tunnel](http://www.tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel) (complicated and you need some other publicly accessible ssh server)

# C Programming

## The C Programming Language

~~~~~~~~ {#mycode .c .numberLines}
<#include "src/hello.c">
~~~~~~~~

## gcc
- Simple example: `gcc hello.c -o hello`
- Some useful options:
    - `-g`: Enable debugging symbols
    - `-Wall`: Enable warnings (can often catch basic errors)
    - `-O0, -O1, -O2`: Different levels of optimization
    - See the manpage for more

## Compilation process
- Each source file is translated to an object file
- The *linker* finds references to libraries or other shared object files and replaces the abstract references with actual addresses (for instance, standard library functions like from `<stdio.h>`) and produces the executable

## Other useful utilities

- `objdump`: Lets you inspect an object file (including executables)
  - `objdump -D` will let you disassemble your binary and look at the assembly code the compiler produced

## A note on architectures

- CPUs implement different Instruction Set Architectures (ISAs)
    - **ISA**: The instruction format your CPU understands
- Your desktop/laptop/server is most likely x86 (Intel compatible)
- Raspberry Pi, your phone, other embedded systems are usually ARM
- Other ISAs include POWER, SPARC, MIPS, Itanium, etc
- **Binaries compiled for one ISA will *not* run on another ISA**
- In particular, binaries compiled for your RPi won't run on PC
- Hence, you must compile your ARM code on your RPi or use a **cross compiler**

## Make
- System for describing how to build a project
- Input file is (usually) named `Makefile`
- Don't have to type all those gcc arguments every time!
- Has simple dependency management
- Tries to recompile only files that have changed
- Can become unwieldy for more complex projects (hence, more complicated build tools such as CMake, Automake, etc)
- **Whitespace sensitive, so be careful!**

## Make

- A Makefile defines one or more *targets* and how to build them
- Basic syntax:

~~~~~~ {.makefile}
target: dependencies
    command to build target
~~~~~~
- **Common gotcha**: Commands to build a target must be preceded by a **TAB** character
- Can use multiple commands to build a target
- Each command must be preceded by a tab
- The default target when you run `make` with no arguments is `all`

## Make
- You can define variables to be used in commands

~~~~~~ {.makefile}
CC=gcc
CFLAGS=-g -Wall
OUTFILE=hello

all:
    $(CC) $(CFLAGS) hello.c -o $(OUTFILE)
~~~~~~

## Make
- Targets can depend on previous targets

~~~~~~ {.makefile}
all: hello.o util.o
    gcc hello.o util.o hello.c -o hello
~~~~~~
- hello.o is produced from hello.c and util.o is produced from util.c
- `gcc` combines these two files to make the executable
- This example takes advantage of the fact that Make knows how to compile *object files* (.o) from C files (.c) implicitly
- You can also define your own rules for automatically transforming inputs of one type to outputs of another

## Example Makefiles

~~~~~~~~ {.makefile}
<#include "src/Makefile1">
~~~~~~~~

## Example Makefiles

~~~~~~~~ {.makefile}
<#include "src/Makefile">
~~~~~~~~

- How does this work?
- `make` implicitly knows how to compile c files
- You can even run `make bob` and Make will know to run `gcc bob.c -o bob` if bob.c exists

## Generic Makefile

- Taken from [http://mrbook.org/blog/tutorials/make/](http://mrbook.org/blog/tutorials/make/)

~~~~~~~~ {.makefile}
<#include "src/Makefile2">
~~~~~~~~

## GDB

# Turning in homework

## turnin
- (optional) `scp` your files onto `ieng6.ucsd.edu` if you worked elsewhere (necessary for PA2 and PA3)
    - For PA1, it's easiest to just do it from ieng6
- `ssh` into `ieng6.ucsd.edu`
- Create a tar file containing all your homework files
    - `tar czf hw1.tar.gz hw1/`
- Submit using the turnin command: `turnin hw1.tar.gz`
- Submitting again will override the previous submission
