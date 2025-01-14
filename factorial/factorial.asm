%include "../include/stud_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Factorial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .data
    input  dd 5         ; input 
section .text
_start:
    mov eax, 1          
    mov ebx, [input]
lp: cmp ebx, 1
    jng finish
    mul ebx
    dec ebx
    jmp lp
finish:                 ; result is in eax
    FINISH