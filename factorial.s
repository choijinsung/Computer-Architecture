	
	.data

msg:
	.asciiz "The factorial is "


	.text

main:
	addi 	$sp, $sp, -12
	sw 	$ra, 8($sp)
	sw	$v0, 4($sp)
	sw	$a0, 0($sp)
	
	li	$a0, 3
	jal	fact

	addi	$sp, $sp, -4
	sw	$v0, 0($sp)

	la	$a0, msg
	li	$v0, 4	
	syscall

	lw 	$a0, 0($sp)
	addi	$sp, $sp, 4
	li	$v0, 1
	syscall

	lw	$ra, 8($sp)
	lw	$v0, 4($sp)
	lw	$a0, 0($sp)
	addi	$sp, $sp, 12
	
	jr	$ra


fact:
	addi	$sp, $sp, -8
	sw	$ra, 4($sp)
	sw	$a0, 0($sp)

	slti	$t0, $a0, 1
	beq	$t0, $zero, L1

	addi	$v0, $zero, 1
	addi	$sp, $sp, 8

	jr	$ra


L1:
	addi	$a0, $a0, -1
	jal	fact

	lw	$a0, 0($sp)
	lw	$ra, 4($sp)
	addi	$sp, $sp, 8
	mul	$v0, $a0, $v0
	jr	$ra	