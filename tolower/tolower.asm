%include "include/stud_io.inc"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Make lowercase string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .data
    string db "INSTEAD OF TRYING TO PRODUCE A PROGRAM TO SIMULATE THE ADULT MIND, WHY NOT RATHER TRY TO PRODUCE ONE WHICH SIMULATES THE CHILD'S?", 0

section .text
_start:                         ; calculate a length of string
    mov ecx, 0                  ;   counter
    mov esi, string             ;   source address
l1: lodsb                       ;   read to al
    cmp al, 0                   ;   is it end of string ?
    je l2                       ;   if yes, jump to next step
    inc ecx                     ;   if no, increment the counter
    jmp l1                      ;   and jump to next iteration
                                ; make it lower case
l2: mov edx, ecx                ;   make a copy of string length
    mov esi, string             ;   source address
    mov edi, esi                ;   source and destination addresses are the same
l3: lodsb                       ;   read to al
    cmp al, 64                  ;   check is it an uppercase char
    jng write                   ;   if not, leave it        
    cmp al, 90                  ;   check is it an uppercase char
    jg write                    ;   if not, leave it  
    add al, 32                  ;   add 32 to make it lowercase
write:
    stosb                       ;   write to destination
    loop l3                     ;   go to next byte
                                ; print it              
    mov ebx, 0                  ;   this is a counter
    mov esi, string             ;   source address
l4: lodsb                       ;   read from source to al
    mov cl, al                  ;   move to cl to write it
    PUTCHAR cl                  ;   write to stdout
    inc ebx                     ;   increment the counter
    cmp edx, ebx                ;   compare with length
    jne l4                      ;   if not equal, jump to next iteration
    PUTCHAR 10                  ;   put \n
    FINISH

