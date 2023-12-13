;quiz02_1.asm
;signed char num[10] = {-12, 23, 34, 45, -56, 65, -78, 89, 90, 0};	//8-bit numeric array
;signed char mul_3[10];							//8-bit non-initial variable
;signed char mul_5[10];							//8-bit non-initial variable
;register long rcx = 10							//64-bit register
;register long rbx = 0							//64-bit register
;register long rsi = 0							//64-bit register
;register long rdi = 0							//64-bit register
;while (num[rbx] != 0) {
;	if(num[rbx] % 3 == 0) {
;		mul_3[rsi] = num[rbx];					//copy to mul_3[rsi]
;		rsi++;
;		if (num[rbx] % 5 == 0) {
;			mul_5[rdi] = num[rbx];				//copy to mul_5[rdi]
;			rdi++;
;		}
;	}
;	} else if(num[rbx] % 5 == 0) {
;		mul_5[rdi] = num[rbx];					//copy to mul_5[rdi]
;		rdi++;
;	}
;	rbx++;
;}

section .data
        num      db      -12, 23, 34, 45, -56, 65, -78, 89, -90, 0

section .bss
        mul_3	resb    10
        mul_5	resb    10

section .text
        global _start
_start:
	mov	rbx, 0
	mov	rsi, 0
	mov	rdi, 0
next:
	cmp	byte[num+rbx], 0
	je	done
	mov	al, byte[num+rbx]
	cbw					;movsx   ax, al
	mov	r8b, 3
	idiv	r8b
	cmp	ah, 0
	jne	not_3
	mov	al, byte[num+rbx]
	mov	byte[mul_3+rsi], al
	inc	rsi
not_3:
	mov	al, byte[num+rbx]
	cbw					;movsx   ax, al
	mov	r8b, 5
	idiv	r8b
	cmp	ah, 0
	jne	not_5
	mov	al, byte[num+rbx]
	mov	byte[mul_5+rdi], al
	inc	rdi
not_5:
	inc	rbx
	jmp	next
done:
	mov     rax, 60				;terminate excuting process
	mov     rdi, 0				;exit status
	syscall					;calling system services