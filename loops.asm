BITS 32

extern printf

section .data:
    format db "The number is %d", 10, 0

section .text:
    global main

    main:
        push ebp
        mov ebp, esp
        mov DWORD  [ebp-0x4], 0
        

    looper:
        add DWORD  [ebp-0x4],1
        mov eax, [ebp-0x4]

        push eax
        push format
        call printf
        add esp, 8
        cmp DWORD  [ebp-0x4], 20
        jne looper


    mov eax, 0 
    mov esp, ebp
    pop ebp
    ret

