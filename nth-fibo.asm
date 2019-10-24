BITS 32

extern scanf
extern printf

section .data
        format: db "%d",0
        out: db "%d",10,0
section .text
global main

   main:
        push ebp
        mov ebp,esp
        sub esp,0x10

        lea eax,[ebp-0x4]
        push eax
        push format
        call scanf

        mov DWORD [ebp-0x8], 0
        mov eax, DWORD [ebp-0x4]
        mov ebx,0
        mov ecx,1

        cmp eax,1
        jnz nx
        mov ecx,0
        jmp endz

   nx:
        sub eax,2

   looop:
        add DWORD [ebp-0x8],1
        mov edx,ecx
        add ecx,ebx
        mov ebx,edx
        cmp DWORD [ebp-0x8],eax

        jl looop

   endz:

        push ecx
        push out
        call printf

    leave
    ret
