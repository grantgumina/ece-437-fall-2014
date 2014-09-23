org 0x0000

ori $29, $0, 0xFFFC #stack initialization
ori $20, $0, 0x0002 #operand 1
ori $21, $0, 0x0003 #operand 2
ori $22, $0, 0x0004 #operand 3
ori $23, $0, 0x0005 #operand 4
ori $5,  $0, 0x0000 #operand counter
ori $6,  $0, 0x0003 #operand amount

push $23
push $22
push $21
push $20

PROCEDURE:
	beq $6, $5, FIN #count up to operand number
	pop $2
	pop $3
	ori $10, $0, 0x0000 #initialize reg 10 to 0 for loop counting
	MULT:
		beq $3, $10, DONE #count from zero up to second operand
		addu $11, $11, $2 #iterated addition operation: store result in reg 11
		addiu $10, $10, 0x0001
		j MULT
	DONE:
	push $11 #push result on to stack
	ori $11, $0, 0x0000
	addiu $5, $5, 0x0001 #increment operand counter
	j PROCEDURE
FIN:
pop $11
HALT
