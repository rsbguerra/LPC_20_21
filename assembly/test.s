        .text
        .globl  main
main:
    pushq x
    popq %rdi
    call print_int
    mov $0, %rax
    ret

print_int:
    mov     %rdi, %rsi
    mov     $message, %rdi  # argumentos para printf
    mov     $0, %rax
    call    printf
    ret

.data
x: .quad 42
message: .string "%d\n"
