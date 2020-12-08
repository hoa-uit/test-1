.data 
	str1: .asciiz "Nhap so luong phan tu: "
	str2: .asciiz "\nMin: "
	str3: .asciiz ","
	str4: .asciiz "\nMax: "
	str5: .asciiz "\nSum: "
	str6: .asciiz "\nNhap vi tri: "
	str7: .asciiz"\nSo can tim: "
	arr: .word 100
.text 
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	addi $t1,$0,0
	la $a1,arr
loop1:	beq $t1,$t0,exit1
	
	li $v0,5
	syscall
	move $t7,$v0
	
#	sll $t2,$t1,2
	addi $t2,$a1,0
	
	sw $t7,($t2)
	
	addi $t1,$t1,1
	addi $a1,$a1,4
	j loop1
exit1:	# xuat mang
	addi $t1,$0,0
	la $a1,arr
loop2:  beq $t1,$t0,exit2
	
	lw $t2,($a1)
	li $v0,1
	addi $a0,$t2,0
	syscall
	
	li $v0,4
	la $a0,str3
	syscall
	
	addi $a1,$a1,4
	addi $t1,$t1,1
	j loop2
exit2:   # tim min
	la $a1,arr
	addi $t1,$0,0
	lw $t7,($a1)     # min  =  $t7
	addi $t6,$0,1
loop3:	beq $t1,$t0,exit3 
	addi $t2,$a1,0
	lw $t3,($t2)
	slt $t4,$t7,$t3		# 
	beq $t4,$t6,j1		# $t4 = 1 
	addi $t7,$t3,0
j1:	
	addi $t1,$t1,1
	addi $a1,$a1,4
	j loop3		
exit3:		# xuat min
	li $v0,4
	la $a0,str2
	syscall
	
	li $v0,1
	addi $a0,$t7,0
	syscall
	
	# tim max
	la $a1,arr
	addi $t1,$0,0
	lw $t7,($a1)     # max  =  $t7
	addi $t6,$0,1
loop4:	beq $t1,$t0,exit4 
	addi $t2,$a1,0
	lw $t3,($t2)
	slt $t4,$t3,$t7		# 
	beq $t4,$t6,j2		# $t4 = 1 
	addi $t7,$t3,0
j2:	
	addi $t1,$t1,1
	addi $a1,$a1,4
	j loop4		
exit4:		# xuat max
	li $v0,4
	la $a0,str4
	syscall
	
	li $v0,1
	addi $a0,$t7,0
	syscall
	
#   ý 2  T?ng t?t c? các ph?n t? c?a m?ng

	la $a1,arr
	addi $t1,$0,0
	addi $t2,$0,0  	# sum = 0
loop5:	beq $t1,$t0,exit5
	
	addi $t3,$a1,0
	lw $t4,($t3)
	add $t2,$t2,$t4
	
	addi $t1,$t1,1
	addi $a1,$a1,4
	
	j loop5
exit5:		
	li $v0,4
	la $a0,str5
	syscall
	
	li $v0,1
	addi $a0,$t2,0
	syscall
# ý 3: 
	la $a1,arr
	li $v0,4
	la $a0,str6
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	# tim vi tri
	
	sll $t2,$t1,2
	addi $t3,$a1,0
	lw $t4,($t3)
	
	li $v0,4
	la $a0,str7
	syscall
	
	li $v0,1
	addi $a0,$t4,0
	syscall
	

	
	
	
	
	
	
	
	
	
