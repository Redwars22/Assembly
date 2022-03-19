; nasm -f elf64 -o NOME.o NOME.asm
; ld NOME.o -o NOME

; seção de variáveis
section .data
    ; db = bytes de dados
    ; caractere \n
    text db "Hello, World!", 10

; seção do código
section .text
    global _start

; função main
; rax, rbx etc... registros 64bit
; eax - registro 32bit
; syscall - chamada de sistema/kernel + argumento
; mov rax, chamada do sistema(argumento) e em seguida syscall
; mov rdi, 1 - standard output/2 - standard input
; mov rsi, nome da variável
; mov rdx, quantidade de caracteres/tamanho
; 0 - read, 1 - write, 2 - open, 3 - close

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall

; sys_exit => rax 60
; rdi -> código de erro... normalmente 0
    mov rax, 60
    mov rdi, 0
    syscall 