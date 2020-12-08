.data
	
	A: .word 100
	str1: .asciiz"Nhap so phan tu mang A: "
	str2: .asciiz"Nhap so phan tu mang B: "
	B: .word 100
	
.text	# nhap mang A
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,5
	syscall 
	move $t0,$v0
	
	la $s1,A
	addi $t2,$0,0
	addi $t4,$t0,0
	addi $s3,$s1,0
	jal nhap
	
	# nhap mang B
	li $v0,4
	la $a0,str2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	la $s2,B
	addi $t2,$0,0
	addi $t4,$t1,0
	addi $s3,$s2,0
	jal nhap
	j exit2
	
nhap:	
loop1:  beq $t2,$t4,exit1
	li $v0,5
	syscall
	move $t3,$v0
	sw $t3,($s3)
	addi $s3,$s3,4
	addi $t2,$t2,1
	j loop1
exit1:
	jr $ra

exit2:	
	li $s0,2
	li $t7,10                # $s0  =  i = 2
loop2:	beq $s0,$t7,exit3 	 # 
	addi $t2,$s0,-2		 # t2 = i-2
	sll $t3,$t2,2		 # t3 = t2*4
	add $t3,$t3,$s1	 	 # $t3 = $ A[i-2]
	lw $t4,($t3)		 # $t4 = A[i-2]
	sll $t5,$t4,2		 # $t5 = 4*A[i-2]
	add $t5,$t5,$s2		 # $t5  = &B[A[i-2]]	
	lw $t6,($t5)		 # t6 = B[A[i-2]]
	addi $t2,$s0,0		 # t2 = i
	sll $t3,$t2,2		 # $t3 = i*4
	add $t4,$t3,$s1		 # $t4 = &A[i]
	sw $t6,($t4)		 # A[i] = B[A[i-2]]
	
	addi $s0,$s0,1		 # i += 1
	j loop2	
exit3:	
	
	
	
	
	
	
	
	
	
