        .text
        .globl  main
main:
    sub     $16, %rsp       # alocamos duas palavras na pilha
    movq    $3, 8(%rsp)     # x alocada em sp + 8
    mov     8(%rsp), %rdi
    imul    8(%rsp), %rdi
    call    print_int

    movq    $3, 8(%rsp)     # x alocada em sp + 8
    mov     8(%rsp), %rax
    add     %rax, %rax
    mov     %rax, (%rsp)    # y alocada em sp
    imul    8(%rsp), %rax   # x * y em %rax
    mov     %rax, %rdi      # e guardada em %rdi

    mov     8(%rsp), %rax
    add     $3, %rax
    mov     %rax, (%rsp)    # z alocada igualmente em sp

    mov     $0, %rdx
    mov     (%rsp), %rax
    idivq   %rax            # divide %rdx::%rax por %rax em %rax
    add     %rax, %rdi
    call    print_int

    add     $16, %rsp
    mov     $0, %rax        # terminamos convenientemente
    ret

# uma rotina para mostrar um inteiro (%rdi) com printf
print_int:
        mov     %rdi, %rsi
        mov     $message, %rdi  # argumentos para printf
        mov     $0, %rax
        call    printf
        ret

        .data
message:.string "%d\n"
