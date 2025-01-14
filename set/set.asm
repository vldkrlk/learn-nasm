%include "include/stud_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Working with sets
;;;;; This code creates a set of 512 elements
;;;;; and sets 76 element included to this set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .text
_start:
    xor eax, eax                        ; set array elements to 0
    mov edi, set512
    mov ecx, 16
    cld
lp: stosd
    loop lp
                                        ; find element indexes
    mov     ebx, 76                     ;   this is a bit index in array
    mov     edx, ebx                    ;   make a copy
    and     ebx, 11111b                 ;   remainder of division by 32 - index of bit inside an array element
    shr     edx, 5                      ;   shift by 5 to get an array index
    mov     bh, dl                      ;   move to ebx
                                        ; create a mask
    mov     edx, 1                      ;   set 1 to shift it
    mov     cl, bl                      ;   shift index in array element  
    shl     edx, cl                     ;   shift by index 
                                        ; set byte in array element
    mov esi, set512
    shr     ebx, 8                      ;   remove the remainder to access an array element
    or      dword [esi+4*ebx-4], edx    ;   apply a mask to an array element
    mov     eax, dword [esi+4*ebx-4]    ; set the appropriate element in eax to make it easier to debug
    FINISH

section .bss
    set512 resd 16                      ; set of elemets
