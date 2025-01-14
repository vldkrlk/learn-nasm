#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o cpuid.o cpuid.asm
gcc -g -nostdlib -m32 -o ../bin/cpuid cpuid.o
rm ./cpuid.o
gdb ../bin/cpuid