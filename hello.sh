#!/bin/bash


#Clear any previously compiled outputs

rm *.o
rm *.out


echo "Assemble hello.asm"
nasm -f elf64 -1 hello.lis -o hello.o hello.asm


echo "Run the hello Program:"
./hello.out

#For cleaner working directory, you can:
rm *.lis
rm *.o
rm *.out


echo "Script file terminated.