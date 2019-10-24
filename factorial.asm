BITS 32

extern printf
extern scanf

section .data:
    format db "%d", 0
    formatOut db "%d", 10, 0

section .text:

    global main
    main:
        push ebp
        mov ebp, esp

        mov dword [ebp - 0x4], 1
        lea eax, [ebp-0x4]
        push eax
        push format
        call scanf     

        mov eax, dword [ebp - 0x4]
        mov dword [ebp - 0x8], eax

    loopin:
        sub dword[ebp-0x8], 1
        mov eax, dword[ebp-0x8]
        mov ebx, dword [ebp - 0x4]
        imul ebx, eax
        mov dword [ebp - 0x4], ebx
        cmp dword[ebp-0x8], 1
        jne loopin

        push dword [ebp-0x4]
        push formatOut
        call printf
        add esp, 8

        leave
        ret

