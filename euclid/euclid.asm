%include "../include/stud_io.inc"

global _start
section .data
    a db 97
    b db 89
section .text
_start:
    mov cl, byte [a]
    mov bl, byte [b]
again:
    xor ah, ah
    mov al, cl
    div bl
    mov cl, bl
    mov bl, ah
    cmp ah, 0
    jne again
    FINISH