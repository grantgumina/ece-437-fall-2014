# Multicore coherence test
# stores 0xDEADBEEF to value

#core 1
org 0x0000
  ori $t0, $0, word1
  lw  $t1, 0($t0)
  halt

# core 2
org 0x0200
  ori $t0, $0, word2
  lw  $t1, 0($t0)
  halt

org 0x0408
word1:
  cfw 0x0000DEAD
  cfw 0
word2:
  cfw 0x0000BEEF
