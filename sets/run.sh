#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o set.o set.asm
gcc -g -nostdlib -m32 -o ../bin/set set.o
rm ./set.o
../bin/set