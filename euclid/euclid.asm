%include "../include/stud_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Euclid's algorithm
;;;;;
;;;;; This implementation was created for educational
;;;;; purposes and supports 8-bit numbers as input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .data
    a db 97          ; input data 
    b db 89
section .text
_start:
    mov cl, byte [a] ; use registers to access input data
    mov bl, byte [b]
again:               ; cycle start
    xor ah, ah       ; make remainder 0 before dividing
    mov al, cl       ; prepare number for division
    div bl           ; divide by second number
    mov cl, bl       ; set divisible for next iteration 
    mov bl, ah       ; set remainder as divisor for next iteration
    cmp ah, 0        ; compare remainder with 0
    jne again        ; if not, jump to next iteration
    FINISH           ; the result is stored in the CL register