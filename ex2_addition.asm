; ex2_addition.asm
; unsigned char num1 = 100, num2 = 200;
; unsigned short sum = 0;
; sum = short(num1 + num2);

section .data
        num1     db      100			;num1 = 64h
        num2     db      200			;num2 = 0C8h
        sum      dw      0			;sum = 00h

section .text
        global _start
_start:
	mov	ah, 0
        mov     al, byte[num1]			;al = num1 = 64h
        add     al, byte[num2]			;al = al + num2 = 2Ch
	adc	ah, 0				;ah = ah + 0 + CF = 01h
        mov     byte[sum+0], al			;sum = al = 9ch
        mov     byte[sum+1], ah			;sum = ah = 0ffh
						;mov word[sum], ax
        mov     rax, 60				;terminate excuting process
        mov     rdi, 0				;exit status
        syscall					;calling system services
    %line 1+1 addition.asm

     2                                 

     3                                 

     4                                 

     5                                 

     6                                 

     7                                 

     8                                 [section .data]

     9                    num1 dw 50000

    10                   num2 dw 40000

    11               sum dd 0

    12                                 

    13                                 [section .text]

    14                                 [global _start]

                               _start:

                      mov ah, 0

          mov al, byte[num1]

            add al, byte[num2]

                   adc ah, 0


        mov byte[sum+1], ah

    

    23 00000021 48C7C03C000000          mov rax, 60

    24 00000028 48C7C700000000          mov rdi, 0

    25 0000002F 0F05                    syscall

    26                                 

    27                                 rm rm