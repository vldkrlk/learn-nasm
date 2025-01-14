%include "include/stud_io.inc"

%define VENDOR_ID_LENGTH 12

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Print CPU vendor id 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

global _start

section .bss
    vendorID resb VENDOR_ID_LENGTH      ; CPU vendor id's has the same length - 12 characters

section .text
_start:
    xor eax, eax                        ; Get vendor id
    cpuid                               ; Execute

    mov dword [vendorID], ebx           ; First 4 characters of vendor ID
    mov dword [vendorID+4], edx         ; Next 4 characters of vendor ID
    mov dword [vendorID+8], ecx         ; Last 4 characters of vendor ID

                                        ; Print VendorID
    cld                                 ; Set DF for lodsb
    mov ebx, 0                          ; Characters counter
    mov esi, vendorID                   ; Source address
lp: lodsb                               ; Load char to al
    mov cl, al                          ; Move to cl
    PUTCHAR cl                          ; Print it
    inc ebx                             ; Increment the counter
    cmp ebx, VENDOR_ID_LENGTH           ; Compare counter with size
    jl lp                               ; Jump to next iteration if needed
    PUTCHAR 10                          ; Put \n
    FINISH                      