% CSE30 Discussion 5
% Ibrahim Awwal
% July 13, 2015

# Raspberry Pi setup Redux

## Port forwarding

- Makes a local port available on the internet on a different port (not needed from UCSD-PROTECTED)
- This means you can ssh into your Raspberry Pi from outside your LAN
- Run `rpi_upnp.sh` from [github.com/ibrahima/raspi_networking](http://github.com/ibrahima/raspi_networking)
    - Uses UPnP to automatically open an external port on your router
    - Default port is 10022
- `ssh pi@@your-public-ip -p 10022`

## Dynamic DNS

- Lets you set up a custom domain name for your public IP address (which could change)
- DuckDNS is a free no-nonsense service provider, feel free to use any other
- Detailed instructions are [on github](http://github.com/ibrahima/raspi_networking/duckdns.md)
- Once you've set this up, you can then do `ssh pi@@you.duckdns.org -p 10022`

## SSH configuration

- Can store commonly used hosts in `~/.ssh/config` (Linux/Mac)

~~~~ {.config}
\include{src/ssh_config}
~~~~

- If you [set up an SSH key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2) without a passphrase or use `ssh-agent`, you can avoid typing your password too
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

## Questions?

# ARM Assembly

## Instruction Types

## Instruction Format

## Accessing Memory

## Function calls

## System calls

## Generating Assembly from C

- `gcc source.c -S` will output source.s assembly
- `gcc -c -g -Wa,-a,-ad source.c > source.lst` will output a mixed C/assembly listing
- latter command taken from [http://www.delorie.com/djgpp/v2faq/faq8_20.html](http://www.delorie.com/djgpp/v2faq/faq8_20.html)

## Tips

- Comment **every** line, every function

# Translating C to assembly

##

# Assembly examples and puzzles

## Understanding instructions

\note{Put in some simple instructions, decode what they are doing}
\note{different arithmetic operations, moving values around, creating masks, memory addressing}

## Comparing GCC output

## Puzzle 1

\note{Exponentiation}

## Puzzle 2

\note{strcpy}

## Puzzle 3

\note{Self modifying assembly to create a loop}

## Fun note: TIS-100

- There's an actual assembly language programming game called [TIS-100](http://store.steampowered.com/app/370360) on Steam
- Haven't tried it but it could be fun and educational
