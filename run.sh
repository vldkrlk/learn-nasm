#!/bin/bash

name=$1
debug=$2

if [ ! $name ]; then
    echo "ERR: name of file must be provided"
    exit 1
fi

if [ ! -d "../bin" ]; then
  mkdir "../bin"
fi

file=$(realpath "$name")/"$name.asm"

if [ ! -f $file ]; then
  echo "ERR: File not found: $file"
  exit 1
fi

nasm -g -f elf -o $name.o $file
gcc -g -nostdlib -m32 -o ../bin/$name $name.o
rm ./$name.o

if [ "$debug" = "debug" ] || [ "$debug" = "d" ]; then
    gdb ../bin/$name
elif [ "$debug" = "" ]; then
    ../bin/$name
else
    echo "ERR: unknown param: $debug"
    exit 1
fi



