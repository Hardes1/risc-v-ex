
# syscalls
stdin   = 0
stdout  = 1

exit    = 93
read    = 63
write   = 64
ds	= 0x20000

.section .data 
input:
.align 4
.space 3

output:                
.align 4
.space	100
  

.section .text 
.globl _start

_start:     

	# gp initialization
	li	gp, ds

	li      a0, stdin
        la      a1, input
	li      a7, read
	ecall
	# Buffer initialisation will be here
	la	a2, output
	call 	sine

	li      a7, write
    	li      a0, stdout
        la      a1, output
        li      a2, 7
	ecall 

	# Result checking will be here
	li	a0, 0
	li	a7, exit
	ecall
