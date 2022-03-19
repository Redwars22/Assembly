section .data
    text db "Insira o nome: ", 10
    text2 db "Olá, "

section .bss
    ;nome RESERVAR BYTES tamanho
    name resb 16

section .text
    global _start

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName

    ;Terminar programa
    mov rax, 60
    mov rdi, 0
    syscall

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 15
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 5
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret