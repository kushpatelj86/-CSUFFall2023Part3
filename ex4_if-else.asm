; ex4_if-else.asm
; unsigned char num1 = 9, num2 = 5;
; unsigned char max = 0, min = 0;
; if(num1 < num2) {
;    max = num2; min = num1;
; } else {
;    max = num1; min = num2;
; }

section .data
        num1    db      9					;num1 = 09h
        num2    db      5					;num2 = 05h
        max     db      0                                       ;max = 00h
	min	db	0					;min = 00h
    
section .text
        global _start
_start:
        mov     al, byte[num1]                                  ;al = num1 = 09h
        mov     bl, byte[num2]                                  ;ab = num1 = 05h
        cmp     al, bl                                  	;al-bl = num1-num2
        jae     greater                                         ;if(num1>num2) goto greater
        mov     byte[max], bl                                   ;max = bl
        mov     byte[min], al                                   ;min = al
	jmp	done
greater:
        mov     byte[max], al                                   ;max = al = 09h
        mov     byte[min], bl                                   ;min = bl = 05h
done:
        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services