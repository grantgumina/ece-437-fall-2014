org 0x0000 #initialize base address

ori $29, $0, 0xFFFC #initialize stack to 0xFFFC
ori $12, $0, 0x0000 #initialize reg 12 to 0

ori $10, $0, 0x0004 #first operand
ori $11, $0, 0x0005 #second operand

push $10 #first operand
push $11 #second operand

pop $3 #second operand
pop $2 #first operand

#or $13, $11, $0 #store second operand in reg 13 for loop counting

ITER:
beq $3, $12, FIN #count from second operand down to 1
addu $14, $14, $2 #iterated addition operation
addiu $12, $12, 0x0001
j ITER

FIN:
HALT

