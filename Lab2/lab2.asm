############################################################################
# 
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello Anirudh! \n"  # declare a zero terminated string
AnInt:	.word	17      # a word initialized to 17
Zero:   .word   0
Storage: .word  0
space:	.asciiz	" "	    # declare a zero terminate string
AnotherInt: .word 23	# another word, this time initialized to 23
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4       # pad to next 16 byte boundary (address % 16 == 0)
Input1_TAG: .ascii "Input1 starts on next line"
		.align	4
Input1:	.word	0x01020304,0x05060708
	    .word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2_TAG: .ascii "Input2 starts on next line"
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy_TAG: .ascii "Copy starts on next line"
        .align  4
Copy:  	.space  128		# space to copy input word by word
        .align  4
Input3_TAG: .ascii "Input3 starts on next line"
        .align  4
Input3:	.space	400		# space for data to be transposed
Transpose_TAG: .ascii "Transpose starts on next line"
        .align  4
Transpose: .space 400	# space for transposed data
 
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting.  
# Task 2:  change the message so that it prints out your name.
main:
        la	$a0,Hello		# address of string to print
        li	$v0,4			# system call code for print_str
        syscall				# print the string
#
# Print the integer value of AnInt
# Task 3: modify the code so that it prints out two integers
# separated by a space.
		lw	$a0,AnInt		# load I/O register with value of AnInt
		li	$v0,1			# system call code for print_int
		syscall				# print the integer
		la  $a0,space       # address of space to print
		li  $v0, 4          # system call code for print_str
		syscall             # print the space
		lw  $a0,AnotherInt  # load I/O register with value of AnotherInt
		li  $v0,1           # system call code for print_int
		syscall             # print the integer
#
# Print the integer values of each byte in the array Input1
# Task 4a: modify the code so that it prints spaces between the integers
		la	$s0,Input1		# load pointer to array Input1
		lw	$s1,InLenB		# get length of array Input1 in bytes
task4:	
		ble	$s1,$zero,done4	# test if done
		lb	$a0,($s0)		# load next byte into I/O register
		li	$v0,1			# specify print integer
		syscall				# print the integer
		la  $a0,space       # address of space to print
		li  $v0, 4          # system call code for print_str
		syscall
		add	$s0,$s0,1		# point to next byte
		sub	$s1,$s1,1		# decrement index variable
		j	task4			# do it again
done4:
#
# Task 4b: copy the Task 4 code and paste here.  Modify the code to print
# the array backwards.

Task4b:

		la	$s0,Input1		# load pointer to array Input1
		lw	$s1,InLenB		# get length of array Input1 in bytes
		add $s0,$s0,15
task4b:	
		ble	$s1,$zero,done4b	# test if done
		lb	$a0,($s0)		# load next byte into I/O register
		li	$v0,1			# specify print integer
		syscall				# print the integer
		la  $a0,space       # address of space to print
		li  $v0, 4          # system call code for print_str
		syscall             # print
		sub	$s0,$s0,1		# point to next byte
		sub	$s1,$s1,1		# decrement index variable
		j	task4b			# do it again

done4b:
#
# Code for Task 5 -- copy the contents of Input2 to Copy
		la	$s0,Input2		# load pointer to array Input2
		la	$s1,Copy		# load pointer to array Copy
		lw	$s2,InLenB		# get length of array Input1 in bytes

task5:
		ble	$s2,$zero,done5	# test if done
		lb	$t0,($s0)		# get the next byte
		sb	$t0,($s1)		# put the byte
		add	$s0,$s0,1		# increment input pointer
		add	$s1,$s1,1		# increment output point
		sub	$s2,$s2,1		# decrement index variable
		j	task5			# continue
done5:
#
# Task 5:  copy the Task 5 code and paste here.  Modify the code to copy
# the data in words rather than bytes.

		la	$s0,Input2		# load pointer to array Input2
		la	$s1,Copy		# load pointer to array Copy
		lw	$s2,InLenW		# get length of array Input1 in words
task5b:
		ble	$s2,$zero,done5b	# test if done
		lw	$t0,($s0)		# get the next word
		sw	$t0,($s1)		# put the word
		add	$s0,$s0,4		# increment input pointer
		add	$s1,$s1,4		# increment output point
		sub	$s2,$s2,1		# decrement index variable
		j	task5b			# continue
