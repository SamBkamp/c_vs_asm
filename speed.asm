section .text
global _start
	
_start:
	cmp    byte [esp], 0x3	;check argc
	jl     tl_args		;exit
        mov    eax, [esp+0x8]	;move argv[1] into eax
	mov    ebx,0x0		;keep track of value stored

read_num_1 :
	movzx  ecx, byte [eax]	;read first byte from argv[1]
	sub    ecx,0x30		;turn into decimal
	add    ebx,ecx		;add to running counter
	inc    eax		;read next byte
	cmp    byte [eax], 0x0	;if its null then exit read loop
	jne    read_num_1

	
	mov    eax,[esp+12]
	mov    ecx,[eax]
	and    ecx,0xff
	sub    ecx,0x30
	
	add    ebx,ecx		;actual addition happens here
	
	sub    esp,0x1	
	mov    byte [esp],0xa
	push   0x1
	mov    eax,ebx

i_to_ascii :
	mov    edx,0x0
	mov    ecx,0xa
	div    ecx
	mov    ecx,edx
	add    ecx,0x30
	pop    ebx
	inc    ebx
	sub    esp,0x1
	mov    [esp],cl
	push   ebx
	test   eax,eax
	je     print_res
	jne    i_to_ascii

print_res:
	mov    eax,0x4
	mov    ebx,0x1
	pop    edx
	lea    ecx,[esp]
	int    0x80
	jmp    exit

tl_args:
	mov    eax,0x4
	mov    ebx,0x1
	mov    ecx,0x804a000
	mov    edx,0x1d
	int    0x80

exit:
	mov    eax,0x1
	mov    ebx,0x0
	int    0x80

section .data
	msg db "usage: ./a.out <int> <int>", 0xa
	len equ $-msg
