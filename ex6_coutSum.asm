; ex6_coutSum.asm
; Calculates  1+2+3+...+9 and displays the result in a terminal window
; char str1[] = "1 + 2 + 3 +...+ 9 = ";
; char ascii[3] = "00\n";
; char sum;
; register char cl = 1;
; for(cl=1; cl<=10; cl++)
;    sum += cl;
; ascii = itoa(sum);
; cout << str1 << ascii;

section .data
str1    db      "1 + 2 + 3 +...+ 9 = "
ascii   db      "00", 10

section .bss
sum     resb	1

section .text
        global _start
_start:
	; calculates 1+2+3+...+9
	mov	cl, 1
next1:
	add	byte[sum], cl			;sum += cl
	inc	cx				;cx++
	cmp	cx, 9				;compare cx with 9
	jbe	next1				;if(cx<=9) goto next1

	; ascii = itoa(sum)
	mov	rcx, 1
	mov	al, byte[sum]			;al = [sum]
next2:
	mov	ah, 0				;ah = 0
	mov	bl, 10				;bl = 10
	div	bl				;ah=(ah:al)%10, al=(ah:al)/10
	add     byte[ascii+rcx], ah		;ascii+0 = ah + 30h
	dec	rcx
	cmp	rcx, 0
	jge	next2

	; cout << str1
        mov     rax, 1				;SYS_write
        mov     rdi, 1				;where to write
        mov     rsi, str1			;address of str1
        mov     rdx, 20				;21 character to write
        syscall					;calling system services

	; cout << ascii
        mov     rax, 1				;SYS_write
        mov     rdi, 1				;where to write
        mov     rsi, ascii			;address of ascii
        mov     rdx, 3				;3 character to write
        syscall					;calling system services

	; exit program
        mov     rax, 60				;terminate excuting process
        mov     rdi, 0				;exit status
        syscall					;calling system services