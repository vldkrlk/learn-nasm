#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o euclid.o euclid.asm
gcc -g -nostdlib -m32 -o ../bin/euclid euclid.o
rm ./euclid.o
gdb ../bin/euclid