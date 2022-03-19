section .data
    msg db "Keynote", 10
    msg2 db "Digite o texto", 10

section .text
    global _start
    call _write2

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg 
    mov rdx, 6
    syscall

_write2:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, 27
    syscall

    mov rax, 60
    mov rdi, 0
    syscall