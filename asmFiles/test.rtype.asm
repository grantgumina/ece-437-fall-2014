
  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x37F1

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

# Now running all R type instructions
  nop
  nop
  nop
  or    $3,$1,$2
  nop
  nop
  nop
  and   $4,$1,$2
  nop
  nop
  nop
  andi  $5,$1,0xF
  nop
  nop
  nop
  addu  $6,$1,$2
  nop
  nop
  nop
  addiu $7,$3,0x8740
  nop
  nop
  nop
  subu  $8,$4,$2
  nop
  nop
  nop
  xor   $9,$5,$2
  nop
  nop
  nop
  xori  $10,$1,0xf33f
  nop
  nop
  nop
  sll   $11,$1,4
  nop
  nop
  nop
  srl   $12,$1,5
  nop
  nop
  nop
  nor   $13,$1,$2
  nop
  nop
  nop
# Store them to verify the results
  sw    $13,0($22)
  nop
  nop
  nop
  sw    $3,0($21)
  nop
  nop
  nop
  sw    $4,4($21)
  nop
  nop
  nop
  sw    $5,8($21)
  nop
  nop
  nop
  sw    $6,12($21)
  nop
  nop
  nop
  sw    $7,16($21)
  nop
  nop
  nop
  sw    $8,20($21)
  nop
  nop
  nop
  sw    $9,24($21)
  nop
  nop
  nop
  sw    $10,28($21)
  nop
  nop
  nop
  sw    $11,32($21)
  nop
  nop
  nop
  sw    $12,36($21)
  halt  # that's all
