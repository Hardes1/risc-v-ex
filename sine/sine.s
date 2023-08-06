.globl sine


output_string_length = 6
truncated_string_length = 4
.section .data
# if you need some data, put it here
    strings:
	.ascii "0000"
	.ascii "0998"
	.ascii "1986"
	.ascii "2955"
	.ascii "3894"
	.ascii "4794"
	.ascii "5646"
	.ascii "6442"
	.ascii "7173"
	.ascii "7833"
	.ascii "8414"
	.ascii "8912"
	.ascii "9320"
	.ascii "9635"
	.ascii "9854"
	.ascii "9974"
.section .text
# Sine
#   Params
#	a1 -- input buffer will contain string with the argument
#	a2 -- output string buffer for the string result
sine:
	# implement here
	lb a0, 0(a1) # save ceil number 
	addi a0, a0, -48
	beq a0, zero, post
	li a0, 10
post: 
        lb a4, 2(a1)
        add  a0, a4, a0
        addi a0, a0, -48
        # selecting appropriate string
	slli a0, a0, 2
        la a5, strings
	add a5, a5, a0

        # copying answer
	li a3, 11824
        sh a3, 0(a2)
	lw a6, 0(a5)
	sw a6, 2(a2)
        sb zero, 6(a2)
	ret	