done5b:

#
# Code for Task 6 -- 
# Print the integer average of the contents of array Input2 (bytes)
		
	 	la	$s0,Input2     #load address of input to into s0
	 	lw  $s2, InLenB    #load length into s2
	 	lw $s1, Zero       #load zero into s1
task6:
		ble	$s2,$zero,done6   #if s2 becomes 0, then done
		lb	$t0,($s0)         #load content of s0, into t0
		add $s1,$s1,$t0       #add t0 to s1, and store in s1
		add $s0, $s0, 1       #add 1 to s0 and store in s0
		sub $s2, $s2, 1       #subtract 1 from s2, and store in s2
		j   task6             #jump to task 6
done6: 	
		lb $s2, InLenB        #store lenb into s2
		div $s1, $s1, $s2     #divide s1 by s2 and store in s1
		#sb $s1, Storage      # store s1 into Storage
		add	$a0, $s1, $zero		# load next byte into I/O register
		li	$v0,1			# specify print integer
		syscall				# print the integer

#
# Code for Task 7 --  
# Print the first 25 integers that are divisible by 7 (with spaces)
		
		li $s0, 25      #store 25 in s0
		li $s5, 7       #store 7 in s5
		li $s1, 0       #store 0 in s1
task7:  
	  	ble $s0, $zero, done7  #while s0 not equal to 0 run, else go to done7
	  	rem $s3, $s1, $s5  #divide s1, by s5 and store in s3
	  	bne $s3, $zero, Else1  #if s3 is not equal to 0 then jump to else1
	  	add  $a0,$s1,$zero  # add zero to s1, and store in I/O
	  	li  $v0, 1          # load instruction to print integer
	  	syscall             #print
	  	la  $a0,space       # address of space to print
		li  $v0, 4          # system call code for print_str
		syscall             #print
		add  $s1, $s1, 1    #add 1 to s1
	  	sub $s0, $s0, 1    # subtract 1 from s0
	  	j  task7           #jump to task7
Else1:  add  $s1, $s1, 1   #add 1 to s1
        j  task7           # jump to task7

	  	

done7:
#
# The following code initializes Input3 for Task9
		la	$s0,Input3		# load pointer to Input3
		li	$s1,100			# load size of array in bytes
		li	$t0,3			# start with 3
init9a:
		ble	$s1,$zero,done9a	# test if done
		sb	$t0,($s0)		# write out another byte
		add	$s0,$s0,1		# point to next byte
		sub	$s1,$s1,1		# decrement index variable
		add	$t0,$t0,1		# increase value by 1
		j 	init9a			# continue
done9a:
#
# Code for Task 9 --
# Transpose the 10x10 byte array in Input3 into Transpose

		la	$s0,Transpose		# load pointer to Transpose
		la  $s3, Input3         #load pointer to Input3
		li  $s4, 10             #store 10 into s4
		li  $s5, 0              # store 0 into s5
			

init9b: bge $s5, 10, done9b     #while s5 not 10
		la  $s3, Input3         #store address of input3 into s3
		add $s3, $s3, $s5       # add s5 to s3 and store to s3

section2: ble $s4, $zero, init9b  #while s4 is not 0
		lb  $t0, ($s3)            #load content of s3 into t0
		sb  $t0, ($s0)            #store content in t0 to s0
		add	$s0,$s0,1		# point to next byte
		add $s3,$s3,10      #add 10 to s3
		sub $s4, $s4, 1     #subtract 1 from s4
		beq $s4, $zero, if  #if s4 becomes 0 jump to if
		j   section2        #jump to section2
if:     add $s5, $s5, 1     #add 1 to s5
        j   init9b          #jump to init9b


done9b:

	 li $s0, 100           #store 100 into s0
	 la $s1, Transpose     #store Transpose into s1

init: ble $s0, $zero, done9c   #while s0 not 0
	  lb $a0, ($s1)            #load content of s1 into a0
	  li  $v0, 1               #load integer print instruction
	  syscall             #print
	  la  $a0,space       # address of space to print
	  li  $v0, 4          # system call code for print_str
	  syscall             #print
	  add $s1, $s1, 1     #add 1 to s1
	  sub $s0, $s0, 1     #add 1 to s0
	  j init
done9c:

# ALL DONE!
Exit:
jr $ra


