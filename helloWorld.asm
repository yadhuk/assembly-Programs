BITS 32

extern printf

section .data:
    hello_world db "Hello World !", 10, 0

section .text
    global main

    main:
        push ebp
        mov ebp, esp

        push hello_world
        call printf
        add esp, 4

        pop ebp
        ret
