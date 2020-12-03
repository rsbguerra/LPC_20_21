	.text
	.globl	main
main:
	movq %rsp, %rbp
	pushq $1
	popq %rdi
	call print_int
	pushq $1
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $4
	pushq $1
	pushq $0
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rbx
	popq %rax
	subq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $0
	pushq $0
	pushq $4
	popq %rbx
	popq %rax
	subq %rbx, %rax
	pushq %rax
	popq %rbx
	popq %rax
	subq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $2
	popq %rax
	movq %rax, x
	pushq x
	pushq x
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $3
	popq %rax
	movq %rax, x
	pushq $2
	pushq x
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	subq $8, %rsp
	pushq $2
	popq %rax
	movq %rax, 8(%rbp)
	pushq $3
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	addq $8, %rsp
	call print_int
	subq $8, %rsp
	pushq $1
	pushq $2
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rax
	movq %rax, 8(%rbp)
	pushq $2
	pushq 8(%rbp)
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	popq %rdi
	addq $8, %rsp
	call print_int
	subq $8, %rsp
	pushq $1
	popq %rax
	movq %rax, 8(%rbp)
	pushq 8(%rbp)
	pushq $2
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq $2
	popq %rax
	movq %rax, 8(%rbp)
	pushq 8(%rbp)
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	popq %rdi
	addq $8, %rsp
	call print_int
	subq $24, %rsp
	pushq $1
	popq %rax
	movq %rax, 8(%rbp)
	pushq $2
	popq %rax
	movq %rax, 16(%rbp)
	pushq $3
	popq %rax
	movq %rax, 24(%rbp)
	pushq 8(%rbp)
	pushq 16(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq 24(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rax
	movq %rax, y
	addq $24, %rsp
	pushq y
	pushq $4
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	subq $8, %rsp
	pushq $5
	popq %rax
	movq %rax, 8(%rbp)
	pushq 8(%rbp)
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	addq $8, %rsp
	call print_int
	pushq y
	pushq y
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $13
	call id
	addq $8, %rsp
	pushq %rax
	popq %rdi
	call print_int
	pushq $12
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	call succ
	addq $8, %rsp
	pushq %rax
	popq %rdi
	call print_int
	pushq $20
	pushq $5
	call subt
	addq $16, %rsp
	pushq %rax
	popq %rdi
	call print_int
	pushq $2
	call f
	addq $8, %rsp
	pushq %rax
	popq %rdi
	call print_int
	subq $16, %rsp
	pushq $4
	popq %rax
	movq %rax, 8(%rbp)
	pushq $1
	call f
	addq $8, %rsp
	pushq %rax
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq $0
	call f
	addq $8, %rsp
	pushq %rax
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq $3
	popq %rax
	movq %rax, 16(%rbp)
	pushq $1
	call f
	addq $8, %rsp
	pushq %rax
	pushq 16(%rbp)
	popq %rbx
	popq %rax
	subq %rbx, %rax
	pushq %rax
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	addq $16, %rsp
	call print_int
	pushq $1
	call succ
	addq $8, %rsp
	pushq %rax
	call f
	addq $8, %rsp
	pushq %rax
	pushq $2
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rdi
	call print_int
	pushq $3
	pushq $2
	pushq $1
	call g
	addq $24, %rsp
	pushq %rax
	popq %rdi
	call print_int
	movq $0, %rax
	ret
print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	movq $0, %rax
	call printf
	ret
g:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	pushq 32(%rbp)
	call f
	addq $8, %rsp
	pushq %rax
	pushq 24(%rbp)
	call f
	addq $8, %rsp
	pushq %rax
	call subt
	addq $16, %rsp
	pushq %rax
	pushq 16(%rbp)
	call subt
	addq $16, %rsp
	pushq %rax
	popq %rax
	addq $0, %rsp
	popq %rbp
	ret
f:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	pushq 16(%rbp)
	pushq 16(%rbp)
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rax
	movq %rax, 8(%rbp)
	pushq 8(%rbp)
	pushq 8(%rbp)
	popq %rbx
	popq %rax
	imulq %rbx, %rax
	pushq %rax
	popq %rax
	addq $8, %rsp
	popq %rbp
	ret
subt:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	pushq 24(%rbp)
	pushq 16(%rbp)
	popq %rbx
	popq %rax
	subq %rbx, %rax
	pushq %rax
	popq %rax
	addq $0, %rsp
	popq %rbp
	ret
succ:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	pushq 16(%rbp)
	pushq $1
	popq %rbx
	popq %rax
	addq %rbx, %rax
	pushq %rax
	popq %rax
	addq $0, %rsp
	popq %rbp
	ret
id:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	pushq 16(%rbp)
	popq %rax
	addq $0, %rsp
	popq %rbp
	ret
	.data
x:
	.quad 1
y:
	.quad 1
.Sprint_int:
	.string "%d\n"
