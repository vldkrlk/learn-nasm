#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o factorial.o factorial.asm
gcc -g -nostdlib -m32 -o ../bin/factorial factorial.o
rm ./factorial.o
gdb ../bin/factorial