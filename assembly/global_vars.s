    .text
    .globl  main
main:
    movq    $2, x
    mov     x, %rcx
    imul    %rcx, %rcx
    mov     %rcx, y
    mov     x, %rdi
    add     y, %rdi
    call    print_int

    mov     $0, %rax    # terminamos de forma limpa
    ret

# uma rotina para mostrar um inteiro (%rdi) com printf
print_int:
   mov     %rdi, %rsi
   mov     $message, %rdi  # argumentos para printf
   mov     $0, %rax
   call    printf
    ret

    .data
message:
    .string "%d\n"
x:
    .quad   0
y:
    .quad   0
