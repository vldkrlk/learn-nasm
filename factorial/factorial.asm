%include "../include/stud_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Factorial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .data
    input  dd 5         ; input 
    result dq ?         ; result   
section .text
_start:
    mov ebx, [input]    ; previous number
    mov ecx, 1          ; here's the result
again:                  
    cmp ebx, 1          ; 
    je finish
    mul ebx
    dec ebx
    jmp again

finish:
    FINISH