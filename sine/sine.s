.globl sine


output_string_length = 8
input_string_length = 3
.section .data
# if you need some data, put it here
    strings:
	.asciz "0.00000"
	.asciz "0.09983"
	.asciz "0.19867"
	.asciz "0.29552"
	.asciz "0.38942"
	.asciz "0.47943"
	.asciz "0.56464"
	.asciz "0.64422"
	.asciz "0.71736"
	.asciz "0.78333"
	.asciz "0.84147"
	.asciz "0.89121"
	.asciz "0.93204"
	.asciz "0.96356"
	.asciz "0.98545"
	.asciz "0.99749"
var:
.align 8
.space 100

.section .text

ten:
        add a0, a0, a0
	mv a4, a0
        add a0, a0, a0
        add a0, a0, a0
        add a0, a0, a4
	ret

# Sine
#   Params
#	a1 -- input buffer will contain string with the argument
#	a2 -- output string buffer for the string result
sine:
	# implement here
	mv a7, ra 
	lb a4, 0(a1) # save ceil number 
	addi a4, a4, -48
	mv a0, a4
	call ten
        li a3, 2
        li a6, input_string_length
input_loop_begin:
	beq a3, a6, input_loop_end
	mv a4, a1
	add a4, a4, a3
	lb a4, 0(a4)
        addi a4, a4, -48
        add a0, a0, a4 
        addi a3, a3, 1
        beq a3, a6, input_loop_begin
        call ten
	j input_loop_begin
input_loop_end:
        # selecting appropriate string
	li a3, 0
        la a5, strings
select_loop_begin:
	beq a3, a0, select_loop_end
	addi a3, a3, 1
        addi a5, a5, output_string_length
	j select_loop_begin
select_loop_end:


        # copying answer
        li a3, 0 # counter
        li a4, output_string_length # length of string
output_loop_begin:
        lb a6, 0(a5)
        sw a6, 0(a2)
        addi a5, a5, 1
        addi a2, a2, 1
        addi a3, a3, 1
        bne a3, a4, output_loop_begin
	mv ra, a7
	ret	
