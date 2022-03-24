#!/bin/bash
clear
nasm -f elf64 programa.asm -o programa.o
ld programa.o -o programa
echo "Compilou!!!"