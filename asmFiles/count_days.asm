org 0x0000 #initialize base address

ori $29, $0, 0xFFFC #initialize stack to 0xFFFC
ori $12, $0, 0x0000 #initialize reg 12 to 0

#constant assignments
ori $4, $0, 0x0001
ori $5, $0, 0x016D #365
ori $6, $0, 0x07D0 #2000
ori $7, $0, 0x001E #30

#variable assignments
ori $8, $0,  0x001C #day
ori $9, $0,  0x0008 #month
ori $10, $0,  0x07DE #year

#ori $10, $0, 0x0004 #first operand
#ori $11, $0, 0x0005 #second operand

subu $15, $9, $4
subu $16, $10, $6

or $3, $0, $16 
or $2, $0, $5

ori $12, $0, 0x0000 #initialize reg 12 to 0
MULT1:
beq $3, $12, FIN1 #count from second operand down to 1
addu $17, $17, $2 #iterated addition operation
addiu $12, $12, 0x0001
j MULT1
FIN1:

or $3, $0, $15 
or $2, $0, $7

ori $12, $0, 0x0000 #initialize reg 12 to 0
MULT2:
beq $3, $12, FIN2 #count from second operand down to 1
addu $18, $18, $2 #iterated addition operation
addiu $12, $12, 0x0001
j MULT2
FIN2:

addu $18, $18, $17
addu $18, $18, $8

HALT
