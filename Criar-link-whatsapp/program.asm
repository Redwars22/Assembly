; Criado por André Pereira (@Redwars22)
; INSTRUÇÕES:
; 1-Os números de telefone devem estar no formato (42)99999-9999,
; 2-No lugar dos espaços, use %20, que equivale ao espaço em links,
; 3-Caso queira modificar o código, expandi-lo e adicionar mais funcionalidades
; fique à vontade para fazê-lo, contanto que mencione o criador original.

section .data
    link db "LINK: "
    estruturaLink db "https://api.whatsapp.com/send?phone"
    obtemNumero db "Digite o número: "
    obtemMensagem db "Digite a mensagem: "
    estruturaMensagem db "&text="
    interface db "##########{ GERADOR DE LINKS DO WHATSAPP }##########", 10
    autor db "Criado por @Redwars22. Visite meu GitHub em github.com/Redwars22!", 10
    dashed db "------------------------------------------------", 10

section .bss
    numero resb 15
    mensagem resb 255 

section .text
    global _start 

_start:
    call _desenhaInterface
    call _obterNumero
    call _obterMensagem
    call _gerarLink
    mov rax, 60
    mov rdi, 0
    syscall

_obterNumero:
    mov rax, 1
    mov rdi, 1
    mov rsi, obtemNumero
    mov rdx, 17
    syscall
    mov rax, 0
    mov rdi, 0
    mov rsi, numero
    mov rdx, 15
    syscall
    ret

_obterMensagem:
    mov rax, 1
    mov rdi, 1
    mov rsi, obtemMensagem
    mov rdx, 19
    syscall
    mov rax, 0
    mov rdi, 0
    mov rsi, mensagem
    mov rdx, 255
    syscall
    ret

_gerarLink:
    mov rax, 1
    mov rdi, 1
    mov rsi, link
    mov rdx, 6
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, estruturaLink
    mov rdx, 35
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, numero
    mov rdx, 14
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, estruturaMensagem
    mov rdx, 6
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, mensagem
    mov rdx, 255
    syscall
    ret

_desenhaInterface:
    mov rax, 1
    mov rdi, 1
    mov rsi, interface
    mov rdx, 53
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, autor
    mov rdx, 66
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, dashed
    mov rdx, 49
    syscall
    ret