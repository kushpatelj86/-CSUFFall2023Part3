; ex4_if-else.asm
; unsigned char num1 = 9, num2 = 5;
; unsigned char max = 0, min = 0;
; if(num1 < num2) {
;    max = num2; min = num1;
; } else {
;    max = num1; min = num2;
; }

section .data
        num    dw      225					;num1 = 09h
	mul_15 db      0					;num1 = 09h
      	other  db      0					;num1 = 09h
  
section .text
        global _start
_start:
        mov     ax, word[num]   ;al = num1 = 09h
        mov     bl, 3
        div     bl
        cmp     ah, 0                                 	   ;al-bl = num1-num2
        je      mul_3
	   

mul_3:
        mov     ax, word[num]   ;al = num1 = 09h
        mov     bl, 5
        div     bl
        cmp     ah, 0                                 	   ;al-bl = num1-num2
        je      mul_5
 

mul_5:   
         inc mul_15
         jmp done




done:
        mov     rax, 60                                         ;terminate excuting process
        mov     rdi, 0                                          ;exit status
        syscall                                                 ;calling system services