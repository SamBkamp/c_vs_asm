
a.out:     file format elf32-i386


Disassembly of section .text:

08049000 <_start>:
 8049000:	80 3c 24 03          	cmp    BYTE PTR [esp],0x3
 8049004:	7c 65                	jl     804906b <tl_args>
 8049006:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 804900a:	bb 00 00 00 00       	mov    ebx,0x0

0804900f <read_num_1>:
 804900f:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
 8049012:	83 e9 30             	sub    ecx,0x30
 8049015:	01 cb                	add    ebx,ecx
 8049017:	40                   	inc    eax
 8049018:	80 38 00             	cmp    BYTE PTR [eax],0x0
 804901b:	75 f2                	jne    804900f <read_num_1>
 804901d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 8049021:	8b 08                	mov    ecx,DWORD PTR [eax]
 8049023:	81 e1 ff 00 00 00    	and    ecx,0xff
 8049029:	83 e9 30             	sub    ecx,0x30
 804902c:	01 cb                	add    ebx,ecx
 804902e:	83 ec 01             	sub    esp,0x1
 8049031:	c6 04 24 0a          	mov    BYTE PTR [esp],0xa
 8049035:	6a 01                	push   0x1
 8049037:	89 d8                	mov    eax,ebx

08049039 <i_to_ascii>:
 8049039:	ba 00 00 00 00       	mov    edx,0x0
 804903e:	b9 0a 00 00 00       	mov    ecx,0xa
 8049043:	f7 f1                	div    ecx
 8049045:	89 d1                	mov    ecx,edx
 8049047:	83 c1 30             	add    ecx,0x30
 804904a:	5b                   	pop    ebx
 804904b:	43                   	inc    ebx
 804904c:	83 ec 01             	sub    esp,0x1
 804904f:	88 0c 24             	mov    BYTE PTR [esp],cl
 8049052:	53                   	push   ebx
 8049053:	85 c0                	test   eax,eax
 8049055:	74 02                	je     8049059 <print_res>
 8049057:	75 e0                	jne    8049039 <i_to_ascii>

08049059 <print_res>:
 8049059:	b8 04 00 00 00       	mov    eax,0x4
 804905e:	bb 01 00 00 00       	mov    ebx,0x1
 8049063:	5a                   	pop    edx
 8049064:	8d 0c 24             	lea    ecx,[esp]
 8049067:	cd 80                	int    0x80
 8049069:	eb 16                	jmp    8049081 <exit>

0804906b <tl_args>:
 804906b:	b8 04 00 00 00       	mov    eax,0x4
 8049070:	bb 01 00 00 00       	mov    ebx,0x1
 8049075:	b9 00 a0 04 08       	mov    ecx,0x804a000
 804907a:	ba 1d 00 00 00       	mov    edx,0x1d
 804907f:	cd 80                	int    0x80

08049081 <exit>:
 8049081:	b8 01 00 00 00       	mov    eax,0x1
 8049086:	bb 00 00 00 00       	mov    ebx,0x0
 804908b:	cd 80                	int    0x80
