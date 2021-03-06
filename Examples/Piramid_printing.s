
# Read a number and print the following format:
#    1
#    1 2
#    1 2 3
#    1 2 3 4
#    .....
#    1 2 3 4 5 .... N

  .data
line: .asciiz "\n"
  .text
  .globl main

main:

  li $v0 5                        #read int
  syscall
  move $t0 $v0                    #Save number

  li $a0 1                        #Result
  li $t1 1                        #Meter
  li $t2 10                       #Increment
loop:
  li $v0 1                        #Print int
  syscall

  mul $a0 $a0, $t2                #Move everything to the left
  addi $t1 $t1, 1                 #Increment meter
  add $a0 $a0, $t1                #Add meter

  move $t3 $a0                    #Save number, print new line and recover number
  li $v0 4
  la $a0 line
  syscall

  move $a0 $t3

  bleu $t1, $t0, loop             #If it is not still the number go back

  jr $ra
