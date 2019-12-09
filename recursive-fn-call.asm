BITS 32

extern printf
extern scanf

section .rodata:
    formatOut : db "%d", 10, 0
    formatIn : db "%d", 0

section .text
    global main

    main:
        push ebp
        mov ebp, esp
        sub esp, 8

        lea eax, [ebp-0x4]
        push eax
        push formatIn
        call scanf
        mov edi, [ebp-0x4]
        call fact                               
        mov DWORD [ebp-4], eax
        push eax
        push formatOut
        call printf

        add esp, 8
        leave
        ret

    fact:
        push ebp                         
        mov ebp, esp
        sub esp, 8        
        mov DWORD [ebp-4], edi
        cmp DWORD [ebp-4], 0
        
        jne NEXT
        mov eax, 1
        jmp END

        NEXT:
        mov eax, DWORD [ebp-4]
        sub eax, 1
        mov edi, eax
        call fact
        imul eax, DWORD [ebp-4]

        END:
        leave
        ret