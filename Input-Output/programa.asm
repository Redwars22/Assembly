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
    call _printDataToScreen
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
    call _getAge

    ;obter descricao
    mov rax, 1
    mov rdi, 1
    mov rsi, insertDescription
    mov rdx, 12
    syscall
    call _getDescription
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_getAge:
    mov rax, 0
    mov rdi, 0
    mov rsi, age
    mov rdx, 16
    syscall
    ret

_getDescription:
    mov rax, 0
    mov rdi, 0
    mov rsi, description
    mov rdx, 16
    syscall
    ret

_printDataToScreen:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 17
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, 10
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, age
    mov rdx, 2
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, 10
    mov rdx, 1
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, description
    mov rdx, 255
    syscall
    ret
