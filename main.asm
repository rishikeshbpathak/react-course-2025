; main.asm - Entry point for AssemblyOne
section .text
    global _start

_start:
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, message     ; pointer to message
    mov rdx, msg_len     ; message length
    syscall

    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall

section .data
message db "Hello, AssemblyOne!", 10
msg_len equ $ - message
