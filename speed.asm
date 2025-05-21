section .text
global _start
	
	
_start:
	cmp    byte [esp], 0x3	;check argc
	jl     tl_args		;exit
        mov    eax, [esp+0x8]	;move argv[1] into eax
	mov    ebx,0x0		;keep track of value stored
	
read_num:			;needs ebx set to 0 and eax to point to null terminated string to convert
	mov ecx, ebx		;multiply by 10 (shift left by 3, and by 1 then add together)
	shl ecx, 3		;do this every new digit read
	shl ebx, 1
	add ebx, ecx
		
	movzx  ecx, byte [eax]	;read first byte from argv[1]
	sub    ecx,0x30		;turn into decimal
	add    ebx,ecx		;add to running counter
	inc    eax		;read next byte
	cmp    byte [eax], 0x0	;if its null then exit read loop
	jne    read_num
		
	mov eax, [esp+12]
	push ebx
	mov ebx, 0

read_num_2:			;needs ebx set to 0 and eax to point to null terminated string to convert
	mov ecx, ebx		;multiply by 10 (shift left by 3, and by 1 then add together)
	shl ecx, 3		;do this every new digit read
	shl ebx, 1
	add ebx, ecx
		
	movzx  ecx, byte [eax]	;read first byte from argv[1]
	sub    ecx,0x30		;turn into decimal
	add    ebx,ecx		;add to running counter
	inc    eax		;read next byte
	cmp    byte [eax], 0x0	;if its null then exit read loop
	jne    read_num_2
	
	pop ecx
	
	add    ebx,ecx		;actual addition happens here
	
	sub    esp,0x1		;make space on stack
	mov    byte [esp],0xa	;\n to end of buffer
	push   0x1		;keep track of strlen (starting at 1 bc of \n above)
	mov    eax,ebx		;eax reg 

i_to_ascii :
	mov    edx,0x0		;set upper bytes of divisor reg
	mov    ecx,10		;divisor
	div    ecx		;divide implied reg eax by ecx
	mov    ecx,edx		;move remainder
	add    ecx,0x30		;turn into ascii
	
	pop    ebx		;increment strlen counter
	inc    ebx
	sub    esp,0x1		;make space for new char on stack
	mov    [esp],cl		;put new char on stack
	push   ebx		;add counter back on stack
	
	test   eax,eax		;quotient (eax) of div is tested if 0 (less than 10)
	je     print_res
	jne    i_to_ascii

print_res:
	mov    eax,0x4		;syswrite
	mov    ebx,0x1
	pop    edx		;strlen on the stack
	lea    ecx,[esp]	;string follows
	int    0x80
	jmp    exit

tl_args:
	mov    eax,0x4		;sys write
	mov    ebx,0x1
	mov    ecx, msg
	mov    edx, len
	int    0x80

exit:
	mov    eax,0x1		;sys exit
	mov    ebx,0x0
	int    0x80

section .data
	msg db "usage: ./a.out <int> <int>", 0xa
	len equ $-msg
