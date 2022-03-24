section .data
    insertName db "Nome: "
    insertAge db "Idade: "
    insertDescription db "Descrição: "

section .bss
    name resb 16
    age resb 2
    description resb 255

section .text
    global _start

_start:
    call _getData
    mov rax, 60
    mov rdi, 0
    syscall

_getData:
    ; obter nome
    mov rax, 1
    mov rdi, 1
    mov rsi, insertName
    mov rdx, 6
    syscall
    call _getName

    ;obter idade
    mov rax, 1
    mov rdi, 1
    mov rsi, insertAge
    mov rdx, 7
    syscall
    ;call _getAge

    ;obter descricao
    mov rax, 1
    mov rdi, 1
    mov rsi, insertDescription
    mov rdx, 12
    syscall
    ;call _getDescription
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_getAge:

_getDescription:

_printDataToScreen:
