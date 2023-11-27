	.file	"sm3.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	H
	.data
	.align	2
	.type	H, @object
	.size	H, 32
H:
	.word	1937774191
	.word	1226093241
	.word	388252375
	.word	-628488704
	.word	-1452330820
	.word	372324522
	.word	-477237683
	.word	-1325724082
	.section	.rodata
	.align	2
.LC0:
	.string	"hash: "
	.align	2
.LC1:
	.string	"%02X"
	.text
	.align	1
	.globl	print_str
	.type	print_str, @function
print_str:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L3
	li	a0,10
	call	putchar
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_str, .-print_str
	.align	1
	.globl	sm3_long_to_str
	.type	sm3_long_to_str, @function
sm3_long_to_str:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	addi	a5,s0,-24
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	lbu	a4,3(a5)
	lw	a5,-40(s0)
	sb	a4,0(a5)
	lw	a5,-40(s0)
	addi	a5,a5,1
	lw	a4,-20(s0)
	lbu	a4,2(a4)
	sb	a4,0(a5)
	lw	a5,-40(s0)
	addi	a5,a5,2
	lw	a4,-20(s0)
	lbu	a4,1(a4)
	sb	a4,0(a5)
	lw	a5,-40(s0)
	addi	a5,a5,3
	lw	a4,-20(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
	li	a5,0
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	sm3_long_to_str, .-sm3_long_to_str
	.align	1
	.globl	sm3_str_to_long
	.type	sm3_str_to_long, @function
sm3_str_to_long:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-24(s0)
	addi	a5,s0,-24
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	lbu	a4,3(a5)
	lw	a5,-20(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-36(s0)
	lbu	a4,2(a4)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,2
	lw	a4,-36(s0)
	lbu	a4,1(a4)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,3
	lw	a4,-36(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	sm3_str_to_long, .-sm3_str_to_long
	.align	1
	.globl	sm3_pad_message
	.type	sm3_pad_message, @function
sm3_pad_message:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a4,-40(s0)
	srai	a5,a4,31
	srli	a5,a5,26
	add	a4,a4,a5
	andi	a4,a4,63
	sub	a5,a4,a5
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	lw	a5,-40(s0)
	slli	a5,a5,3
	sw	a5,-28(s0)
	lw	a4,-20(s0)
	li	a5,55
	bgt	a4,a5,.L10
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	li	a4,-128
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	.L11
.L12:
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	sb	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L11:
	lw	a4,-20(s0)
	li	a5,55
	ble	a4,a5,.L12
	j	.L13
.L10:
	lw	a4,-20(s0)
	li	a5,56
	ble	a4,a5,.L13
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	li	a4,-128
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	.L14
.L15:
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	sb	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L14:
	lw	a4,-20(s0)
	li	a5,119
	ble	a4,a5,.L15
.L13:				#reverse  part
#	lw	a5,-24(s0) use a0 to save the constant -24(s0)
	lw  a0,-24(s0)
#	srli	a3,a5,24
#	srli	a3,a0,24
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5		#a4 = a5  a5 = a5 + 1
	lw	a5,-36(s0)
	add	a5,a5,a4
#	andi	a4,a3,0xff
	.insn r 0x33,3,2,a4,a0,zero
	sb	a4,0(a5)
#	lw	a5,-24(s0)
	srli	a3,a0,16
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	andi	a4,a3,0xff
	sb	a4,0(a5)
#	lw	a5,-24(s0)
	srli	a3,a0,8
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	andi	a4,a3,0xff
	sb	a4,0(a5)
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
#	lw	a4,-24(s0)
	andi	a4,a0,0xff
	sb	a4,0(a5)
#	lw	a5,-28(s0) 
	lw  a1,-28(s0) 
#	srli	a3,a1,24
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
#	andi	a4,a3,0xff
	.insn r 0x33,3,2,a4,a0,zero
	sb	a4,0(a5)
#	lw	a5,-28(s0)
	srli	a3,a1,16
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	andi	a4,a3,0xff
	sb	a4,0(a5)
#	lw	a5,-28(s0)
	srli	a3,a1,8
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	andi	a4,a3,0xff
	sb	a4,0(a5)
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
#	lw	a4,-28(s0)
	andi	a4,a1,0xff
	sb	a4,0(a5)
	lw	a5,-40(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	sm3_pad_message, .-sm3_pad_message
	.align	1
	.globl	sm3_group_a
	.type	sm3_group_a, @function
sm3_group_a:
	addi	sp,sp,-80
	sw	ra,76(sp)
	sw	s0,72(sp)
	addi	s0,sp,80
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	sw	a4,-68(s0)
	sw	a5,-72(s0)
	sw	zero,-40(s0)
	sw	zero,-36(s0)
	sw	zero,-32(s0)
	sw	zero,-28(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	lw	a0,-52(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-40(s0)
	lw	a0,-56(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a0,-60(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-32(s0)
	lw	a0,-64(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-28(s0)
	lw	a0,-68(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-24(s0)
	lw	a4,-40(s0)
	lw	a5,-36(s0)
	xor	a4,a4,a5
	lw	a5,-32(s0)

#	slli	a3,a5,15
#	srli	a5,a5,17
#	or	a5,a5,a3

	li a6,15
	.insn r 0x33,1,2, a3,a5,a6

	xor	a4,a4,a5
	lw	a3,-40(s0)
	lw	a5,-36(s0)
	xor	a3,a3,a5
	lw	a5,-32(s0)

#	slli	a2,a5,15
#	srli	a5,a5,17
#	or	a5,a5,a2

	.insn r 0x33,1,2, a5,a5,a6
	xor	a5,a3,a5

#	slli	a3,a5,15
#	srli	a5,a5,17
#	or	a5,a5,a3

	.insn r 0x33,1,2, a5,a5,a6

	xor	a4,a4,a5
	lw	a3,-40(s0)
	lw	a5,-36(s0)
	xor	a3,a3,a5
	lw	a5,-32(s0)
#	slli	a2,a5,15
#	srli	a5,a5,17
#	or	a5,a5,a2

	.insn r 0x33,1,2, a5,a5,a6

	xor	a5,a3,a5

#	srli	a3,a5,9
#	slli	a5,a5,23
#	or	a5,a5,a3

	li a7,9
	.insn r 0x33,2,2, a5,a5,a7

	xor	a4,a4,a5
	lw	a5,-28(s0)

#	slli	a3,a5,7
#	srli	a5,a5,25
#	or	a5,a5,a3

	li a7,7
	.insn r 0x33,2,2, a5,a5,a7

	xor	a4,a4,a5
	lw	a5,-24(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	lw	a1,-72(s0)
	mv	a0,a5
	call	sm3_long_to_str
	li	a5,0
	mv	a0,a5
	lw	ra,76(sp)
	lw	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	sm3_group_a, .-sm3_group_a
	.align	1
	.globl	sm3_group_b
	.type	sm3_group_b, @function
sm3_group_b:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-28(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	lw	a0,-36(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-28(s0)
	lw	a0,-40(s0)
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-24(s0)
	lw	a4,-28(s0)
	lw	a5,-24(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	lw	a1,-44(s0)
	mv	a0,a5
	call	sm3_long_to_str
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	sm3_group_b, .-sm3_group_b
	.align	1
	.globl	sm3_str_group
	.type	sm3_str_group, @function
sm3_str_group:
	addi	sp,sp,-384
	sw	ra,380(sp)
	sw	s0,376(sp)
	addi	s0,sp,384
	sw	a0,-372(s0)
	sw	a1,-376(s0)
	lw	a5,-376(s0)
	srai	a4,a5,31
	andi	a4,a4,63
	add	a5,a4,a5
	srai	a5,a5,6
	sw	a5,-28(s0)
	li	a5,512
	sw	a5,-32(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	j	.L22
.L29:
	addi	a5,s0,-96
	li	a2,64
	li	a1,0
	mv	a0,a5
	call	memset
	lw	a5,-20(s0)
	slli	a5,a5,6
	mv	a4,a5
	lw	a5,-372(s0)
	add	a4,a5,a4
	addi	a5,s0,-96
	mv	a3,a4
	li	a4,64
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	sw	zero,-24(s0)
	j	.L23
.L24:
	addi	a4,s0,-368
	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a4,a4,a5

	.insn r 0x33, 5,2,a4,a4,a5

#	lw	a5,-24(s0)
#	slli	a5,a5,2
#	mv	a3,a5
#	addi	a5,s0,-96
#	add	a5,a5,a3

	addi a3,s0,-96
	.insn r 0x33, 5,2,a5,a3,a5

	li	a2,4
	mv	a1,a5
	mv	a0,a4
	call	memcpy
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L23:
	lw	a4,-24(s0)
	li	a5,15
	ble	a4,a5,.L24
	li	a5,16
	sw	a5,-24(s0)
	j	.L25
.L26:
	lw	a5,-24(s0)
	addi	a5,a5,-16
	addi	a4,s0,-368
#	slli	a5,a5,2
#	add	a0,a4,a5

	.insn r 0x33, 5,2,a0,a4,a5

	lw	a5,-24(s0)
	addi	a5,a5,-9
#	addi	a4,s0,-368	#a4和之前没变化
#	slli	a5,a5,2
#	add	a1,a4,a5

	.insn r 0x33, 5,2,a1,a4,a5

	lw	a5,-24(s0)
	addi	a5,a5,-3
#	addi	a4,s0,-368  #a4和之前没变化
#	slli	a5,a5,2
#	add	a2,a4,a5

	.insn r 0x33, 5,2,a2,a4,a5

	lw	a5,-24(s0)
	addi	a5,a5,-13
#	addi	a4,s0,-368	#a4和之前没变化
#	slli	a5,a5,2
#	add	a3,a4,a5

	.insn r 0x33, 5,2,a3,a4,a5

	lw	a5,-24(s0)
	addi	a5,a5,-6
#	addi	a4,s0,-368	#a4和之前没变化
#	slli	a5,a5,2
#	add	a6,a4,a5

	.insn r 0x33, 5,2,a6,a4,a5

#	addi	a4,s0,-368	#a4和之前没变化
	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	mv	a4,a6
	call	sm3_group_a
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L25:
	lw	a4,-24(s0)
	li	a5,67
	ble	a4,a5,.L26
	addi	a5,s0,-96
	li	a2,64
	li	a1,0
	mv	a0,a5
	call	memset
	sw	zero,-24(s0)
	j	.L27
.L28:
	addi	a4,s0,-368
	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a3,a4,a5

	.insn r 0x33, 5,2,a3,a4,a5

#	lw	a5,-24(s0)
	addi	a5,a5,4
#	addi	a4,s0,-368
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	addi	a4,s0,-96
	mv	a2,a4
	mv	a1,a5
	mv	a0,a3
	call	sm3_group_b
	lw	a4,-20(s0)
	lw	a5,-32(s0)
	mul	a5,a4,a5
	mv	a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	lw	a4,-372(s0)
	add	a3,a4,a5
	addi	a4,s0,-368
	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	li	a2,4
	mv	a1,a5
	mv	a0,a3
	call	memcpy
	lw	a4,-20(s0)
	lw	a5,-32(s0)
	mul	a5,a4,a5
	mv	a4,a5
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	addi	a5,a5,4
	lw	a4,-372(s0)
	add	a5,a4,a5
	addi	a4,s0,-96
	li	a2,4
	mv	a1,a4
	mv	a0,a5
	call	memcpy
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L27:
	lw	a4,-24(s0)
	li	a5,63
	ble	a4,a5,.L28
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L22:
	lw	a5,-20(s0)
	bge	a5,zero,.L29
	lw	a4,-28(s0)
	lw	a5,-32(s0)
	mul	a5,a4,a5
	mv	a0,a5
	lw	ra,380(sp)
	lw	s0,376(sp)
	addi	sp,sp,384
	jr	ra
	.size	sm3_str_group, .-sm3_str_group
	.align	1
	.globl	sm3_str_summ
	.type	sm3_str_summ, @function
sm3_str_summ:
	addi	sp,sp,-656
	sw	ra,652(sp)
	sw	s0,648(sp)
	addi	s0,sp,656
	sw	a0,-644(s0)
	sw	a1,-648(s0)
	sw	a2,-652(s0)
	sw	zero,-572(s0)
	sw	zero,-568(s0)
	sw	zero,-564(s0)
	sw	zero,-560(s0)
	sw	zero,-556(s0)
	sw	zero,-552(s0)
	sw	zero,-548(s0)
	sw	zero,-544(s0)
	sw	zero,-604(s0)
	sw	zero,-600(s0)
	sw	zero,-596(s0)
	sw	zero,-592(s0)
	sw	zero,-588(s0)
	sw	zero,-584(s0)
	sw	zero,-580(s0)
	sw	zero,-576(s0)
	sw	zero,-636(s0)
	sw	zero,-632(s0)
	sw	zero,-628(s0)
	sw	zero,-624(s0)
	sw	zero,-620(s0)
	sw	zero,-616(s0)
	sw	zero,-612(s0)
	sw	zero,-608(s0)
	lw	a5,-652(s0)
	srai	a4,a5,31
	andi	a4,a4,511
	add	a5,a4,a5
	srai	a5,a5,9
	sw	a5,-28(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	lui	a5,%hi(H)
	addi	a5,a5,%lo(H)
	lw	a7,0(a5)
	lw	a6,4(a5)
	lw	a0,8(a5)
	lw	a1,12(a5)
	lw	a2,16(a5)
	lw	a3,20(a5)
	lw	a4,24(a5)
	lw	a5,28(a5)
	sw	a7,-604(s0)
	sw	a6,-600(s0)
	sw	a0,-596(s0)
	sw	a1,-592(s0)
	sw	a2,-588(s0)
	sw	a3,-584(s0)
	sw	a4,-580(s0)
	sw	a5,-576(s0)
	sw	zero,-20(s0)
	j	.L32
.L39:
	sw	zero,-24(s0)
	j	.L33
.L34:
	addi	a4,s0,-540
	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a3,a4,a5

	.insn r 0x33, 5,2,a3,a4,a5

	lw	a6,-20(s0)
	slli	a6,a6,9
#	mv	a4,a6
#	lw	a5,-24(s0)
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a6,a5

	lw	a4,-644(s0)
	add	a5,a4,a5
	li	a2,4
	mv	a1,a5
	mv	a0,a3
	call	memcpy
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L33:
	lw	a4,-24(s0)
	li	a5,127
	ble	a4,a5,.L34
	lw	a5,-604(s0)
	sw	a5,-572(s0)
	lw	a5,-600(s0)
	sw	a5,-568(s0)
	lw	a5,-596(s0)
	sw	a5,-564(s0)
	lw	a5,-592(s0)
	sw	a5,-560(s0)
	lw	a5,-588(s0)
	sw	a5,-556(s0)
	lw	a5,-584(s0)
	sw	a5,-552(s0)
	lw	a5,-580(s0)
	sw	a5,-548(s0)
	lw	a5,-576(s0)
	sw	a5,-544(s0)
	sw	zero,-24(s0)
	j	.L35
.L36:
	lw	a5,-24(s0)
#	slli	a5,a5,1
#	addi	a5,a5,1

	.insn r 0x33, 6,2,a5,a5,a5

	addi	a4,s0,-540
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	mv	a0,a5
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-636(s0)
	lw	a5,-24(s0)
	slli	a5,a5,1
	addi	a4,s0,-540
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	mv	a0,a5
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-632(s0)
	lw	a4,-572(s0)
	lw	a5,-568(s0)
	xor	a4,a4,a5
	lw	a5,-564(s0)
	xor	a4,a4,a5
	lw	a5,-560(s0)
	add	a3,a4,a5
	lw	a5,-572(s0)

#	slli	a4,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a4

	li a6,12
	.insn r 0x33,1,2, a5,a5,a6;

	lw	a4,-556(s0)
	add	a5,a5,a4
	lw	a4,-24(s0)
#	li	a2,2043428864
	li	a0,2043428864
	addi	a2,a0,1305
	sll	a2,a2,a4
	li	a1,32
#	lw	a4,-24(s0)
	sub	a4,a1,a4
#	li	a1,2043428864
	addi	a1,a0,1305
	sra	a4,a1,a4
	or	a4,a2,a4
	add	a5,a5,a4

#	slli	a2,a5,7
#	srli	a4,a5,25
#	or	a4,a4,a2

	li a6,7
	.insn r 0x33,1,2, a4,a5,a6

	lw	a5,-572(s0)

#	slli	a2,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a2

	li a6,12
	.insn r 0x33,1,2, a5,a5,a6

	xor	a5,a4,a5
	add	a4,a3,a5
	lw	a5,-636(s0)
	add	a5,a4,a5
	sw	a5,-628(s0)
	lw	a4,-556(s0)
	lw	a5,-552(s0)
	xor	a4,a4,a5
	lw	a5,-548(s0)
	xor	a4,a4,a5
	lw	a5,-544(s0)
	add	a4,a4,a5
	lw	a5,-572(s0)

#	slli	a3,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a3

	.insn r 0x33,1,2, a5,a5,a6

	lw	a3,-556(s0)
	add	a5,a5,a3
	lw	a3,-24(s0)
#	li	a2,2043428864  #a0:2043428864
	addi	a2,a0,1305
	sll	a2,a2,a3
	li	a1,32
#	lw	a3,-24(s0)
	sub	a3,a1,a3
#	li	a1,2043428864
	addi	a1,a0,1305
	sra	a3,a1,a3
	or	a3,a2,a3
	add	a5,a5,a3

#	slli	a3,a5,7
#	srli	a5,a5,25
#	or	a5,a5,a3

	li a6,7
	.insn r 0x33,1,2, a5,a5,a6

	add	a4,a4,a5
	lw	a5,-632(s0)
	add	a5,a4,a5
	sw	a5,-624(s0)
	lw	a5,-548(s0)
	sw	a5,-544(s0)
	lw	a5,-552(s0)

#	srli	a4,a5,13
#	slli	a5,a5,19
#	or	a5,a5,a4

	li a6,13
	.insn r 0x33,2,2, a5,a5,a6

	sw	a5,-548(s0)
	lw	a5,-556(s0)
	sw	a5,-552(s0)
	lw	a4,-624(s0)
	lw	a5,-624(s0)

#	slli	a3,a5,9
#	srli	a5,a5,23
#	or	a5,a5,a3

	li a6,9
	.insn r 0x33,1,2, a5,a5,a6

	xor	a4,a4,a5
	lw	a5,-624(s0)

#	srli	a3,a5,15
#	slli	a5,a5,17
#	or	a5,a5,a3

	li a6,15
	.insn r 0x33,2,2, a5,a5,a6

	xor	a5,a4,a5
	sw	a5,-556(s0)
	lw	a5,-564(s0)
	sw	a5,-560(s0)
	lw	a5,-568(s0)

#	slli	a4,a5,9
#	srli	a5,a5,23
#	or	a5,a5,a4

	li a6,9
	.insn r 0x33,1,2, a5,a5,a6

	sw	a5,-564(s0)
	lw	a5,-572(s0)
	sw	a5,-568(s0)
	lw	a5,-628(s0)
	sw	a5,-572(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L35:
	lw	a4,-24(s0)
	li	a5,15
	ble	a4,a5,.L36
	li	a5,16
	sw	a5,-24(s0)
	j	.L37
.L38:
	lw	a5,-24(s0)
#	slli	a5,a5,1
#	addi	a5,a5,1

	.insn r 0x33, 6,2,a5,a5,a5

	addi	a4,s0,-540
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	mv	a0,a5
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-636(s0)
	lw	a5,-24(s0)
	slli	a5,a5,1
	addi	a4,s0,-540
#	slli	a5,a5,2
#	add	a5,a4,a5

	.insn r 0x33, 5,2,a5,a4,a5

	mv	a0,a5
	call	sm3_str_to_long
	mv	a5,a0
	sw	a5,-632(s0)
	lw	a4,-572(s0)
	lw	a3,-568(s0)
	lw	a5,-564(s0)
	or	a5,a3,a5
	and	a4,a4,a5
	lw	a3,-568(s0)
	lw	a5,-564(s0)
	and	a5,a3,a5
	or	a4,a4,a5
	lw	a5,-560(s0)
	add	a3,a4,a5
	lw	a5,-572(s0)

#	slli	a4,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a4

	li a6,12
	.insn r 0x33,1,2, a5,a5,a6

	lw	a4,-556(s0)
	add	a5,a5,a4
	lw	a4,-24(s0)
	li	a2,2055708672
	addi	a2,a2,-630
	sll	a2,a2,a4
	li	a1,32
	lw	a4,-24(s0)
	sub	a4,a1,a4
	li	a1,2055708672
	addi	a1,a1,-630
	sra	a4,a1,a4
	or	a4,a2,a4
	add	a5,a5,a4

#	slli	a2,a5,7
#	srli	a4,a5,25
#	or	a4,a4,a2

	li a6,7
	.insn r 0x33,1,2, a4,a5,a6

	lw	a5,-572(s0)

#	slli	a2,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a2

	li a6, 12
	.insn r 0x33,1,2, a5,a5,a6

	xor	a5,a4,a5
	add	a4,a3,a5
	lw	a5,-636(s0)
	add	a5,a4,a5
	sw	a5,-628(s0)
	lw	a4,-556(s0)
	lw	a5,-552(s0)
	and	a4,a4,a5
	lw	a5,-556(s0)
	lw	a7,-548(s0)

#	not	a3,a5
#	lw	a5,-548(s0)
#	and	a5,a3,a5

	.insn r 0x33,4,2, a5,a5,a7

	or	a4,a4,a5
	lw	a5,-544(s0)
	add	a4,a4,a5
	lw	a5,-572(s0)

#	slli	a3,a5,12
#	srli	a5,a5,20
#	or	a5,a5,a3

	
	.insn r 0x33,1,2, a5,a5,a6

	lw	a3,-556(s0)
	add	a5,a5,a3
	lw	a3,-24(s0)
	li	a2,2055708672
	addi	a2,a2,-630
	sll	a2,a2,a3
	li	a1,32
	lw	a3,-24(s0)
	sub	a3,a1,a3
	li	a1,2055708672
	addi	a1,a1,-630
	sra	a3,a1,a3
	or	a3,a2,a3
	add	a5,a5,a3

#	slli	a3,a5,7
#	srli	a5,a5,25
#	or	a5,a5,a3

	li a6,7
	.insn r 0x33,1,2, a5,a5,a6

	add	a4,a4,a5
	lw	a5,-632(s0)
	add	a5,a4,a5
	sw	a5,-624(s0)
	lw	a5,-548(s0)
	sw	a5,-544(s0)
	lw	a5,-552(s0)

#	srli	a4,a5,13
#	slli	a5,a5,19
#	or	a5,a5,a4

	li a6,13
	.insn r 0x33,2,2, a5,a5,a6

	sw	a5,-548(s0)
	lw	a5,-556(s0)
	sw	a5,-552(s0)
	lw	a4,-624(s0)
	lw	a5,-624(s0)

#	slli	a3,a5,9
#	srli	a5,a5,23
#	or	a5,a5,a3

	li a6,9
	.insn r 0x33,1,2, a5,a5,a6

	xor	a4,a4,a5
	lw	a5,-624(s0)

#	srli	a3,a5,15
#	slli	a5,a5,17
#	or	a5,a5,a3

	li a6,15
	.insn r 0x33,2,2, a5,a5,a6

	xor	a5,a4,a5
	sw	a5,-556(s0)
	lw	a5,-564(s0)
	sw	a5,-560(s0)
	lw	a5,-568(s0)

#	slli	a4,a5,9
#	srli	a5,a5,23
#	or	a5,a5,a4

	li a6,9
	.insn r 0x33,1,2, a5,a5,a6

	sw	a5,-564(s0)
	lw	a5,-572(s0)
	sw	a5,-568(s0)
	lw	a5,-628(s0)
	sw	a5,-572(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L37:
	lw	a4,-24(s0)
	li	a5,63
	ble	a4,a5,.L38
	lw	a4,-604(s0)
	lw	a5,-572(s0)
	xor	a5,a4,a5
	sw	a5,-604(s0)
	lw	a4,-600(s0)
	lw	a5,-568(s0)
	xor	a5,a4,a5
	sw	a5,-600(s0)
	lw	a4,-596(s0)
	lw	a5,-564(s0)
	xor	a5,a4,a5
	sw	a5,-596(s0)
	lw	a4,-592(s0)
	lw	a5,-560(s0)
	xor	a5,a4,a5
	sw	a5,-592(s0)
	lw	a4,-588(s0)
	lw	a5,-556(s0)
	xor	a5,a4,a5
	sw	a5,-588(s0)
	lw	a4,-584(s0)
	lw	a5,-552(s0)
	xor	a5,a4,a5
	sw	a5,-584(s0)
	lw	a4,-580(s0)
	lw	a5,-548(s0)
	xor	a5,a4,a5
	sw	a5,-580(s0)
	lw	a4,-576(s0)
	lw	a5,-544(s0)
	xor	a5,a4,a5
	sw	a5,-576(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L32:
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	blt	a4,a5,.L39
	lw	a5,-604(s0)
	lw	a1,-648(s0)
	mv	a0,a5
	call	sm3_long_to_str
	lw	a4,-600(s0)
	lw	a5,-648(s0)
	addi	a5,a5,4
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-596(s0)
	lw	a5,-648(s0)
	addi	a5,a5,8
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-592(s0)
	lw	a5,-648(s0)
	addi	a5,a5,12
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-588(s0)
	lw	a5,-648(s0)
	addi	a5,a5,16
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-584(s0)
	lw	a5,-648(s0)
	addi	a5,a5,20
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-580(s0)
	lw	a5,-648(s0)
	addi	a5,a5,24
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	lw	a4,-576(s0)
	lw	a5,-648(s0)
	addi	a5,a5,28
	mv	a1,a5
	mv	a0,a4
	call	sm3_long_to_str
	li	a5,0
	mv	a0,a5
	lw	ra,652(sp)
	lw	s0,648(sp)
	addi	sp,sp,656
	jr	ra
	.size	sm3_str_summ, .-sm3_str_summ
	.section	.rodata
	.align	2
.LC2:
	.string	"Please input string: "
	.align	2
.LC3:
	.string	"%s"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	li	t0,-4096
	add	sp,sp,t0
	li	a5,-4096
	addi	a4,s0,-16
	add	a5,a4,a5
	sw	zero,-8(a5)
	addi	a4,a5,-4
	li	a5,4096
	addi	a5,a5,-4
	mv	a2,a5
	li	a1,0
	mv	a0,a4
	call	memset
	li	a5,5
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	li	a5,-4096
	addi	a5,a5,-8
	addi	a4,s0,-16
	add	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	scanf
	li	a5,-4096
	addi	a5,a5,-8
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a1,-20(s0)
	mv	a0,a5
	call	sm3_pad_message
	sw	a0,-20(s0)
	li	a5,-4096
	addi	a5,a5,-8
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a1,-20(s0)
	mv	a0,a5
	call	sm3_str_group
	sw	a0,-20(s0)
	li	a5,-4096
	addi	a5,a5,-40
	addi	a4,s0,-16
	add	a4,a4,a5
	li	a5,-4096
	addi	a5,a5,-8
	addi	a3,s0,-16
	add	a5,a3,a5
	lw	a2,-20(s0)
	mv	a1,a4
	mv	a0,a5
	call	sm3_str_summ
	li	a5,-4096
	addi	a5,a5,-40
	addi	a4,s0,-16
	add	a5,a4,a5
	li	a1,32
	mv	a0,a5
	call	print_str
	li	a5,0
	mv	a0,a5
	li	t0,4096
	add	sp,sp,t0
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
