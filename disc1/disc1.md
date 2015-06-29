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
- Generally, use a command of the form `ssh username@server`
- `ssh pi@rpi.local` or `ssh pi@192.168.2.2`
- To avoid having to type a password, look into ssh key generation
- Use `ssh-copy-id` or copy your *public* key to `~/.ssh/authorized_keys`
- Store frequently used host configurations in `~/.ssh/config`

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
    2. The SSH port may be closed by our router's firewall

- Solutions:
    1. Dynamic DNS: Our RPi can tell a DNS server online what its IP address is, so that we can have a nice name like `my-rpi.duckdns.org`
       - Some possible services: [DuckDNS](https://www.duckdns.org/), [No-IP](http://www.noip.com/)


## Connecting to Wifi

## Dynamic DNS

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

## Compilation process
- object files
- linking

## Other useful utilities

- `objdump`: Lets you inspect an object file

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
- system for describing how to build a project
- don't have to type all those gcc arguments every time!
- can become unwieldy for more complex projects (hence, more complicated build tools such as CMake, Automake, etc)
- **Whitespace sensitive, so be careful!**

## GDB

# Turning in homework
