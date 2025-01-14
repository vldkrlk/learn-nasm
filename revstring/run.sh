#!/bin/bash
if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi
nasm -g -f elf -o revstring.o revstring.asm
gcc -g -nostdlib -m32 -o ../bin/revstring revstring.o
rm ./revstring.o
../bin/revstring