%include "../include/stud_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Reverse string using stack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global _start
section .data
    string db "gnirts a si sihT", 0

section .text
_start:
                                ; push characters to stack
    cld                         ;   set direction
    mov esi, string             ;   set source address
    mov ecx, 0                  ;   characters counter
lp: lodsb                       ;   load to from source
    cmp al, 0                   ;   is it end of string?
    je lpquit                   ;   yes - quit
    inc ecx                     ;   increment counter
    push eax                    ;   push to stack
    jmp lp                      ;   next iteration
lpquit:                         ; write string from stack
    jcxz finish                 ;   finish if counter is 0
    mov edx, ecx                ;   make a copy of string length
    mov edi, string             ;   destination address
lp2:pop eax                     ;   get from stack
    stosb                       ;   write to memory
    loop lp2                    ;   continue loop
                                ; print string
    mov ebx, 0                  ;   this is a counter
    mov esi, string             ;   source address
l3: lodsb                       ;   read from source to al
    mov cl, al                  ;   move to cl to write it
    PUTCHAR cl                  ;   write to stdout
    inc ebx                     ;   increment the counter
    cmp edx, ebx                ;   compare with length
    jne l3                      ;   if not equal, jump to next iteration
    PUTCHAR 10                  ;   put \n
finish:
    FINISH

