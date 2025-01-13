#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o tolower.o tolower.asm
gcc -g -nostdlib -m32 -o ../bin/tolower tolower.o
rm ./tolower.o
../bin/tolower