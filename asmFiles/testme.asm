main:
    ori $29, $0, 0xFFFC
    ori $12, $0, 0x0000
    addi $a1, $1, 1
    jal test
    addi $4, $5, 3
    halt
test:
    addi $a2, $1, 2
    jr $ra
