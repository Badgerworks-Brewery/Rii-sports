	.file	"miidraw.cpp"
	.machine ppc
	.section	".text"
.Ltext0:
	.file 1 "C:/devkitPro/examples/wii/Miis/rendermiiexample/source/miidraw.cpp"
	.align 2
	.type	GRRLIB_SetHandle, @function
GRRLIB_SetHandle:
.LFB83:
	.file 2 "C:/devkitPro/libogc/include/grrlib/GRRLIB_handle.h"
	.loc 2 36 70
	.cfi_startproc
	stwu 1,-32(1)
	.cfi_def_cfa_offset 32
	stw 31,28(1)
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,8(31)
	stw 4,12(31)
	stw 5,16(31)
	.loc 2 37 14
	lwz 9,8(31)
	lbz 9,24(9)
	.loc 2 37 5
	rlwinm 9,9,0,0xff
	cmpwi 0,9,0
	beq 0,.L2
	.loc 2 38 37
	lwz 9,8(31)
	lwz 9,28(9)
	.loc 2 38 24
	srawi 9,9,1
	addze 9,9
	neg 9,9
	mr 10,9
	.loc 2 38 47
	lwz 9,12(31)
	add 10,10,9
	.loc 2 38 22
	lwz 9,8(31)
	stw 10,8(9)
	.loc 2 39 37
	lwz 9,8(31)
	lwz 9,32(9)
	.loc 2 39 24
	srawi 9,9,1
	addze 9,9
	neg 9,9
	mr 10,9
	.loc 2 39 47
	lwz 9,16(31)
	add 10,10,9
	.loc 2 39 22
	lwz 9,8(31)
	stw 10,12(9)
	.loc 2 44 1
	b .L4
.L2:
	.loc 2 41 37
	lwz 9,8(31)
	lwz 9,0(9)
	.loc 2 41 24
	srawi 9,9,1
	addze 9,9
	neg 9,9
	mr 10,9
	.loc 2 41 43
	lwz 9,12(31)
	add 10,10,9
	.loc 2 41 22
	lwz 9,8(31)
	stw 10,8(9)
	.loc 2 42 37
	lwz 9,8(31)
	lwz 9,4(9)
	.loc 2 42 24
	srawi 9,9,1
	addze 9,9
	neg 9,9
	mr 10,9
	.loc 2 42 43
	lwz 9,16(31)
	add 10,10,9
	.loc 2 42 22
	lwz 9,8(31)
	stw 10,12(9)
.L4:
	.loc 2 44 1
	nop
	addi 11,31,32
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE83:
	.size	GRRLIB_SetHandle, .-GRRLIB_SetHandle
	.section	.rodata
	.align 2
	.type	_ZL18mii_heads_png_size, @object
	.size	_ZL18mii_heads_png_size, 4
_ZL18mii_heads_png_size:
	.long	29211
	.align 2
	.type	_ZL19mii_hairs1_png_size, @object
	.size	_ZL19mii_hairs1_png_size, 4
_ZL19mii_hairs1_png_size:
	.long	308977
	.align 2
	.type	_ZL19mii_hairs2_png_size, @object
	.size	_ZL19mii_hairs2_png_size, 4
_ZL19mii_hairs2_png_size:
	.long	243422
	.align 2
	.type	_ZL21mii_eyebrows_png_size, @object
	.size	_ZL21mii_eyebrows_png_size, 4
_ZL21mii_eyebrows_png_size:
	.long	42588
	.align 2
	.type	_ZL18mii_eyes1_png_size, @object
	.size	_ZL18mii_eyes1_png_size, 4
_ZL18mii_eyes1_png_size:
	.long	112779
	.align 2
	.type	_ZL18mii_eyes2_png_size, @object
	.size	_ZL18mii_eyes2_png_size, 4
_ZL18mii_eyes2_png_size:
	.long	14113
	.align 2
	.type	_ZL18mii_eyes3_png_size, @object
	.size	_ZL18mii_eyes3_png_size, 4
_ZL18mii_eyes3_png_size:
	.long	129759
	.align 2
	.type	_ZL18mii_noses_png_size, @object
	.size	_ZL18mii_noses_png_size, 4
_ZL18mii_noses_png_size:
	.long	19361
	.align 2
	.type	_ZL21mii_features_png_size, @object
	.size	_ZL21mii_features_png_size, 4
_ZL21mii_features_png_size:
	.long	93542
	.align 2
	.type	_ZL17mii_lips_png_size, @object
	.size	_ZL17mii_lips_png_size, 4
_ZL17mii_lips_png_size:
	.long	24920
	.align 2
	.type	_ZL17mii_mole_png_size, @object
	.size	_ZL17mii_mole_png_size, 4
_ZL17mii_mole_png_size:
	.long	328
	.align 2
	.type	_ZL19mii_beards_png_size, @object
	.size	_ZL19mii_beards_png_size, 4
_ZL19mii_beards_png_size:
	.long	48832
	.align 2
	.type	_ZL21mii_mustache_png_size, @object
	.size	_ZL21mii_mustache_png_size, 4
_ZL21mii_mustache_png_size:
	.long	4191
	.align 2
	.type	_ZL20mii_glasses_png_size, @object
	.size	_ZL20mii_glasses_png_size, 4
_ZL20mii_glasses_png_size:
	.long	17600
	.globl miis
	.section	".sbss","aw",@nobits
	.align 2
miis:
	.zero	4
	.size	miis, 4
	.type	miis, @object
	.lcomm	_ZL9img_heads,4,4
	.type	_ZL9img_heads, @object
	.lcomm	_ZL10img_hairs1,4,4
	.type	_ZL10img_hairs1, @object
	.lcomm	_ZL10img_hairs2,4,4
	.type	_ZL10img_hairs2, @object
	.lcomm	_ZL12img_eyebrows,4,4
	.type	_ZL12img_eyebrows, @object
	.lcomm	_ZL9img_eyes1,4,4
	.type	_ZL9img_eyes1, @object
	.lcomm	_ZL9img_eyes2,4,4
	.type	_ZL9img_eyes2, @object
	.lcomm	_ZL9img_eyes3,4,4
	.type	_ZL9img_eyes3, @object
	.lcomm	_ZL9img_noses,4,4
	.type	_ZL9img_noses, @object
	.lcomm	_ZL12img_features,4,4
	.type	_ZL12img_features, @object
	.lcomm	_ZL8img_lips,4,4
	.type	_ZL8img_lips, @object
	.lcomm	_ZL8img_mole,4,4
	.type	_ZL8img_mole, @object
	.lcomm	_ZL10img_beards,4,4
	.type	_ZL10img_beards, @object
	.lcomm	_ZL12img_mustache,4,4
	.type	_ZL12img_mustache, @object
	.lcomm	_ZL11img_glasses,4,4
	.type	_ZL11img_glasses, @object
	.globl img_staticmii
	.lcomm	img_staticmii,400,4
	.type	img_staticmii, @object
	.globl hairbg
	.section	".data"
	.align 2
	.type	hairbg, @object
	.size	hairbg, 288
hairbg:
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	16
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	17
	.long	18
	.long	56
	.long	19
	.long	20
	.long	56
	.long	56
	.long	56
	.long	21
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	56
	.long	22
	.long	23
	.long	56
	.long	56
	.long	24
	.long	25
	.long	56
	.long	26
	.long	27
	.long	28
	.long	29
	.long	30
	.long	31
	.long	32
	.long	33
	.long	34
	.long	35
	.long	36
	.long	37
	.long	38
	.long	39
	.long	40
	.long	41
	.long	42
	.long	43
	.long	44
	.long	45
	.long	56
	.long	56
	.long	48
	.long	49
	.long	50
	.long	51
	.long	52
	.long	53
	.long	56
	.globl hairfg
	.align 2
	.type	hairfg, @object
	.size	hairfg, 288
hairfg:
	.long	59
	.long	42
	.long	65
	.long	49
	.long	40
	.long	44
	.long	52
	.long	47
	.long	45
	.long	63
	.long	51
	.long	54
	.long	36
	.long	37
	.long	48
	.long	70
	.long	61
	.long	56
	.long	64
	.long	43
	.long	53
	.long	58
	.long	50
	.long	27
	.long	69
	.long	41
	.long	39
	.long	46
	.long	66
	.long	71
	.long	33
	.long	11
	.long	12
	.long	0
	.long	35
	.long	57
	.long	30
	.long	14
	.long	25
	.long	4
	.long	1
	.long	31
	.long	26
	.long	24
	.long	3
	.long	6
	.long	62
	.long	13
	.long	15
	.long	7
	.long	19
	.long	2
	.long	17
	.long	67
	.long	29
	.long	20
	.long	9
	.long	34
	.long	18
	.long	8
	.long	22
	.long	60
	.long	23
	.long	55
	.long	21
	.long	32
	.long	16
	.long	28
	.long	10
	.long	38
	.long	5
	.long	68
	.globl haircol
	.align 2
	.type	haircol, @object
	.size	haircol, 32
haircol:
	.long	286331391
	.long	857875199
	.long	1141969407
	.long	-1150925569
	.long	-2004309249
	.long	1144201983
	.long	-1721350913
	.long	-574907905
	.globl skincol
	.align 2
	.type	skincol, @object
	.size	skincol, 24
skincol:
	.long	-321929729
	.long	-138641921
	.long	-678803201
	.long	-172914177
	.long	-1722735873
	.long	1445990655
	.globl eyecol
	.align 2
	.type	eyecol, @object
	.size	eyecol, 24
eyecol:
	.long	255
	.long	2005436415
	.long	2120439295
	.long	-2004270849
	.long	1787089151
	.long	1083923199
	.globl lipcol
	.align 2
	.type	lipcol, @object
	.size	lipcol, 12
lipcol:
	.long	-949205249
	.long	-464635137
	.long	-662205953
	.globl glassescol
	.align 2
	.type	glassescol, @object
	.size	glassescol, 24
glassescol:
	.long	1651338495
	.long	-2056242433
	.long	-1420937217
	.long	1114216191
	.long	-1182849025
	.long	-1111508481
	.globl eyebrows
	.align 2
	.type	eyebrows, @object
	.size	eyebrows, 96
eyebrows:
	.long	1
	.long	3
	.long	14
	.long	15
	.long	11
	.long	10
	.long	0
	.long	6
	.long	8
	.long	4
	.long	13
	.long	12
	.long	2
	.long	19
	.long	16
	.long	18
	.long	22
	.long	9
	.long	21
	.long	5
	.long	17
	.long	7
	.long	20
	.long	23
	.globl eyes
	.align 2
	.type	eyes, @object
	.size	eyes, 192
eyes:
	.long	2
	.long	6
	.long	0
	.long	42
	.long	1
	.long	24
	.long	29
	.long	36
	.long	3
	.long	16
	.long	45
	.long	13
	.long	17
	.long	26
	.long	46
	.long	9
	.long	8
	.long	5
	.long	33
	.long	14
	.long	11
	.long	20
	.long	44
	.long	18
	.long	30
	.long	21
	.long	7
	.long	10
	.long	34
	.long	41
	.long	31
	.long	32
	.long	15
	.long	12
	.long	19
	.long	23
	.long	27
	.long	28
	.long	38
	.long	4
	.long	22
	.long	25
	.long	39
	.long	43
	.long	37
	.long	40
	.long	35
	.long	47
	.globl noses
	.align 2
	.type	noses, @object
	.size	noses, 48
noses:
	.long	5
	.long	0
	.long	2
	.long	3
	.long	7
	.long	6
	.long	4
	.long	10
	.long	8
	.long	9
	.long	1
	.long	11
	.globl lips
	.align 2
	.type	lips, @object
	.size	lips, 96
lips:
	.long	6
	.long	1
	.long	14
	.long	16
	.long	17
	.long	5
	.long	10
	.long	12
	.long	7
	.long	13
	.long	8
	.long	19
	.long	23
	.long	11
	.long	22
	.long	18
	.long	9
	.long	15
	.long	21
	.long	2
	.long	20
	.long	3
	.long	4
	.long	0
	.globl feature
	.section	".sbss","aw",@nobits
	.align 2
feature:
	.zero	4
	.size	feature, 4
	.type	feature, @object
	.globl blink
	.lcomm	blink,400,4
	.type	blink, @object
	.globl blinkrand
	.lcomm	blinkrand,400,4
	.type	blinkrand, @object
	.globl blinkcount
	.lcomm	blinkcount,400,4
	.type	blinkcount, @object
	.globl startblink
	.lcomm	startblink,400,4
	.type	startblink, @object
	.globl neck
	.align 2
neck:
	.zero	4
	.size	neck, 4
	.type	neck, @object
	.globl bodyadjust
	.lcomm	bodyadjust,400,4
	.type	bodyadjust, @object
	.globl miinames
	.lcomm	miinames,1100,1
	.type	miinames, @object
	.section	.rodata
	.align 2
.LC0:
	.long	3
	.long	4
	.long	5
	.long	8
	.long	14
	.long	16
	.long	19
	.long	23
	.section	".text"
	.align 2
	.globl _Z12MakeMiiHappyi
	.type	_Z12MakeMiiHappyi, @function
_Z12MakeMiiHappyi:
.LFB96:
	.loc 1 65 32
	.cfi_startproc
	stwu 1,-72(1)
	.cfi_def_cfa_offset 72
	mflr 0
	stw 0,76(1)
	stw 31,68(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,56(31)
.LBB2:
	.loc 1 66 2
	lwz 9,56(31)
	cmpwi 0,9,1
	bne 0,.L6
.LBB3:
	.loc 1 67 7
	lis 9,.LC0@ha
	la 9,.LC0@l(9)
	lwz 6,0(9)
	lwz 7,4(9)
	lwz 8,8(9)
	lwz 10,12(9)
	stw 6,12(31)
	stw 7,16(31)
	stw 8,20(31)
	stw 10,24(31)
	lwz 7,16(9)
	lwz 8,20(9)
	lwz 10,24(9)
	lwz 9,28(9)
	stw 7,28(31)
	stw 8,32(31)
	stw 10,36(31)
	stw 9,40(31)
	.loc 1 68 22
	bl rand
	mr 9,3
	.loc 1 68 25
	srawi 10,9,3
	addze 10,10
	slwi 10,10,3
	subf 9,10,9
	.loc 1 68 29
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	addi 9,9,4
	lwz 9,0(9)
	b .L7
.L6:
.LBE3:
.LBB4:
.LBB5:
	.loc 1 70 7
	lwz 9,56(31)
	cmpwi 0,9,2
	bne 0,.L8
.LBB6:
	.loc 1 71 7
	li 9,0
	stw 9,8(31)
	.loc 1 72 17
	lwz 9,8(31)
	b .L7
.L8:
.LBE6:
	.loc 1 75 15
	li 9,0
.L7:
.LBE5:
.LBE4:
.LBE2:
	.loc 1 76 1 discriminator 1
	mr 3,9
	addi 11,31,72
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE96:
	.size	_Z12MakeMiiHappyi, .-_Z12MakeMiiHappyi
	.section	.rodata
	.align 2
.LC1:
	.long	9
	.long	22
	.long	24
	.align 2
.LC2:
	.long	6
	.long	33
	.long	39
	.section	".text"
	.align 2
	.globl _Z10MakeMiiSadi
	.type	_Z10MakeMiiSadi, @function
_Z10MakeMiiSadi:
.LFB97:
	.loc 1 77 30
	.cfi_startproc
	stwu 1,-56(1)
	.cfi_def_cfa_offset 56
	mflr 0
	stw 0,60(1)
	stw 31,52(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,40(31)
.LBB7:
	.loc 1 78 2
	lwz 9,40(31)
	cmpwi 0,9,1
	bne 0,.L10
.LBB8:
	.loc 1 79 7
	lis 9,.LC1@ha
	la 9,.LC1@l(9)
	lwz 8,0(9)
	lwz 10,4(9)
	lwz 9,8(9)
	stw 8,8(31)
	stw 10,12(31)
	stw 9,16(31)
	.loc 1 80 22
	bl rand
	mr 10,3
	.loc 1 80 25
	lis 9,0x5555
	ori 9,9,0x5556
	mulhw 8,10,9
	srawi 9,10,31
	subf 9,9,8
	mulli 9,9,3
	subf 9,9,10
	.loc 1 80 29
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	lwz 9,0(9)
	b .L11
.L10:
.LBE8:
.LBB9:
.LBB10:
	.loc 1 82 7
	lwz 9,40(31)
	cmpwi 0,9,2
	bne 0,.L12
.LBB11:
	.loc 1 83 7
	lis 9,.LC2@ha
	la 9,.LC2@l(9)
	lwz 8,0(9)
	lwz 10,4(9)
	lwz 9,8(9)
	stw 8,20(31)
	stw 10,24(31)
	stw 9,28(31)
	.loc 1 84 22
	bl rand
	mr 10,3
	.loc 1 84 25
	lis 9,0x5555
	ori 9,9,0x5556
	mulhw 8,10,9
	srawi 9,10,31
	subf 9,9,8
	mulli 9,9,3
	subf 9,9,10
	.loc 1 84 29
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	addi 9,9,12
	lwz 9,0(9)
	b .L11
.L12:
.LBE11:
	.loc 1 87 15
	li 9,0
.L11:
.LBE10:
.LBE9:
.LBE7:
	.loc 1 88 1 discriminator 1
	mr 3,9
	addi 11,31,56
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE97:
	.size	_Z10MakeMiiSadi, .-_Z10MakeMiiSadi
	.section	.rodata
	.align 2
.LC3:
	.long	15
	.long	11
	.align 2
.LC4:
	.long	10
	.long	13
	.long	36
	.long	37
	.long	43
	.section	".text"
	.align 2
	.globl _Z14MakeMiiShockedi
	.type	_Z14MakeMiiShockedi, @function
_Z14MakeMiiShockedi:
.LFB98:
	.loc 1 89 34
	.cfi_startproc
	stwu 1,-56(1)
	.cfi_def_cfa_offset 56
	mflr 0
	stw 0,60(1)
	stw 31,52(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,40(31)
.LBB12:
	.loc 1 90 2
	lwz 9,40(31)
	cmpwi 0,9,1
	bne 0,.L14
.LBB13:
	.loc 1 91 7
	lis 9,.LC3@ha
	la 9,.LC3@l(9)
	lwz 10,0(9)
	lwz 11,4(9)
	stw 10,8(31)
	stw 11,12(31)
	.loc 1 92 23
	bl rand
	mr 9,3
	.loc 1 92 26
	srawi 10,9,1
	addze 10,10
	slwi 10,10,1
	subf 9,10,9
	.loc 1 92 30
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	lwz 9,0(9)
	b .L15
.L14:
.LBE13:
.LBB14:
.LBB15:
	.loc 1 94 7
	lwz 9,40(31)
	cmpwi 0,9,2
	bne 0,.L16
.LBB16:
	.loc 1 95 7
	lis 9,.LC4@ha
	la 9,.LC4@l(9)
	lwz 6,0(9)
	lwz 7,4(9)
	lwz 8,8(9)
	lwz 10,12(9)
	stw 6,16(31)
	stw 7,20(31)
	stw 8,24(31)
	stw 10,28(31)
	lwz 9,16(9)
	stw 9,32(31)
	.loc 1 96 22
	bl rand
	mr 10,3
	.loc 1 96 25
	lis 9,0x6666
	ori 9,9,0x6667
	mulhw 9,10,9
	srawi 8,9,1
	srawi 9,10,31
	subf 9,9,8
	mulli 9,9,5
	subf 9,9,10
	.loc 1 96 29
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	addi 9,9,8
	lwz 9,0(9)
	b .L15
.L16:
.LBE16:
	.loc 1 99 15
	li 9,0
.L15:
.LBE15:
.LBE14:
.LBE12:
	.loc 1 100 1 discriminator 1
	mr 3,9
	addi 11,31,56
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE98:
	.size	_Z14MakeMiiShockedi, .-_Z14MakeMiiShockedi
	.section	.rodata
	.align 2
.LC5:
	.long	1
	.long	21
	.long	24
	.align 2
.LC6:
	.long	44
	.long	44
	.section	".text"
	.align 2
	.globl _Z10MakeMiiMadi
	.type	_Z10MakeMiiMadi, @function
_Z10MakeMiiMadi:
.LFB99:
	.loc 1 101 30
	.cfi_startproc
	stwu 1,-56(1)
	.cfi_def_cfa_offset 56
	mflr 0
	stw 0,60(1)
	stw 31,52(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	stw 3,40(31)
.LBB17:
	.loc 1 102 2
	lwz 9,40(31)
	cmpwi 0,9,1
	bne 0,.L18
.LBB18:
	.loc 1 103 7
	lis 9,.LC5@ha
	la 9,.LC5@l(9)
	lwz 8,0(9)
	lwz 10,4(9)
	lwz 9,8(9)
	stw 8,8(31)
	stw 10,12(31)
	stw 9,16(31)
	.loc 1 104 23
	bl rand
	mr 10,3
	.loc 1 104 26
	lis 9,0x5555
	ori 9,9,0x5556
	mulhw 8,10,9
	srawi 9,10,31
	subf 9,9,8
	mulli 9,9,3
	subf 9,9,10
	.loc 1 104 30
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	lwz 9,0(9)
	b .L19
.L18:
.LBE18:
.LBB19:
.LBB20:
	.loc 1 106 7
	lwz 9,40(31)
	cmpwi 0,9,2
	bne 0,.L20
.LBB21:
	.loc 1 107 7
	lis 9,.LC6@ha
	la 9,.LC6@l(9)
	lwz 10,0(9)
	lwz 11,4(9)
	stw 10,20(31)
	stw 11,24(31)
	.loc 1 108 22
	bl rand
	mr 9,3
	.loc 1 108 25
	srawi 10,9,1
	addze 10,10
	slwi 10,10,1
	subf 9,10,9
	.loc 1 108 29
	slwi 9,9,2
	addi 10,31,8
	add 9,10,9
	addi 9,9,12
	lwz 9,0(9)
	b .L19
.L20:
.LBE21:
	.loc 1 111 15
	li 9,0
.L19:
.LBE20:
.LBE19:
.LBE17:
	.loc 1 112 1 discriminator 1
	mr 3,9
	addi 11,31,56
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE99:
	.size	_Z10MakeMiiMadi, .-_Z10MakeMiiMadi
	.align 2
	.globl _Z15GRRLIB_MiisInitv
	.type	_Z15GRRLIB_MiisInitv, @function
_Z15GRRLIB_MiisInitv:
.LFB100:
	.loc 1 113 24
	.cfi_startproc
	stwu 1,-16(1)
	.cfi_def_cfa_offset 16
	mflr 0
	stw 0,20(1)
	stw 31,12(1)
	.cfi_offset 65, 4
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	.loc 1 115 32
	lis 9,mii_heads_png@ha
	la 3,mii_heads_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 115 12
	lis 9,_ZL9img_heads@ha
	stw 10,_ZL9img_heads@l(9)
	.loc 1 116 33
	lis 9,mii_hairs1_png@ha
	la 3,mii_hairs1_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 116 13
	lis 9,_ZL10img_hairs1@ha
	stw 10,_ZL10img_hairs1@l(9)
	.loc 1 117 33
	lis 9,mii_hairs2_png@ha
	la 3,mii_hairs2_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 117 13
	lis 9,_ZL10img_hairs2@ha
	stw 10,_ZL10img_hairs2@l(9)
	.loc 1 118 35
	lis 9,mii_eyebrows_png@ha
	la 3,mii_eyebrows_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 118 15
	lis 9,_ZL12img_eyebrows@ha
	stw 10,_ZL12img_eyebrows@l(9)
	.loc 1 119 32
	lis 9,mii_eyes1_png@ha
	la 3,mii_eyes1_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 119 12
	lis 9,_ZL9img_eyes1@ha
	stw 10,_ZL9img_eyes1@l(9)
	.loc 1 120 32
	lis 9,mii_eyes2_png@ha
	la 3,mii_eyes2_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 120 12
	lis 9,_ZL9img_eyes2@ha
	stw 10,_ZL9img_eyes2@l(9)
	.loc 1 121 32
	lis 9,mii_eyes3_png@ha
	la 3,mii_eyes3_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 121 12
	lis 9,_ZL9img_eyes3@ha
	stw 10,_ZL9img_eyes3@l(9)
	.loc 1 122 32
	lis 9,mii_noses_png@ha
	la 3,mii_noses_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 122 12
	lis 9,_ZL9img_noses@ha
	stw 10,_ZL9img_noses@l(9)
	.loc 1 123 35
	lis 9,mii_features_png@ha
	la 3,mii_features_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 123 15
	lis 9,_ZL12img_features@ha
	stw 10,_ZL12img_features@l(9)
	.loc 1 124 31
	lis 9,mii_lips_png@ha
	la 3,mii_lips_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 124 11
	lis 9,_ZL8img_lips@ha
	stw 10,_ZL8img_lips@l(9)
	.loc 1 125 31
	lis 9,mii_mole_png@ha
	la 3,mii_mole_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 125 11
	lis 9,_ZL8img_mole@ha
	stw 10,_ZL8img_mole@l(9)
	.loc 1 126 33
	lis 9,mii_beards_png@ha
	la 3,mii_beards_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 126 13
	lis 9,_ZL10img_beards@ha
	stw 10,_ZL10img_beards@l(9)
	.loc 1 127 35
	lis 9,mii_mustache_png@ha
	la 3,mii_mustache_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 127 15
	lis 9,_ZL12img_mustache@ha
	stw 10,_ZL12img_mustache@l(9)
	.loc 1 128 34
	lis 9,mii_glasses_png@ha
	la 3,mii_glasses_png@l(9)
	bl GRRLIB_LoadTexture
	mr 10,3
	.loc 1 128 14
	lis 9,_ZL11img_glasses@ha
	stw 10,_ZL11img_glasses@l(9)
	.loc 1 130 20
	lis 9,_ZL9img_heads@ha
	lwz 9,_ZL9img_heads@l(9)
	li 6,0
	li 5,120
	li 4,120
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 131 20
	lis 9,_ZL10img_hairs1@ha
	lwz 9,_ZL10img_hairs1@l(9)
	li 6,0
	li 5,120
	li 4,120
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 132 20
	lis 9,_ZL10img_hairs2@ha
	lwz 9,_ZL10img_hairs2@l(9)
	li 6,0
	li 5,120
	li 4,120
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 133 20
	lis 9,_ZL12img_eyebrows@ha
	lwz 9,_ZL12img_eyebrows@l(9)
	li 6,0
	li 5,54
	li 4,36
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 134 20
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 6,0
	li 5,54
	li 4,54
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 135 20
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 6,0
	li 5,54
	li 4,54
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 136 20
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 6,0
	li 5,54
	li 4,54
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 137 20
	lis 9,_ZL9img_noses@ha
	lwz 9,_ZL9img_noses@l(9)
	li 6,0
	li 5,50
	li 4,50
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 138 20
	lis 9,_ZL12img_features@ha
	lwz 9,_ZL12img_features@l(9)
	li 6,0
	li 5,120
	li 4,120
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 139 20
	lis 9,_ZL8img_lips@ha
	lwz 9,_ZL8img_lips@l(9)
	li 6,0
	li 5,60
	li 4,60
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 140 20
	lis 9,_ZL10img_beards@ha
	lwz 9,_ZL10img_beards@l(9)
	li 6,0
	li 5,140
	li 4,120
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 141 20
	lis 9,_ZL12img_mustache@ha
	lwz 9,_ZL12img_mustache@l(9)
	li 6,0
	li 5,60
	li 4,60
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 142 20
	lis 9,_ZL11img_glasses@ha
	lwz 9,_ZL11img_glasses@l(9)
	li 6,0
	li 5,72
	li 4,180
	mr 3,9
	bl GRRLIB_InitTileSet
	.loc 1 144 21
	bl loadMiis_Wii
	mr 10,3
	.loc 1 144 7
	lis 9,miis@ha
	stw 10,miis@l(9)
	.loc 1 145 1
	nop
	addi 11,31,16
	lwz 0,4(11)
	mtlr 0
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE100:
	.size	_Z15GRRLIB_MiisInitv, .-_Z15GRRLIB_MiisInitv
	.align 2
	.globl _Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg
	.type	_Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg, @function
_Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg:
.LFB101:
	.loc 1 148 104
	.cfi_startproc
	stwu 1,-1112(1)
	.cfi_def_cfa_offset 1112
	mflr 0
	stw 0,1116(1)
	stw 30,1104(1)
	stw 31,1108(1)
	.cfi_offset 65, 4
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	mr 30,3
	stw 4,8(31)
	stw 5,12(31)
	stw 6,16(31)
	stw 7,20(31)
	stw 8,24(31)
	.loc 1 150 19
	bl GRRLIB_CompoStart
	.loc 1 152 18
	lis 9,_ZL10img_hairs1@ha
	lwz 9,_ZL10img_hairs1@l(9)
	li 5,0
	li 4,60
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 153 18
	lis 9,_ZL10img_hairs2@ha
	lwz 9,_ZL10img_hairs2@l(9)
	li 5,0
	li 4,60
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 154 17
	lis 9,_ZL10img_hairs2@ha
	lwz 7,_ZL10img_hairs2@l(9)
	.loc 1 154 53
	lwz 9,120(30)
	.loc 1 154 48
	slwi 9,9,1
	.loc 1 154 45
	subfic 10,9,1
	.loc 1 154 17
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,36(31)
	stw 9,32(31)
	lfd 12,32(31)
	fsub 0,12,0
	frsp 10,0
	.loc 1 154 81
	lwz 9,116(30)
	.loc 1 154 17
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 154 111
	lwz 9,112(30)
	.loc 1 154 119
	lis 10,hairfg@ha
	la 10,hairfg@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 154 17
	lis 10,hairbg@ha
	la 10,hairbg@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC10@ha
	lfs 12,.LC10@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,10
	mr 4,8
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,7
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
	.loc 1 155 17
	lis 9,_ZL9img_heads@ha
	lwz 8,_ZL9img_heads@l(9)
	.loc 1 155 60
	lwz 9,96(30)
	.loc 1 155 17
	lis 10,skincol@ha
	la 10,skincol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lwz 7,92(30)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC8@ha
	lfs 10,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 12,.LC12@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,7
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,8
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
	.loc 1 157 9
	lwz 9,92(30)
	.loc 1 157 2
	cmpwi 0,9,0
	bne 0,.L23
	.loc 1 157 27 discriminator 1
	lis 9,neck@ha
	li 10,2
	stw 10,neck@l(9)
	b .L24
.L23:
	.loc 1 158 14
	lwz 9,92(30)
	.loc 1 158 7
	cmpwi 0,9,1
	bne 0,.L25
	.loc 1 158 32 discriminator 1
	lis 9,neck@ha
	li 10,0
	stw 10,neck@l(9)
	b .L24
.L25:
	.loc 1 159 14
	lwz 9,92(30)
	.loc 1 159 7
	cmpwi 0,9,2
	bne 0,.L26
	.loc 1 159 32 discriminator 1
	lis 9,neck@ha
	li 10,8
	stw 10,neck@l(9)
	b .L24
.L26:
	.loc 1 160 14
	lwz 9,92(30)
	.loc 1 160 7
	cmpwi 0,9,3
	bne 0,.L27
	.loc 1 160 32 discriminator 1
	lis 9,neck@ha
	li 10,5
	stw 10,neck@l(9)
	b .L24
.L27:
	.loc 1 161 14
	lwz 9,92(30)
	.loc 1 161 7
	cmpwi 0,9,4
	bne 0,.L28
	.loc 1 161 32 discriminator 1
	lis 9,neck@ha
	li 10,1
	stw 10,neck@l(9)
	b .L24
.L28:
	.loc 1 162 14
	lwz 9,92(30)
	.loc 1 162 7
	cmpwi 0,9,5
	bne 0,.L29
	.loc 1 162 32 discriminator 1
	lis 9,neck@ha
	li 10,1
	stw 10,neck@l(9)
	b .L24
.L29:
	.loc 1 163 14
	lwz 9,92(30)
	.loc 1 163 7
	cmpwi 0,9,6
	bne 0,.L30
	.loc 1 163 32 discriminator 1
	lis 9,neck@ha
	li 10,9
	stw 10,neck@l(9)
	b .L24
.L30:
	.loc 1 164 14
	lwz 9,92(30)
	.loc 1 164 7
	cmpwi 0,9,7
	bne 0,.L24
	.loc 1 164 32 discriminator 1
	lis 9,neck@ha
	li 10,10
	stw 10,neck@l(9)
.L24:
	.loc 1 166 9
	lwz 9,100(30)
	.loc 1 166 2
	cmpwi 0,9,0
	bne 0,.L31
	.loc 1 166 34 discriminator 1
	lis 9,feature@ha
	li 10,39
	stw 10,feature@l(9)
	b .L32
.L31:
	.loc 1 167 14
	lwz 9,100(30)
	.loc 1 167 7
	cmpwi 0,9,1
	bne 0,.L33
	.loc 1 167 44 discriminator 1
	lwz 10,92(30)
	.loc 1 167 39 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
	b .L32
.L33:
	.loc 1 168 14
	lwz 9,100(30)
	.loc 1 168 7
	cmpwi 0,9,2
	bne 0,.L34
	.loc 1 168 44 discriminator 1
	lwz 10,92(30)
	.loc 1 168 39 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
	b .L32
.L34:
	.loc 1 169 14
	lwz 9,100(30)
	.loc 1 169 7
	cmpwi 0,9,3
	bne 0,.L35
	.loc 1 169 39 discriminator 1
	lis 9,feature@ha
	li 10,33
	stw 10,feature@l(9)
	b .L32
.L35:
	.loc 1 170 14
	lwz 9,100(30)
	.loc 1 170 7
	cmpwi 0,9,4
	bne 0,.L36
	.loc 1 170 39 discriminator 1
	lis 9,feature@ha
	li 10,34
	stw 10,feature@l(9)
	b .L32
.L36:
	.loc 1 171 14
	lwz 9,100(30)
	.loc 1 171 7
	cmpwi 0,9,5
	bne 0,.L37
	.loc 1 171 39 discriminator 1
	lis 9,feature@ha
	li 10,35
	stw 10,feature@l(9)
	b .L32
.L37:
	.loc 1 172 14
	lwz 9,100(30)
	.loc 1 172 7
	cmpwi 0,9,6
	bne 0,.L38
	.loc 1 172 39 discriminator 1
	lis 9,feature@ha
	li 10,36
	stw 10,feature@l(9)
	b .L32
.L38:
	.loc 1 173 14
	lwz 9,100(30)
	.loc 1 173 7
	cmpwi 0,9,7
	bne 0,.L39
	.loc 1 173 47 discriminator 1
	lwz 9,92(30)
	.loc 1 173 42 discriminator 1
	addi 10,9,40
	.loc 1 173 39 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
	b .L32
.L39:
	.loc 1 174 14
	lwz 9,100(30)
	.loc 1 174 7
	cmpwi 0,9,8
	bne 0,.L40
	.loc 1 174 39 discriminator 1
	lis 9,feature@ha
	li 10,38
	stw 10,feature@l(9)
	b .L32
.L40:
	.loc 1 175 14
	lwz 9,100(30)
	.loc 1 175 7
	cmpwi 0,9,9
	bne 0,.L41
	.loc 1 175 46 discriminator 1
	lwz 9,92(30)
	.loc 1 175 41 discriminator 1
	addi 10,9,8
	.loc 1 175 39 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
	b .L32
.L41:
	.loc 1 176 14
	lwz 9,100(30)
	.loc 1 176 7
	cmpwi 0,9,10
	bne 0,.L42
	.loc 1 176 48 discriminator 1
	lwz 9,92(30)
	.loc 1 176 43 discriminator 1
	addi 10,9,16
	.loc 1 176 40 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
	b .L32
.L42:
	.loc 1 177 14
	lwz 9,100(30)
	.loc 1 177 7
	cmpwi 0,9,11
	bne 0,.L32
	.loc 1 177 48 discriminator 1
	lwz 9,92(30)
	.loc 1 177 43 discriminator 1
	addi 10,9,24
	.loc 1 177 40 discriminator 1
	lis 9,feature@ha
	stw 10,feature@l(9)
.L32:
	.loc 1 179 9
	lwz 9,100(30)
	.loc 1 179 2
	cmpwi 0,9,2
	bne 0,.L43
	.loc 1 180 18
	lis 9,_ZL12img_features@ha
	lwz 8,_ZL12img_features@l(9)
	.loc 1 180 64
	lwz 9,96(30)
	.loc 1 180 18
	lis 10,skincol@ha
	la 10,skincol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC8@ha
	lfs 10,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 12,.LC12@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	li 5,32
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,8
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
	.loc 1 181 18
	lis 9,_ZL12img_features@ha
	lwz 8,_ZL12img_features@l(9)
	.loc 1 181 64
	lwz 9,96(30)
	.loc 1 181 18
	lis 10,skincol@ha
	la 10,skincol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,feature@ha
	lwz 7,feature@l(9)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC8@ha
	lfs 10,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 12,.LC12@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,7
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,8
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L44
.L43:
	.loc 1 183 22
	lis 9,_ZL12img_features@ha
	lwz 8,_ZL12img_features@l(9)
	.loc 1 183 68
	lwz 9,96(30)
	.loc 1 183 22
	lis 10,skincol@ha
	la 10,skincol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,feature@ha
	lwz 7,feature@l(9)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC8@ha
	lfs 10,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 12,.LC12@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,7
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,8
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
.L44:
	.loc 1 185 9
	lwz 9,220(30)
	.loc 1 185 2
	cmpwi 0,9,0
	ble 0,.L45
	.loc 1 185 37 discriminator 1
	lis 9,_ZL10img_beards@ha
	lwz 8,_ZL10img_beards@l(9)
	.loc 1 185 81 discriminator 1
	lwz 9,224(30)
	.loc 1 185 37 discriminator 1
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 7,0(9)
	.loc 1 185 105 discriminator 1
	lwz 9,220(30)
	.loc 1 185 114 discriminator 1
	addi 9,9,-1
	.loc 1 185 117 discriminator 1
	slwi 10,9,3
	.loc 1 185 125 discriminator 1
	lwz 9,92(30)
	.loc 1 185 37 discriminator 1
	add 10,10,9
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC8@ha
	lfs 10,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 12,.LC12@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,10
	mr 4,7
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,8
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
.L45:
	.loc 1 187 18
	lis 9,_ZL8img_mole@ha
	lwz 9,_ZL8img_mole@l(9)
	li 5,6
	li 4,6
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 188 9
	lwz 9,236(30)
	.loc 1 188 2
	cmpwi 0,9,1
	bne 0,.L46
	.loc 1 188 44 discriminator 1
	lwz 9,248(30)
	.loc 1 188 36 discriminator 1
	addi 9,9,63
	slwi 10,9,2
	.loc 1 188 32 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,44(31)
	stw 9,40(31)
	lfd 12,40(31)
	fsub 0,12,0
	frsp 11,0
	.loc 1 188 72 discriminator 1
	lwz 10,244(30)
	.loc 1 188 67 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,52(31)
	stw 9,48(31)
	lfd 12,48(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 188 62 discriminator 1
	lis 9,.LC14@ha
	lfd 0,.LC14@l(9)
	fadd 0,12,0
	.loc 1 188 32 discriminator 1
	frsp 10,0
	lis 9,_ZL8img_mole@ha
	lwz 7,_ZL8img_mole@l(9)
	.loc 1 188 107 discriminator 1
	lwz 10,240(30)
	.loc 1 188 115 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,60(31)
	stw 9,56(31)
	lfd 12,56(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 188 101 discriminator 1
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 188 32 discriminator 1
	frsp 9,0
	.loc 1 188 130 discriminator 1
	lwz 10,240(30)
	.loc 1 188 138 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,68(31)
	stw 9,64(31)
	lfd 12,64(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 188 124 discriminator 1
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 188 32 discriminator 1
	frsp 12,0
	lis 9,.LC9@ha
	lfs 0,.LC9@l(9)
	li 4,-1
	fmr 5,12
	fmr 4,9
	fmr 3,0
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawImg
.L46:
	.loc 1 191 13
	lis 9,blink@ha
	la 10,blink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 191 14
	addi 10,9,1
	lis 9,blink@ha
	la 8,blink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,8,9
	stw 10,0(9)
	.loc 1 192 16
	lis 9,blink@ha
	la 10,blink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	.loc 1 192 41
	lis 9,blinkrand@ha
	la 8,blinkrand@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,8,9
	lwz 9,0(9)
	.loc 1 192 25
	mulli 9,9,100
	.loc 1 192 21
	addi 9,9,300
	.loc 1 192 2
	cmpw 0,10,9
	ble 0,.L47
	.loc 1 192 61 discriminator 1
	lis 9,startblink@ha
	la 10,startblink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	li 10,1
	stw 10,0(9)
.L47:
	.loc 1 193 21
	lis 9,startblink@ha
	la 10,startblink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 193 2
	cmpwi 0,9,1
	bne 0,.L48
	.loc 1 193 43 discriminator 1
	lis 9,blinkcount@ha
	la 10,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 193 44 discriminator 1
	addi 10,9,1
	lis 9,blinkcount@ha
	la 8,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,8,9
	stw 10,0(9)
.L48:
	.loc 1 194 21
	lis 9,blinkcount@ha
	la 10,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 194 2
	cmpwi 0,9,11
	ble 0,.L49
	.loc 1 195 24
	bl rand
	mr 9,3
	.loc 1 195 27
	srawi 10,9,3
	addze 10,10
	slwi 10,10,3
	subf 10,10,9
	.loc 1 195 19
	lis 9,blinkrand@ha
	la 8,blinkrand@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,8,9
	stw 10,0(9)
	.loc 1 196 15
	lis 9,blink@ha
	la 10,blink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	li 10,0
	stw 10,0(9)
	.loc 1 197 20
	lis 9,startblink@ha
	la 10,startblink@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	li 10,0
	stw 10,0(9)
	.loc 1 198 20
	lis 9,blinkcount@ha
	la 10,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	li 10,0
	stw 10,0(9)
.L49:
	.loc 1 202 21
	lis 9,blinkcount@ha
	la 10,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 202 2
	cmpwi 0,9,10
	bgt 0,.L50
	.loc 1 202 45 discriminator 1
	lis 9,blinkcount@ha
	la 10,blinkcount@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 202 26 discriminator 1
	cmpwi 0,9,1
	ble 0,.L50
	.loc 1 202 49 discriminator 2
	lwz 9,12(31)
	cmpwi 0,9,1
	bne 0,.L50
	.loc 1 203 19
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 204 32
	lwz 10,168(30)
	.loc 1 204 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,76(31)
	stw 9,72(31)
	lfd 12,72(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 204 22
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 204 18
	frsp 11,0
	.loc 1 204 64
	lwz 10,156(30)
	.loc 1 204 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,84(31)
	stw 9,80(31)
	lfd 12,80(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 204 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 204 18
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 204 104
	lwz 9,152(30)
	.loc 1 204 99
	subfic 10,9,7
	.loc 1 204 95
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,92(31)
	stw 9,88(31)
	lfd 12,88(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 204 18
	frsp 9,0
	.loc 1 204 126
	lwz 10,164(30)
	.loc 1 204 133
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,100(31)
	stw 9,96(31)
	lfd 12,96(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 204 120
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 204 18
	frsp 8,0
	.loc 1 204 148
	lwz 10,164(30)
	.loc 1 204 155
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,108(31)
	stw 9,104(31)
	lfd 12,104(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 204 142
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 204 18
	frsp 0,0
	li 5,46
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 205 19
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 206 32
	lwz 10,168(30)
	.loc 1 206 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,116(31)
	stw 9,112(31)
	lfd 12,112(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 206 22
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 206 18
	frsp 11,0
	.loc 1 206 64
	lwz 10,156(30)
	.loc 1 206 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,124(31)
	stw 9,120(31)
	lfd 12,120(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 206 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 206 18
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 206 104
	lwz 9,152(30)
	.loc 1 206 99
	subfic 10,9,7
	.loc 1 206 95
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,132(31)
	stw 9,128(31)
	lfd 12,128(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 206 18
	frsp 9,0
	.loc 1 206 126
	lwz 10,164(30)
	.loc 1 206 133
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,140(31)
	stw 9,136(31)
	lfd 12,136(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 206 120
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 206 18
	frsp 8,0
	.loc 1 206 148
	lwz 10,164(30)
	.loc 1 206 155
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,148(31)
	stw 9,144(31)
	lfd 12,144(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 206 142
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 206 18
	frsp 0,0
	.loc 1 206 173
	lwz 9,160(30)
	.loc 1 206 18
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	li 5,46
	mr 4,9
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 207 19
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 208 32
	lwz 10,168(30)
	.loc 1 208 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,156(31)
	stw 9,152(31)
	lfd 12,152(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 208 22
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 208 18
	frsp 11,0
	.loc 1 208 64
	lwz 10,156(30)
	.loc 1 208 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,164(31)
	stw 9,160(31)
	lfd 12,160(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 208 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 208 18
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 208 104
	lwz 9,152(30)
	.loc 1 208 99
	subfic 10,9,7
	.loc 1 208 95
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,172(31)
	stw 9,168(31)
	lfd 12,168(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 208 18
	frsp 9,0
	.loc 1 208 126
	lwz 10,164(30)
	.loc 1 208 133
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,180(31)
	stw 9,176(31)
	lfd 12,176(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 208 120
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 208 18
	frsp 8,0
	.loc 1 208 148
	lwz 10,164(30)
	.loc 1 208 155
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,188(31)
	stw 9,184(31)
	lfd 12,184(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 208 142
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 208 18
	frsp 0,0
	li 5,46
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 209 19
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 210 32
	lwz 10,168(30)
	.loc 1 210 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,196(31)
	stw 9,192(31)
	lfd 12,192(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 210 22
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 210 18
	frsp 11,0
	.loc 1 210 64
	lwz 10,156(30)
	.loc 1 210 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,204(31)
	stw 9,200(31)
	lfd 12,200(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 210 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 210 18
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 210 105
	lwz 9,152(30)
	.loc 1 210 100
	subfic 10,9,7
	.loc 1 210 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,212(31)
	stw 9,208(31)
	lfd 12,208(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 210 18
	frsp 9,0
	.loc 1 210 127
	lwz 10,164(30)
	.loc 1 210 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,220(31)
	stw 9,216(31)
	lfd 12,216(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 210 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 210 18
	frsp 8,0
	.loc 1 210 149
	lwz 10,164(30)
	.loc 1 210 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,228(31)
	stw 9,224(31)
	lfd 12,224(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 210 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 210 18
	frsp 0,0
	li 5,49
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 211 19
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 212 32
	lwz 10,168(30)
	.loc 1 212 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,236(31)
	stw 9,232(31)
	lfd 12,232(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 212 22
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 212 18
	frsp 11,0
	.loc 1 212 64
	lwz 10,156(30)
	.loc 1 212 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,244(31)
	stw 9,240(31)
	lfd 12,240(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 212 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 212 18
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 212 105
	lwz 9,152(30)
	.loc 1 212 100
	subfic 10,9,7
	.loc 1 212 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,252(31)
	stw 9,248(31)
	lfd 12,248(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 212 18
	frsp 9,0
	.loc 1 212 127
	lwz 10,164(30)
	.loc 1 212 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,260(31)
	stw 9,256(31)
	lfd 12,256(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 212 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 212 18
	frsp 8,0
	.loc 1 212 149
	lwz 10,164(30)
	.loc 1 212 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,268(31)
	stw 9,264(31)
	lfd 12,264(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 212 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 212 18
	frsp 0,0
	.loc 1 212 174
	lwz 9,160(30)
	.loc 1 212 18
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	li 5,49
	mr 4,9
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 213 19
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 214 32
	lwz 10,168(30)
	.loc 1 214 27
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,276(31)
	stw 9,272(31)
	lfd 12,272(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 214 22
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 214 18
	frsp 11,0
	.loc 1 214 64
	lwz 10,156(30)
	.loc 1 214 58
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,284(31)
	stw 9,280(31)
	lfd 12,280(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 214 53
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 214 18
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 214 105
	lwz 9,152(30)
	.loc 1 214 100
	subfic 10,9,7
	.loc 1 214 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,292(31)
	stw 9,288(31)
	lfd 12,288(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 214 18
	frsp 9,0
	.loc 1 214 127
	lwz 10,164(30)
	.loc 1 214 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,300(31)
	stw 9,296(31)
	lfd 12,296(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 214 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 214 18
	frsp 8,0
	.loc 1 214 149
	lwz 10,164(30)
	.loc 1 214 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,308(31)
	stw 9,304(31)
	lfd 12,304(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 214 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 214 18
	frsp 0,0
	li 5,49
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	b .L51
.L50:
	.loc 1 217 3
	lwz 9,16(31)
	cmpwi 0,9,0
	bne 0,.L52
	.loc 1 218 20
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 219 33
	lwz 10,168(30)
	.loc 1 219 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,316(31)
	stw 9,312(31)
	lfd 12,312(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 219 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 219 19
	frsp 11,0
	.loc 1 219 65
	lwz 10,156(30)
	.loc 1 219 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,324(31)
	stw 9,320(31)
	lfd 12,320(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 219 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 219 19
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 219 105
	lwz 9,152(30)
	.loc 1 219 100
	subfic 10,9,7
	.loc 1 219 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,332(31)
	stw 9,328(31)
	lfd 12,328(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 219 19
	frsp 9,0
	.loc 1 219 127
	lwz 10,164(30)
	.loc 1 219 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,340(31)
	stw 9,336(31)
	lfd 12,336(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 219 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 219 19
	frsp 8,0
	.loc 1 219 149
	lwz 10,164(30)
	.loc 1 219 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,348(31)
	stw 9,344(31)
	lfd 12,344(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 219 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 219 19
	frsp 0,0
	.loc 1 219 184
	lwz 9,148(30)
	.loc 1 219 19
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 220 20
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 221 33
	lwz 10,168(30)
	.loc 1 221 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,356(31)
	stw 9,352(31)
	lfd 12,352(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 221 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 221 19
	frsp 11,0
	.loc 1 221 65
	lwz 10,156(30)
	.loc 1 221 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,364(31)
	stw 9,360(31)
	lfd 12,360(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 221 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 221 19
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 221 105
	lwz 9,152(30)
	.loc 1 221 100
	subfic 10,9,7
	.loc 1 221 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,372(31)
	stw 9,368(31)
	lfd 12,368(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 221 19
	frsp 9,0
	.loc 1 221 127
	lwz 10,164(30)
	.loc 1 221 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,380(31)
	stw 9,376(31)
	lfd 12,376(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 221 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 221 19
	frsp 8,0
	.loc 1 221 149
	lwz 10,164(30)
	.loc 1 221 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,388(31)
	stw 9,384(31)
	lfd 12,384(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 221 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 221 19
	frsp 0,0
	.loc 1 221 174
	lwz 9,160(30)
	.loc 1 221 19
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 221 194
	lwz 9,148(30)
	.loc 1 221 19
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	mr 5,9
	mr 4,8
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 222 20
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 223 33
	lwz 10,168(30)
	.loc 1 223 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,396(31)
	stw 9,392(31)
	lfd 12,392(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 223 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 223 19
	frsp 11,0
	.loc 1 223 65
	lwz 10,156(30)
	.loc 1 223 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,404(31)
	stw 9,400(31)
	lfd 12,400(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 223 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 223 19
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 223 105
	lwz 9,152(30)
	.loc 1 223 100
	subfic 10,9,7
	.loc 1 223 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,412(31)
	stw 9,408(31)
	lfd 12,408(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 223 19
	frsp 9,0
	.loc 1 223 127
	lwz 10,164(30)
	.loc 1 223 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,420(31)
	stw 9,416(31)
	lfd 12,416(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 223 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 223 19
	frsp 8,0
	.loc 1 223 149
	lwz 10,164(30)
	.loc 1 223 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,428(31)
	stw 9,424(31)
	lfd 12,424(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 223 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 223 19
	frsp 0,0
	.loc 1 223 184
	lwz 9,148(30)
	.loc 1 223 19
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 224 20
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 225 33
	lwz 10,168(30)
	.loc 1 225 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,436(31)
	stw 9,432(31)
	lfd 12,432(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 225 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 225 19
	frsp 11,0
	.loc 1 225 65
	lwz 10,156(30)
	.loc 1 225 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,444(31)
	stw 9,440(31)
	lfd 12,440(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 225 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 225 19
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 225 106
	lwz 9,152(30)
	.loc 1 225 101
	subfic 10,9,7
	.loc 1 225 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,452(31)
	stw 9,448(31)
	lfd 12,448(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 225 19
	frsp 9,0
	.loc 1 225 128
	lwz 10,164(30)
	.loc 1 225 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,460(31)
	stw 9,456(31)
	lfd 12,456(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 225 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 225 19
	frsp 8,0
	.loc 1 225 150
	lwz 10,164(30)
	.loc 1 225 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,468(31)
	stw 9,464(31)
	lfd 12,464(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 225 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 225 19
	frsp 0,0
	.loc 1 225 188
	lwz 9,148(30)
	.loc 1 225 195
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 225 19
	subfic 9,9,95
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 226 20
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 227 33
	lwz 10,168(30)
	.loc 1 227 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,476(31)
	stw 9,472(31)
	lfd 12,472(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 227 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 227 19
	frsp 11,0
	.loc 1 227 65
	lwz 10,156(30)
	.loc 1 227 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,484(31)
	stw 9,480(31)
	lfd 12,480(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 227 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 227 19
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 227 106
	lwz 9,152(30)
	.loc 1 227 101
	subfic 10,9,7
	.loc 1 227 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,492(31)
	stw 9,488(31)
	lfd 12,488(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 227 19
	frsp 9,0
	.loc 1 227 128
	lwz 10,164(30)
	.loc 1 227 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,500(31)
	stw 9,496(31)
	lfd 12,496(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 227 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 227 19
	frsp 8,0
	.loc 1 227 150
	lwz 10,164(30)
	.loc 1 227 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,508(31)
	stw 9,504(31)
	lfd 12,504(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 227 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 227 19
	frsp 0,0
	.loc 1 227 175
	lwz 9,160(30)
	.loc 1 227 19
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 227 198
	lwz 9,148(30)
	.loc 1 227 205
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 227 19
	subfic 9,9,95
	mr 5,9
	mr 4,8
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 228 20
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 229 33
	lwz 10,168(30)
	.loc 1 229 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,516(31)
	stw 9,512(31)
	lfd 12,512(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 229 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 229 19
	frsp 11,0
	.loc 1 229 65
	lwz 10,156(30)
	.loc 1 229 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,524(31)
	stw 9,520(31)
	lfd 12,520(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 229 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 229 19
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 229 106
	lwz 9,152(30)
	.loc 1 229 101
	subfic 10,9,7
	.loc 1 229 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,532(31)
	stw 9,528(31)
	lfd 12,528(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 229 19
	frsp 9,0
	.loc 1 229 128
	lwz 10,164(30)
	.loc 1 229 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,540(31)
	stw 9,536(31)
	lfd 12,536(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 229 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 229 19
	frsp 8,0
	.loc 1 229 150
	lwz 10,164(30)
	.loc 1 229 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,548(31)
	stw 9,544(31)
	lfd 12,544(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 229 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 229 19
	frsp 0,0
	.loc 1 229 188
	lwz 9,148(30)
	.loc 1 229 195
	lis 10,eyes@ha
	la 10,eyes@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 229 19
	subfic 9,9,95
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	b .L51
.L52:
	.loc 1 232 20
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 233 33
	lwz 10,168(30)
	.loc 1 233 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,556(31)
	stw 9,552(31)
	lfd 12,552(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 233 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 233 19
	frsp 11,0
	.loc 1 233 65
	lwz 10,156(30)
	.loc 1 233 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,564(31)
	stw 9,560(31)
	lfd 12,560(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 233 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 233 19
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 233 105
	lwz 9,152(30)
	.loc 1 233 100
	subfic 10,9,7
	.loc 1 233 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,572(31)
	stw 9,568(31)
	lfd 12,568(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 233 19
	frsp 9,0
	.loc 1 233 127
	lwz 10,164(30)
	.loc 1 233 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,580(31)
	stw 9,576(31)
	lfd 12,576(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 233 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 233 19
	frsp 8,0
	.loc 1 233 149
	lwz 10,164(30)
	.loc 1 233 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,588(31)
	stw 9,584(31)
	lfd 12,584(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 233 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 233 19
	frsp 0,0
	lwz 9,16(31)
	addi 9,9,-1
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 234 20
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 235 33
	lwz 10,168(30)
	.loc 1 235 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,596(31)
	stw 9,592(31)
	lfd 12,592(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 235 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 235 19
	frsp 11,0
	.loc 1 235 65
	lwz 10,156(30)
	.loc 1 235 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,604(31)
	stw 9,600(31)
	lfd 12,600(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 235 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 235 19
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 235 105
	lwz 9,152(30)
	.loc 1 235 100
	subfic 10,9,7
	.loc 1 235 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,612(31)
	stw 9,608(31)
	lfd 12,608(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 235 19
	frsp 9,0
	.loc 1 235 127
	lwz 10,164(30)
	.loc 1 235 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,620(31)
	stw 9,616(31)
	lfd 12,616(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 235 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 235 19
	frsp 8,0
	.loc 1 235 149
	lwz 10,164(30)
	.loc 1 235 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,628(31)
	stw 9,624(31)
	lfd 12,624(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 235 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 235 19
	frsp 0,0
	.loc 1 235 174
	lwz 9,160(30)
	.loc 1 235 19
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lwz 9,16(31)
	addi 9,9,-1
	mr 5,9
	mr 4,10
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 236 20
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,18
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 237 33
	lwz 10,168(30)
	.loc 1 237 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,636(31)
	stw 9,632(31)
	lfd 12,632(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 237 23
	lis 9,.LC18@ha
	lfd 0,.LC18@l(9)
	fadd 0,12,0
	.loc 1 237 19
	frsp 11,0
	.loc 1 237 65
	lwz 10,156(30)
	.loc 1 237 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,644(31)
	stw 9,640(31)
	lfd 12,640(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 237 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 237 19
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 237 105
	lwz 9,152(30)
	.loc 1 237 100
	subfic 10,9,7
	.loc 1 237 96
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,652(31)
	stw 9,648(31)
	lfd 12,648(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 237 19
	frsp 9,0
	.loc 1 237 127
	lwz 10,164(30)
	.loc 1 237 134
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,660(31)
	stw 9,656(31)
	lfd 12,656(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 237 121
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 237 19
	frsp 8,0
	.loc 1 237 149
	lwz 10,164(30)
	.loc 1 237 156
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,668(31)
	stw 9,664(31)
	lfd 12,664(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 237 143
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 237 19
	frsp 0,0
	lwz 9,16(31)
	addi 9,9,-1
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 238 20
	lis 9,_ZL9img_eyes1@ha
	lwz 9,_ZL9img_eyes1@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 239 33
	lwz 10,168(30)
	.loc 1 239 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,676(31)
	stw 9,672(31)
	lfd 12,672(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 239 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 239 19
	frsp 11,0
	.loc 1 239 65
	lwz 10,156(30)
	.loc 1 239 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,684(31)
	stw 9,680(31)
	lfd 12,680(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 239 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 239 19
	frsp 10,0
	lis 9,_ZL9img_eyes1@ha
	lwz 7,_ZL9img_eyes1@l(9)
	.loc 1 239 106
	lwz 9,152(30)
	.loc 1 239 101
	subfic 10,9,7
	.loc 1 239 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,692(31)
	stw 9,688(31)
	lfd 12,688(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 239 19
	frsp 9,0
	.loc 1 239 128
	lwz 10,164(30)
	.loc 1 239 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,700(31)
	stw 9,696(31)
	lfd 12,696(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 239 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 239 19
	frsp 8,0
	.loc 1 239 150
	lwz 10,164(30)
	.loc 1 239 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,708(31)
	stw 9,704(31)
	lfd 12,704(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 239 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 239 19
	frsp 0,0
	lwz 9,16(31)
	subfic 9,9,96
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 240 20
	lis 9,_ZL9img_eyes2@ha
	lwz 9,_ZL9img_eyes2@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 241 33
	lwz 10,168(30)
	.loc 1 241 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,716(31)
	stw 9,712(31)
	lfd 12,712(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 241 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 241 19
	frsp 11,0
	.loc 1 241 65
	lwz 10,156(30)
	.loc 1 241 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,724(31)
	stw 9,720(31)
	lfd 12,720(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 241 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 241 19
	frsp 10,0
	lis 9,_ZL9img_eyes2@ha
	lwz 7,_ZL9img_eyes2@l(9)
	.loc 1 241 106
	lwz 9,152(30)
	.loc 1 241 101
	subfic 10,9,7
	.loc 1 241 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,732(31)
	stw 9,728(31)
	lfd 12,728(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 241 19
	frsp 9,0
	.loc 1 241 128
	lwz 10,164(30)
	.loc 1 241 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,740(31)
	stw 9,736(31)
	lfd 12,736(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 241 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 241 19
	frsp 8,0
	.loc 1 241 150
	lwz 10,164(30)
	.loc 1 241 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,748(31)
	stw 9,744(31)
	lfd 12,744(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 241 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 241 19
	frsp 0,0
	.loc 1 241 175
	lwz 9,160(30)
	.loc 1 241 19
	lis 10,eyecol@ha
	la 10,eyecol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lwz 9,16(31)
	subfic 9,9,96
	mr 5,9
	mr 4,10
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 242 20
	lis 9,_ZL9img_eyes3@ha
	lwz 9,_ZL9img_eyes3@l(9)
	li 5,36
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 243 33
	lwz 10,168(30)
	.loc 1 243 28
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,756(31)
	stw 9,752(31)
	lfd 12,752(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 243 23
	lis 9,.LC22@ha
	lfd 12,.LC22@l(9)
	fsub 0,12,0
	.loc 1 243 19
	frsp 11,0
	.loc 1 243 65
	lwz 10,156(30)
	.loc 1 243 59
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,764(31)
	stw 9,760(31)
	lfd 12,760(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 243 54
	lis 9,.LC19@ha
	lfd 0,.LC19@l(9)
	fadd 0,12,0
	.loc 1 243 19
	frsp 10,0
	lis 9,_ZL9img_eyes3@ha
	lwz 7,_ZL9img_eyes3@l(9)
	.loc 1 243 106
	lwz 9,152(30)
	.loc 1 243 101
	subfic 10,9,7
	.loc 1 243 97
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,772(31)
	stw 9,768(31)
	lfd 12,768(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 243 19
	frsp 9,0
	.loc 1 243 128
	lwz 10,164(30)
	.loc 1 243 135
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,780(31)
	stw 9,776(31)
	lfd 12,776(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 243 122
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 243 19
	frsp 8,0
	.loc 1 243 150
	lwz 10,164(30)
	.loc 1 243 157
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,788(31)
	stw 9,784(31)
	lfd 12,784(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 243 144
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 243 19
	frsp 0,0
	lwz 9,16(31)
	subfic 9,9,96
	mr 5,9
	li 4,-1
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
.L51:
	.loc 1 247 18
	lis 9,_ZL12img_eyebrows@ha
	lwz 9,_ZL12img_eyebrows@l(9)
	li 5,54
	li 4,0
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 248 31
	lwz 10,144(30)
	.loc 1 248 26
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,796(31)
	stw 9,792(31)
	lfd 12,792(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 248 21
	lis 9,.LC24@ha
	lfd 0,.LC24@l(9)
	fadd 0,12,0
	.loc 1 248 17
	frsp 11,0
	.loc 1 248 67
	lwz 9,140(30)
	.loc 1 248 81
	addi 10,9,-3
	.loc 1 248 61
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,804(31)
	stw 9,800(31)
	lfd 12,800(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 248 56
	lis 9,.LC25@ha
	lfd 0,.LC25@l(9)
	fadd 0,12,0
	.loc 1 248 17
	frsp 10,0
	lis 9,_ZL12img_eyebrows@ha
	lwz 7,_ZL12img_eyebrows@l(9)
	.loc 1 248 117
	lwz 9,128(30)
	.loc 1 248 112
	subfic 10,9,11
	.loc 1 248 107
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,812(31)
	stw 9,808(31)
	lfd 12,808(31)
	fsub 12,12,0
	lis 9,.LC20@ha
	lfd 0,.LC20@l(9)
	fmul 0,12,0
	.loc 1 248 17
	frsp 9,0
	.loc 1 248 143
	lwz 10,136(30)
	.loc 1 248 154
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,820(31)
	stw 9,816(31)
	lfd 12,816(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 248 137
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 248 17
	frsp 8,0
	.loc 1 248 169
	lwz 10,136(30)
	.loc 1 248 180
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,828(31)
	stw 9,824(31)
	lfd 12,824(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 248 163
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 248 17
	frsp 0,0
	.loc 1 248 199
	lwz 9,132(30)
	.loc 1 248 17
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 248 227
	lwz 9,124(30)
	.loc 1 248 17
	lis 10,eyebrows@ha
	la 10,eyebrows@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	mr 5,9
	mr 4,8
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 249 18
	lis 9,_ZL12img_eyebrows@ha
	lwz 9,_ZL12img_eyebrows@l(9)
	li 5,54
	li 4,36
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 250 31
	lwz 10,144(30)
	.loc 1 250 26
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,836(31)
	stw 9,832(31)
	lfd 12,832(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 0,12,0
	.loc 1 250 21
	lis 9,.LC26@ha
	lfd 12,.LC26@l(9)
	fsub 0,12,0
	.loc 1 250 17
	frsp 11,0
	.loc 1 250 67
	lwz 9,140(30)
	.loc 1 250 81
	addi 10,9,-3
	.loc 1 250 61
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,844(31)
	stw 9,840(31)
	lfd 12,840(31)
	fsub 12,12,0
	lis 9,.LC13@ha
	lfd 0,.LC13@l(9)
	fmul 12,12,0
	.loc 1 250 56
	lis 9,.LC25@ha
	lfd 0,.LC25@l(9)
	fadd 0,12,0
	.loc 1 250 17
	frsp 10,0
	lis 9,_ZL12img_eyebrows@ha
	lwz 7,_ZL12img_eyebrows@l(9)
	.loc 1 250 118
	lwz 9,128(30)
	.loc 1 250 113
	subfic 10,9,11
	.loc 1 250 108
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,852(31)
	stw 9,848(31)
	lfd 12,848(31)
	fsub 12,12,0
	lis 9,.LC23@ha
	lfd 0,.LC23@l(9)
	fmul 0,12,0
	.loc 1 250 17
	frsp 9,0
	.loc 1 250 144
	lwz 10,136(30)
	.loc 1 250 155
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,860(31)
	stw 9,856(31)
	lfd 12,856(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 250 138
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 250 17
	frsp 8,0
	.loc 1 250 170
	lwz 10,136(30)
	.loc 1 250 181
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,868(31)
	stw 9,864(31)
	lfd 12,864(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 250 164
	lis 9,.LC21@ha
	lfd 0,.LC21@l(9)
	fadd 0,12,0
	.loc 1 250 17
	frsp 0,0
	.loc 1 250 200
	lwz 9,132(30)
	.loc 1 250 17
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 250 231
	lwz 9,124(30)
	.loc 1 250 242
	lis 10,eyebrows@ha
	la 10,eyebrows@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 250 17
	subfic 9,9,53
	mr 5,9
	mr 4,8
	fmr 5,0
	fmr 4,8
	fmr 3,9
	mr 3,7
	fmr 2,10
	fmr 1,11
	bl GRRLIB_DrawTile
	.loc 1 252 18
	lis 9,_ZL8img_lips@ha
	lwz 9,_ZL8img_lips@l(9)
	li 5,30
	li 4,30
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 253 2
	lwz 9,20(31)
	cmpwi 0,9,0
	bne 0,.L53
	.loc 1 254 15
	lwz 9,184(30)
	.loc 1 254 22
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 254 3
	cmpwi 0,9,1
	beq 0,.L54
	.loc 1 254 39 discriminator 1
	lwz 9,184(30)
	.loc 1 254 46 discriminator 1
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 254 27 discriminator 1
	cmpwi 0,9,6
	beq 0,.L54
	.loc 1 254 63 discriminator 2
	lwz 9,184(30)
	.loc 1 254 70 discriminator 2
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 254 51 discriminator 2
	cmpwi 0,9,11
	beq 0,.L54
	.loc 1 254 88 discriminator 3
	lwz 9,184(30)
	.loc 1 254 95 discriminator 3
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 254 76 discriminator 3
	cmpwi 0,9,17
	beq 0,.L54
	.loc 1 254 113 discriminator 4
	lwz 9,184(30)
	.loc 1 254 120 discriminator 4
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 254 101 discriminator 4
	cmpwi 0,9,19
	bne 0,.L55
.L54:
	.loc 1 255 38
	lwz 10,196(30)
	.loc 1 255 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,876(31)
	stw 9,872(31)
	lfd 12,872(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 255 28
	lis 9,.LC27@ha
	lfd 0,.LC27@l(9)
	fadd 0,12,0
	.loc 1 255 19
	frsp 11,0
	lis 9,_ZL8img_lips@ha
	lwz 7,_ZL8img_lips@l(9)
	.loc 1 255 72
	lwz 10,192(30)
	.loc 1 255 79
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,884(31)
	stw 9,880(31)
	lfd 12,880(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 255 66
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 255 19
	frsp 10,0
	.loc 1 255 94
	lwz 10,192(30)
	.loc 1 255 101
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,892(31)
	stw 9,888(31)
	lfd 12,888(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 255 88
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 255 19
	frsp 9,0
	.loc 1 255 119
	lwz 9,188(30)
	.loc 1 255 19
	lis 10,lipcol@ha
	la 10,lipcol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 255 139
	lwz 9,184(30)
	.loc 1 255 19
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC28@ha
	lfs 0,.LC28@l(9)
	mr 5,10
	mr 4,8
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L57
.L55:
	.loc 1 258 38
	lwz 10,196(30)
	.loc 1 258 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,900(31)
	stw 9,896(31)
	lfd 12,896(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 258 28
	lis 9,.LC27@ha
	lfd 0,.LC27@l(9)
	fadd 0,12,0
	.loc 1 258 19
	frsp 11,0
	lis 9,_ZL8img_lips@ha
	lwz 7,_ZL8img_lips@l(9)
	.loc 1 258 72
	lwz 10,192(30)
	.loc 1 258 79
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,908(31)
	stw 9,904(31)
	lfd 12,904(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 258 66
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 258 19
	frsp 10,0
	.loc 1 258 94
	lwz 10,192(30)
	.loc 1 258 101
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,916(31)
	stw 9,912(31)
	lfd 12,912(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 258 88
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 258 19
	frsp 9,0
	.loc 1 258 129
	lwz 9,184(30)
	.loc 1 258 19
	lis 10,lips@ha
	la 10,lips@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC28@ha
	lfs 0,.LC28@l(9)
	mr 5,10
	li 4,-1
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L57
.L53:
	.loc 1 262 3
	lwz 9,20(31)
	cmpwi 0,9,2
	beq 0,.L58
	.loc 1 262 20 discriminator 1
	lwz 9,20(31)
	cmpwi 0,9,7
	beq 0,.L58
	.loc 1 262 37 discriminator 2
	lwz 9,20(31)
	cmpwi 0,9,12
	beq 0,.L58
	.loc 1 262 55 discriminator 3
	lwz 9,20(31)
	cmpwi 0,9,18
	beq 0,.L58
	.loc 1 262 73 discriminator 4
	lwz 9,20(31)
	cmpwi 0,9,20
	bne 0,.L59
.L58:
	.loc 1 263 38
	lwz 10,196(30)
	.loc 1 263 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,924(31)
	stw 9,920(31)
	lfd 12,920(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 263 28
	lis 9,.LC27@ha
	lfd 0,.LC27@l(9)
	fadd 0,12,0
	.loc 1 263 19
	frsp 11,0
	lis 9,_ZL8img_lips@ha
	lwz 7,_ZL8img_lips@l(9)
	.loc 1 263 72
	lwz 10,192(30)
	.loc 1 263 79
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,932(31)
	stw 9,928(31)
	lfd 12,928(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 263 66
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 263 19
	frsp 10,0
	.loc 1 263 94
	lwz 10,192(30)
	.loc 1 263 101
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,940(31)
	stw 9,936(31)
	lfd 12,936(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 263 88
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 263 19
	frsp 9,0
	lwz 9,20(31)
	addi 10,9,-1
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC28@ha
	lfs 0,.LC28@l(9)
	mr 5,10
	lis 9,0xc76c
	ori 4,9,0x46ff
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L57
.L59:
	.loc 1 266 38
	lwz 10,196(30)
	.loc 1 266 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,948(31)
	stw 9,944(31)
	lfd 12,944(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 266 28
	lis 9,.LC27@ha
	lfd 0,.LC27@l(9)
	fadd 0,12,0
	.loc 1 266 19
	frsp 11,0
	lis 9,_ZL8img_lips@ha
	lwz 7,_ZL8img_lips@l(9)
	.loc 1 266 72
	lwz 10,192(30)
	.loc 1 266 79
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,956(31)
	stw 9,952(31)
	lfd 12,952(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 266 66
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 266 19
	frsp 10,0
	.loc 1 266 94
	lwz 10,192(30)
	.loc 1 266 101
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,964(31)
	stw 9,960(31)
	lfd 12,960(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 266 88
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 266 19
	frsp 9,0
	lwz 9,20(31)
	addi 10,9,-1
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC28@ha
	lfs 0,.LC28@l(9)
	mr 5,10
	li 4,-1
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
.L57:
	.loc 1 270 18
	lis 9,_ZL12img_mustache@ha
	lwz 9,_ZL12img_mustache@l(9)
	li 5,10
	li 4,30
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 271 9
	lwz 9,216(30)
	.loc 1 271 2
	cmpwi 0,9,0
	ble 0,.L60
	.loc 1 271 59 discriminator 1
	lwz 10,232(30)
	.loc 1 271 54 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,972(31)
	stw 9,968(31)
	lfd 12,968(31)
	fsub 12,12,0
	lis 9,.LC29@ha
	lfd 0,.LC29@l(9)
	fmul 12,12,0
	.loc 1 271 49 discriminator 1
	lis 9,.LC30@ha
	lfd 0,.LC30@l(9)
	fadd 0,12,0
	.loc 1 271 40 discriminator 1
	frsp 11,0
	lis 9,_ZL12img_mustache@ha
	lwz 7,_ZL12img_mustache@l(9)
	.loc 1 271 102 discriminator 1
	lwz 10,228(30)
	.loc 1 271 114 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,980(31)
	stw 9,976(31)
	lfd 12,976(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 271 96 discriminator 1
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 271 40 discriminator 1
	frsp 10,0
	.loc 1 271 129 discriminator 1
	lwz 10,228(30)
	.loc 1 271 141 discriminator 1
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,988(31)
	stw 9,984(31)
	lfd 12,984(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 271 123 discriminator 1
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 271 40 discriminator 1
	frsp 9,0
	.loc 1 271 160 discriminator 1
	lwz 9,224(30)
	.loc 1 271 40 discriminator 1
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	.loc 1 271 182 discriminator 1
	lwz 9,216(30)
	.loc 1 271 40 discriminator 1
	addi 8,9,-1
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC28@ha
	lfs 0,.LC28@l(9)
	mr 5,8
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
.L60:
	.loc 1 273 18
	lis 9,_ZL9img_noses@ha
	lwz 9,_ZL9img_noses@l(9)
	li 5,30
	li 4,25
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 274 36
	lwz 10,180(30)
	.loc 1 274 31
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,996(31)
	stw 9,992(31)
	lfd 12,992(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 274 26
	lis 9,.LC27@ha
	lfd 0,.LC27@l(9)
	fadd 0,12,0
	.loc 1 274 17
	frsp 11,0
	lis 9,_ZL9img_noses@ha
	lwz 7,_ZL9img_noses@l(9)
	.loc 1 274 72
	lwz 10,176(30)
	.loc 1 274 80
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1004(31)
	stw 9,1000(31)
	lfd 12,1000(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 274 66
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 274 17
	frsp 10,0
	.loc 1 274 95
	lwz 10,176(30)
	.loc 1 274 103
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1012(31)
	stw 9,1008(31)
	lfd 12,1008(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 274 89
	lis 9,.LC16@ha
	lfd 0,.LC16@l(9)
	fadd 0,12,0
	.loc 1 274 17
	frsp 9,0
	.loc 1 274 122
	lwz 9,96(30)
	.loc 1 274 17
	lis 10,skincol@ha
	la 10,skincol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 274 144
	lwz 9,172(30)
	.loc 1 274 17
	lis 10,noses@ha
	la 10,noses@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC31@ha
	lfs 0,.LC31@l(9)
	mr 5,10
	mr 4,8
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	.loc 1 276 16
	lwz 9,112(30)
	.loc 1 276 24
	lis 10,hairfg@ha
	la 10,hairfg@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 276 2
	cmpwi 0,9,55
	bgt 0,.L61
	.loc 1 277 18
	lis 9,_ZL10img_hairs1@ha
	lwz 7,_ZL10img_hairs1@l(9)
	.loc 1 277 54
	lwz 9,120(30)
	.loc 1 277 49
	slwi 9,9,1
	.loc 1 277 46
	subfic 10,9,1
	.loc 1 277 18
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1020(31)
	stw 9,1016(31)
	lfd 12,1016(31)
	fsub 0,12,0
	frsp 10,0
	.loc 1 277 82
	lwz 9,116(30)
	.loc 1 277 18
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 277 105
	lwz 9,112(30)
	.loc 1 277 18
	lis 10,hairfg@ha
	la 10,hairfg@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC32@ha
	lfs 12,.LC32@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,10
	mr 4,8
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,7
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L62
.L61:
	.loc 1 280 18
	lis 9,_ZL10img_hairs2@ha
	lwz 7,_ZL10img_hairs2@l(9)
	.loc 1 280 54
	lwz 9,120(30)
	.loc 1 280 49
	slwi 9,9,1
	.loc 1 280 46
	subfic 10,9,1
	.loc 1 280 18
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1028(31)
	stw 9,1024(31)
	lfd 12,1024(31)
	fsub 0,12,0
	frsp 10,0
	.loc 1 280 82
	lwz 9,116(30)
	.loc 1 280 18
	lis 10,haircol@ha
	la 10,haircol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 8,0(9)
	.loc 1 280 105
	lwz 9,112(30)
	.loc 1 280 113
	lis 10,hairfg@ha
	la 10,hairfg@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 9,0(9)
	.loc 1 280 18
	addi 10,9,-56
	lis 9,.LC8@ha
	lfs 9,.LC8@l(9)
	lis 9,.LC9@ha
	lfs 11,.LC9@l(9)
	lis 9,.LC32@ha
	lfs 12,.LC32@l(9)
	lis 9,.LC11@ha
	lfs 0,.LC11@l(9)
	mr 5,10
	mr 4,8
	fmr 5,9
	fmr 4,10
	fmr 3,11
	mr 3,7
	fmr 2,12
	fmr 1,0
	bl GRRLIB_DrawTile
.L62:
	.loc 1 283 9
	lwz 9,200(30)
	.loc 1 283 2
	cmpwi 0,9,0
	ble 0,.L63
	.loc 1 284 19
	lis 9,_ZL11img_glasses@ha
	lwz 9,_ZL11img_glasses@l(9)
	li 5,32
	li 4,90
	mr 3,9
	bl GRRLIB_SetHandle
	.loc 1 285 10
	lwz 9,200(30)
	.loc 1 285 3
	cmpwi 0,9,5
	bgt 0,.L64
	.loc 1 286 39
	lwz 10,212(30)
	.loc 1 286 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1036(31)
	stw 9,1032(31)
	lfd 12,1032(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 286 28
	lis 9,.LC33@ha
	lfd 0,.LC33@l(9)
	fadd 0,12,0
	.loc 1 286 19
	frsp 11,0
	lis 9,_ZL11img_glasses@ha
	lwz 7,_ZL11img_glasses@l(9)
	.loc 1 286 81
	lwz 10,208(30)
	.loc 1 286 92
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1044(31)
	stw 9,1040(31)
	lfd 12,1040(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 286 75
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 286 19
	frsp 10,0
	.loc 1 286 107
	lwz 10,208(30)
	.loc 1 286 118
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1052(31)
	stw 9,1048(31)
	lfd 12,1048(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 286 101
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 286 19
	frsp 9,0
	.loc 1 286 140
	lwz 9,204(30)
	.loc 1 286 19
	lis 10,glassescol@ha
	la 10,glassescol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	.loc 1 286 159
	lwz 9,200(30)
	.loc 1 286 19
	addi 8,9,-1
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 0,.LC12@l(9)
	mr 5,8
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	b .L63
.L64:
	.loc 1 289 39
	lwz 10,212(30)
	.loc 1 289 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1060(31)
	stw 9,1056(31)
	lfd 12,1056(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 289 28
	lis 9,.LC33@ha
	lfd 0,.LC33@l(9)
	fadd 0,12,0
	.loc 1 289 19
	frsp 11,0
	lis 9,_ZL11img_glasses@ha
	lwz 7,_ZL11img_glasses@l(9)
	.loc 1 289 81
	lwz 10,208(30)
	.loc 1 289 92
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1068(31)
	stw 9,1064(31)
	lfd 12,1064(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 289 75
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 289 19
	frsp 10,0
	.loc 1 289 107
	lwz 10,208(30)
	.loc 1 289 118
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1076(31)
	stw 9,1072(31)
	lfd 12,1072(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 289 101
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 289 19
	frsp 9,0
	.loc 1 289 140
	lwz 9,204(30)
	.loc 1 289 19
	lis 10,glassescol@ha
	la 10,glassescol@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 10,0(9)
	.loc 1 289 159
	lwz 9,200(30)
	.loc 1 289 19
	addi 8,9,2
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 0,.LC12@l(9)
	mr 5,8
	mr 4,10
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
	.loc 1 290 39
	lwz 10,212(30)
	.loc 1 290 33
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1084(31)
	stw 9,1080(31)
	lfd 12,1080(31)
	fsub 12,12,0
	lis 9,.LC17@ha
	lfd 0,.LC17@l(9)
	fmul 12,12,0
	.loc 1 290 28
	lis 9,.LC33@ha
	lfd 0,.LC33@l(9)
	fadd 0,12,0
	.loc 1 290 19
	frsp 11,0
	lis 9,_ZL11img_glasses@ha
	lwz 7,_ZL11img_glasses@l(9)
	.loc 1 290 81
	lwz 10,208(30)
	.loc 1 290 92
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1092(31)
	stw 9,1088(31)
	lfd 12,1088(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 290 75
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 290 19
	frsp 10,0
	.loc 1 290 107
	lwz 10,208(30)
	.loc 1 290 118
	lis 9,0x4330
	lis 8,.LC7@ha
	lfd 0,.LC7@l(8)
	xoris 10,10,0x8000
	stw 10,1100(31)
	stw 9,1096(31)
	lfd 12,1096(31)
	fsub 12,12,0
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fmul 12,12,0
	.loc 1 290 101
	lis 9,.LC15@ha
	lfd 0,.LC15@l(9)
	fadd 0,12,0
	.loc 1 290 19
	frsp 9,0
	.loc 1 290 141
	lwz 9,200(30)
	.loc 1 290 19
	addi 10,9,-1
	lis 9,.LC9@ha
	lfs 12,.LC9@l(9)
	lis 9,.LC12@ha
	lfs 0,.LC12@l(9)
	mr 5,10
	li 4,-1
	fmr 5,9
	fmr 4,10
	fmr 3,12
	mr 3,7
	fmr 2,11
	fmr 1,0
	bl GRRLIB_DrawTile
.L63:
	.loc 1 293 17
	lwz 5,24(31)
	li 4,160
	li 3,200
	bl GRRLIB_CompoEnd
	.loc 1 294 23
	lwz 9,8(31)
	mulli 10,9,11
	lis 9,miinames@ha
	la 9,miinames@l(9)
	add 9,10,9
	.loc 1 294 8
	addi 10,30,28
	mr 4,10
	mr 3,9
	bl strcpy
	.loc 1 295 20
	lis 9,neck@ha
	lwz 10,neck@l(9)
	lis 9,bodyadjust@ha
	la 8,bodyadjust@l(9)
	lwz 9,8(31)
	slwi 9,9,2
	add 9,8,9
	stw 10,0(9)
	.loc 1 296 1
	nop
	addi 11,31,1112
	lwz 0,4(11)
	mtlr 0
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE101:
	.size	_Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg, .-_Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg
	.align 2
	.globl _Z23GRRLIB_CreateStaticMiisv
	.type	_Z23GRRLIB_CreateStaticMiisv, @function
_Z23GRRLIB_CreateStaticMiisv:
.LFB102:
	.loc 1 298 32
	.cfi_startproc
	stwu 1,-336(1)
	.cfi_def_cfa_offset 336
	mflr 0
	stw 0,340(1)
	stw 29,324(1)
	stw 30,328(1)
	stw 31,332(1)
	.cfi_offset 65, 4
	.cfi_offset 29, -12
	.cfi_offset 30, -8
	.cfi_offset 31, -4
	mr 31,1
	.cfi_def_cfa_register 31
	.loc 1 300 7
	li 9,0
	stb 9,8(31)
	.loc 1 300 2
	b .L66
.L67:
	.loc 1 301 17 discriminator 3
	lbz 30,8(31)
	.loc 1 301 47 discriminator 3
	li 4,200
	li 3,180
	bl GRRLIB_CreateEmptyTexture
	mr 8,3
	.loc 1 301 20 discriminator 3
	lis 9,img_staticmii@ha
	la 10,img_staticmii@l(9)
	slwi 9,30,2
	add 9,10,9
	stw 8,0(9)
	.loc 1 302 25 discriminator 3
	lis 9,miis@ha
	lwz 10,miis@l(9)
	.loc 1 302 24 discriminator 3
	lbz 9,8(31)
	.loc 1 302 25 discriminator 3
	mulli 9,9,276
	add 8,10,9
	.loc 1 302 18 discriminator 3
	lbz 30,8(31)
	.loc 1 302 54 discriminator 3
	lbz 9,8(31)
	.loc 1 302 18 discriminator 3
	lis 10,img_staticmii@ha
	la 10,img_staticmii@l(10)
	slwi 9,9,2
	add 9,10,9
	lwz 29,0(9)
	addi 9,31,32
	li 10,276
	mr 5,10
	mr 4,8
	mr 3,9
	bl memcpy
	addi 9,31,32
	mr 8,29
	li 7,0
	li 6,0
	li 5,0
	mr 4,30
	mr 3,9
	bl _Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg
	.loc 1 300 2 discriminator 3
	lbz 9,8(31)
	addi 9,9,1
	stb 9,8(31)
.L66:
	.loc 1 300 11 discriminator 1
	lbz 10,8(31)
	.loc 1 300 12 discriminator 1
	lis 9,NoOfMiis@ha
	lwz 9,NoOfMiis@l(9)
	cmpw 0,10,9
	blt 0,.L67
	.loc 1 304 1
	nop
	nop
	addi 11,31,336
	lwz 0,4(11)
	mtlr 0
	lwz 29,-12(11)
	lwz 30,-8(11)
	lwz 31,-4(11)
	.cfi_def_cfa 11, 0
	mr 1,11
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_register 1
	blr
	.cfi_endproc
.LFE102:
	.size	_Z23GRRLIB_CreateStaticMiisv, .-_Z23GRRLIB_CreateStaticMiisv
	.section	.rodata
	.align 3
.LC7:
	.long	1127219200
	.long	-2147483648
	.align 2
.LC8:
	.long	1065353216
	.align 2
.LC9:
	.long	0
	.align 2
.LC10:
	.long	1129447424
	.align 2
.LC11:
	.long	1130758144
	.align 2
.LC12:
	.long	1128792064
	.align 3
.LC13:
	.long	1074161254
	.long	1717986918
	.align 3
.LC14:
	.long	1080721408
	.long	0
	.align 3
.LC15:
	.long	1069128089
	.long	-1717986918
	.align 3
.LC16:
	.long	1070176665
	.long	-1717986918
	.align 3
.LC17:
	.long	1074056396
	.long	-858993459
	.align 3
.LC18:
	.long	1081147392
	.long	0
	.align 3
.LC19:
	.long	1080492032
	.long	0
	.align 3
.LC20:
	.long	1076264960
	.long	0
	.align 3
.LC21:
	.long	1070805811
	.long	858993459
	.align 3
.LC22:
	.long	1081065472
	.long	0
	.align 3
.LC23:
	.long	-1071218688
	.long	0
	.align 3
.LC24:
	.long	1081212928
	.long	0
	.align 3
.LC25:
	.long	1080344576
	.long	0
	.align 3
.LC26:
	.long	1081081856
	.long	0
	.align 3
.LC27:
	.long	1080786944
	.long	0
	.align 2
.LC28:
	.long	1132593152
	.align 3
.LC29:
	.long	1074213683
	.long	858993459
	.align 3
.LC30:
	.long	1080983552
	.long	0
	.align 2
.LC31:
	.long	1132756992
	.align 2
.LC32:
	.long	1128136704
	.align 3
.LC33:
	.long	1080582144
	.long	0
	.section	".text"
.Letext0:
	.file 3 "c:\\devkitpro\\devkitppc\\lib\\gcc\\powerpc-eabi\\12.1.0\\include\\stddef.h"
	.file 4 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\machine\\_default_types.h"
	.file 5 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\stdlib.h"
	.file 6 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\c++\\12.1.0\\cstdlib"
	.file 7 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\c++\\12.1.0\\bits\\std_abs.h"
	.file 8 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\c++\\12.1.0\\stdlib.h"
	.file 9 "C:/devkitPro/libogc/include/mii.h"
	.file 10 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\sys\\_stdint.h"
	.file 11 "C:/devkitPro/libogc/include/gctypes.h"
	.file 12 "C:/devkitPro/libogc/include/grrlib.h"
	.file 13 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_heads_png.h"
	.file 14 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_hairs1_png.h"
	.file 15 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_hairs2_png.h"
	.file 16 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_eyebrows_png.h"
	.file 17 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_eyes1_png.h"
	.file 18 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_eyes2_png.h"
	.file 19 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_eyes3_png.h"
	.file 20 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_noses_png.h"
	.file 21 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_features_png.h"
	.file 22 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_lips_png.h"
	.file 23 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_mole_png.h"
	.file 24 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_beards_png.h"
	.file 25 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_mustache_png.h"
	.file 26 "C:/devkitPro/examples/wii/Miis/rendermiiexample/build/mii_glasses_png.h"
	.file 27 "C:/devkitPro/libogc/include/grrlib/GRRLIB__lib.h"
	.file 28 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\string.h"
	.file 29 "c:\\devkitpro\\devkitppc\\powerpc-eabi\\include\\c++\\12.1.0\\powerpc-eabi\\bits\\c++config.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x13e7
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1c
	.4byte	.LASF221
	.byte	0x21
	.4byte	.LASF222
	.4byte	.LASF223
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0xd
	.4byte	.LASF4
	.byte	0x3
	.byte	0xd6
	.byte	0x16
	.4byte	0x37
	.uleb128 0xf
	.4byte	0x26
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x1d
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xf
	.4byte	0x3e
	.uleb128 0x9
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.4byte	.LASF2
	.uleb128 0x1e
	.4byte	.LASF224
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x4
	.byte	0x2b
	.byte	0x17
	.4byte	0x70
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0xd
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4f
	.byte	0x16
	.4byte	0x37
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x1f
	.byte	0x4
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0xc
	.4byte	0xad
	.uleb128 0x20
	.uleb128 0xc
	.4byte	0xb3
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0xf
	.4byte	0xb3
	.uleb128 0xc
	.4byte	0xba
	.uleb128 0x19
	.byte	0x8
	.byte	0x24
	.4byte	.LASF16
	.4byte	0xea
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x25
	.byte	0x7
	.4byte	0x3e
	.byte	0
	.uleb128 0x10
	.string	"rem"
	.byte	0x5
	.byte	0x26
	.byte	0x7
	.4byte	0x3e
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x5
	.byte	0x27
	.byte	0x3
	.4byte	0xc4
	.uleb128 0x19
	.byte	0x8
	.byte	0x2a
	.4byte	.LASF17
	.4byte	0x11c
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x2b
	.byte	0x8
	.4byte	0x98
	.byte	0
	.uleb128 0x10
	.string	"rem"
	.byte	0x5
	.byte	0x2c
	.byte	0x8
	.4byte	0x98
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.4byte	.LASF18
	.byte	0x5
	.byte	0x2d
	.byte	0x3
	.4byte	0xf6
	.uleb128 0x19
	.byte	0x10
	.byte	0x31
	.4byte	.LASF19
	.4byte	0x14e
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x32
	.byte	0x11
	.4byte	0x4a
	.byte	0
	.uleb128 0x10
	.string	"rem"
	.byte	0x5
	.byte	0x33
	.byte	0x11
	.4byte	0x4a
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x5
	.byte	0x34
	.byte	0x3
	.4byte	0x128
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x5
	.byte	0x39
	.byte	0xf
	.4byte	0x166
	.uleb128 0xc
	.4byte	0x16b
	.uleb128 0x21
	.4byte	0x3e
	.4byte	0x17f
	.uleb128 0x1
	.4byte	0x17f
	.uleb128 0x1
	.4byte	0x17f
	.byte	0
	.uleb128 0xc
	.4byte	0x184
	.uleb128 0x22
	.uleb128 0x23
	.string	"std"
	.byte	0x1d
	.2byte	0x128
	.byte	0xb
	.4byte	0x314
	.uleb128 0x3
	.byte	0x6
	.byte	0x7f
	.byte	0xb
	.4byte	0xea
	.uleb128 0x3
	.byte	0x6
	.byte	0x80
	.byte	0xb
	.4byte	0x11c
	.uleb128 0x3
	.byte	0x6
	.byte	0x86
	.byte	0xb
	.4byte	0x314
	.uleb128 0x3
	.byte	0x6
	.byte	0x8c
	.byte	0xb
	.4byte	0x32a
	.uleb128 0x3
	.byte	0x6
	.byte	0x8d
	.byte	0xb
	.4byte	0x347
	.uleb128 0x3
	.byte	0x6
	.byte	0x8e
	.byte	0xb
	.4byte	0x35d
	.uleb128 0x3
	.byte	0x6
	.byte	0x8f
	.byte	0xb
	.4byte	0x373
	.uleb128 0x3
	.byte	0x6
	.byte	0x91
	.byte	0xb
	.4byte	0x39d
	.uleb128 0x3
	.byte	0x6
	.byte	0x94
	.byte	0xb
	.4byte	0x3b8
	.uleb128 0x3
	.byte	0x6
	.byte	0x96
	.byte	0xb
	.4byte	0x3ce
	.uleb128 0x3
	.byte	0x6
	.byte	0x99
	.byte	0xb
	.4byte	0x3e9
	.uleb128 0x3
	.byte	0x6
	.byte	0x9a
	.byte	0xb
	.4byte	0x404
	.uleb128 0x3
	.byte	0x6
	.byte	0x9b
	.byte	0xb
	.4byte	0x435
	.uleb128 0x3
	.byte	0x6
	.byte	0x9d
	.byte	0xb
	.4byte	0x455
	.uleb128 0x3
	.byte	0x6
	.byte	0xa3
	.byte	0xb
	.4byte	0x475
	.uleb128 0x3
	.byte	0x6
	.byte	0xa5
	.byte	0xb
	.4byte	0x481
	.uleb128 0x3
	.byte	0x6
	.byte	0xa6
	.byte	0xb
	.4byte	0x492
	.uleb128 0x3
	.byte	0x6
	.byte	0xa7
	.byte	0xb
	.4byte	0x4b2
	.uleb128 0x3
	.byte	0x6
	.byte	0xa8
	.byte	0xb
	.4byte	0x4d2
	.uleb128 0x3
	.byte	0x6
	.byte	0xa9
	.byte	0xb
	.4byte	0x4f2
	.uleb128 0x3
	.byte	0x6
	.byte	0xab
	.byte	0xb
	.4byte	0x508
	.uleb128 0x3
	.byte	0x6
	.byte	0xac
	.byte	0xb
	.4byte	0x52d
	.uleb128 0x3
	.byte	0x6
	.byte	0xf0
	.byte	0x16
	.4byte	0x14e
	.uleb128 0x3
	.byte	0x6
	.byte	0xf5
	.byte	0x16
	.4byte	0x58d
	.uleb128 0x3
	.byte	0x6
	.byte	0xf6
	.byte	0x16
	.4byte	0x5a7
	.uleb128 0x3
	.byte	0x6
	.byte	0xf8
	.byte	0x16
	.4byte	0x5c2
	.uleb128 0x3
	.byte	0x6
	.byte	0xf9
	.byte	0x16
	.4byte	0x618
	.uleb128 0x3
	.byte	0x6
	.byte	0xfa
	.byte	0x16
	.4byte	0x5d8
	.uleb128 0x3
	.byte	0x6
	.byte	0xfb
	.byte	0x16
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x6
	.byte	0xfc
	.byte	0x16
	.4byte	0x63a
	.uleb128 0x12
	.string	"abs"
	.byte	0x4f
	.4byte	.LASF22
	.4byte	0x51
	.4byte	0x29a
	.uleb128 0x1
	.4byte	0x51
	.byte	0
	.uleb128 0x12
	.string	"abs"
	.byte	0x4b
	.4byte	.LASF23
	.4byte	0x633
	.4byte	0x2b2
	.uleb128 0x1
	.4byte	0x633
	.byte	0
	.uleb128 0x12
	.string	"abs"
	.byte	0x47
	.4byte	.LASF24
	.4byte	0x340
	.4byte	0x2ca
	.uleb128 0x1
	.4byte	0x340
	.byte	0
	.uleb128 0x12
	.string	"abs"
	.byte	0x3d
	.4byte	.LASF25
	.4byte	0x4a
	.4byte	0x2e2
	.uleb128 0x1
	.4byte	0x4a
	.byte	0
	.uleb128 0x12
	.string	"abs"
	.byte	0x38
	.4byte	.LASF26
	.4byte	0x98
	.4byte	0x2fa
	.uleb128 0x1
	.4byte	0x98
	.byte	0
	.uleb128 0x1a
	.string	"div"
	.byte	0xb1
	.4byte	.LASF48
	.4byte	0x11c
	.uleb128 0x1
	.4byte	0x98
	.uleb128 0x1
	.4byte	0x98
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x5
	.byte	0x4c
	.byte	0x5
	.4byte	0x3e
	.4byte	0x32a
	.uleb128 0x1
	.4byte	0xa8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x5
	.byte	0x4d
	.byte	0x8
	.4byte	0x340
	.4byte	0x340
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.byte	0x4
	.4byte	.LASF29
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x5
	.byte	0x51
	.byte	0x5
	.4byte	0x3e
	.4byte	0x35d
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x5
	.byte	0x53
	.byte	0x6
	.4byte	0x98
	.4byte	0x373
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x5
	.byte	0x55
	.byte	0x8
	.4byte	0x9f
	.4byte	0x39d
	.uleb128 0x1
	.4byte	0x17f
	.uleb128 0x1
	.4byte	0x17f
	.uleb128 0x1
	.4byte	0x26
	.uleb128 0x1
	.4byte	0x26
	.uleb128 0x1
	.4byte	0x15a
	.byte	0
	.uleb128 0x24
	.string	"div"
	.byte	0x5
	.byte	0x5c
	.byte	0x7
	.4byte	0xea
	.4byte	0x3b8
	.uleb128 0x1
	.4byte	0x3e
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x5
	.byte	0x5f
	.byte	0x8
	.4byte	0xae
	.4byte	0x3ce
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x5
	.byte	0x6b
	.byte	0x8
	.4byte	0x11c
	.4byte	0x3e9
	.uleb128 0x1
	.4byte	0x98
	.uleb128 0x1
	.4byte	0x98
	.byte	0
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x5
	.byte	0x6d
	.byte	0x5
	.4byte	0x3e
	.4byte	0x404
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x26
	.byte	0
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x5
	.byte	0x73
	.byte	0x8
	.4byte	0x26
	.4byte	0x424
	.uleb128 0x1
	.4byte	0x424
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x26
	.byte	0
	.uleb128 0xc
	.4byte	0x429
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.4byte	.LASF37
	.uleb128 0xf
	.4byte	0x429
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x5
	.byte	0x6f
	.byte	0x5
	.4byte	0x3e
	.4byte	0x455
	.uleb128 0x1
	.4byte	0x424
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x26
	.byte	0
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x5
	.byte	0x8f
	.4byte	0x475
	.uleb128 0x1
	.4byte	0x9f
	.uleb128 0x1
	.4byte	0x26
	.uleb128 0x1
	.4byte	0x26
	.uleb128 0x1
	.4byte	0x15a
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF201
	.byte	0x5
	.byte	0x90
	.byte	0x5
	.4byte	0x3e
	.uleb128 0x11
	.4byte	.LASF40
	.byte	0x5
	.byte	0x9f
	.4byte	0x492
	.uleb128 0x1
	.4byte	0x37
	.byte	0
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.byte	0xa0
	.byte	0x8
	.4byte	0x340
	.4byte	0x4ad
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.byte	0
	.uleb128 0xc
	.4byte	0xae
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x5
	.byte	0xab
	.byte	0x6
	.4byte	0x98
	.4byte	0x4d2
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x5
	.byte	0xad
	.byte	0xf
	.4byte	0xa1
	.4byte	0x4f2
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x5
	.byte	0xbf
	.byte	0x5
	.4byte	0x3e
	.4byte	0x508
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x5
	.byte	0x75
	.byte	0x8
	.4byte	0x26
	.4byte	0x528
	.uleb128 0x1
	.4byte	0xae
	.uleb128 0x1
	.4byte	0x528
	.uleb128 0x1
	.4byte	0x26
	.byte	0
	.uleb128 0xc
	.4byte	0x430
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x5
	.byte	0x71
	.byte	0x5
	.4byte	0x3e
	.4byte	0x548
	.uleb128 0x1
	.4byte	0xae
	.uleb128 0x1
	.4byte	0x429
	.byte	0
	.uleb128 0x25
	.4byte	.LASF47
	.byte	0x1d
	.2byte	0x14d
	.byte	0xb
	.4byte	0x5a7
	.uleb128 0x3
	.byte	0x6
	.byte	0xc8
	.byte	0xb
	.4byte	0x14e
	.uleb128 0x3
	.byte	0x6
	.byte	0xd8
	.byte	0xb
	.4byte	0x5a7
	.uleb128 0x3
	.byte	0x6
	.byte	0xe3
	.byte	0xb
	.4byte	0x5c2
	.uleb128 0x3
	.byte	0x6
	.byte	0xe4
	.byte	0xb
	.4byte	0x5d8
	.uleb128 0x3
	.byte	0x6
	.byte	0xe5
	.byte	0xb
	.4byte	0x5f8
	.uleb128 0x3
	.byte	0x6
	.byte	0xe7
	.byte	0xb
	.4byte	0x618
	.uleb128 0x3
	.byte	0x6
	.byte	0xe8
	.byte	0xb
	.4byte	0x63a
	.uleb128 0x1a
	.string	"div"
	.byte	0xd5
	.4byte	.LASF49
	.4byte	0x14e
	.uleb128 0x1
	.4byte	0x4a
	.uleb128 0x1
	.4byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF50
	.2byte	0x10c
	.byte	0x9
	.4byte	0x14e
	.4byte	0x5c2
	.uleb128 0x1
	.4byte	0x4a
	.uleb128 0x1
	.4byte	0x4a
	.byte	0
	.uleb128 0x13
	.4byte	.LASF51
	.2byte	0x107
	.byte	0xb
	.4byte	0x4a
	.4byte	0x5d8
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x13
	.4byte	.LASF52
	.2byte	0x10d
	.byte	0xb
	.4byte	0x4a
	.4byte	0x5f8
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x13
	.4byte	.LASF53
	.2byte	0x111
	.byte	0x14
	.4byte	0x91
	.4byte	0x618
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x5
	.byte	0xa3
	.byte	0x7
	.4byte	0x633
	.4byte	0x633
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x4
	.4byte	.LASF55
	.uleb128 0x13
	.4byte	.LASF56
	.2byte	0x144
	.byte	0x14
	.4byte	0x51
	.4byte	0x655
	.uleb128 0x1
	.4byte	0xbf
	.uleb128 0x1
	.4byte	0x4ad
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x27
	.byte	0xc
	.4byte	0x314
	.uleb128 0x3
	.byte	0x8
	.byte	0x33
	.byte	0xc
	.4byte	0xea
	.uleb128 0x3
	.byte	0x8
	.byte	0x34
	.byte	0xc
	.4byte	0x11c
	.uleb128 0x3
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0x282
	.uleb128 0x3
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0x29a
	.uleb128 0x3
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0x2b2
	.uleb128 0x3
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0x2ca
	.uleb128 0x3
	.byte	0x8
	.byte	0x36
	.byte	0xc
	.4byte	0x2e2
	.uleb128 0x3
	.byte	0x8
	.byte	0x37
	.byte	0xc
	.4byte	0x32a
	.uleb128 0x3
	.byte	0x8
	.byte	0x38
	.byte	0xc
	.4byte	0x347
	.uleb128 0x3
	.byte	0x8
	.byte	0x39
	.byte	0xc
	.4byte	0x35d
	.uleb128 0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xc
	.4byte	0x373
	.uleb128 0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.4byte	0x58d
	.uleb128 0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.4byte	0x2fa
	.uleb128 0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.4byte	0x39d
	.uleb128 0x3
	.byte	0x8
	.byte	0x3e
	.byte	0xc
	.4byte	0x3b8
	.uleb128 0x3
	.byte	0x8
	.byte	0x40
	.byte	0xc
	.4byte	0x3ce
	.uleb128 0x3
	.byte	0x8
	.byte	0x43
	.byte	0xc
	.4byte	0x3e9
	.uleb128 0x3
	.byte	0x8
	.byte	0x44
	.byte	0xc
	.4byte	0x404
	.uleb128 0x3
	.byte	0x8
	.byte	0x45
	.byte	0xc
	.4byte	0x435
	.uleb128 0x3
	.byte	0x8
	.byte	0x47
	.byte	0xc
	.4byte	0x455
	.uleb128 0x3
	.byte	0x8
	.byte	0x48
	.byte	0xc
	.4byte	0x475
	.uleb128 0x3
	.byte	0x8
	.byte	0x4a
	.byte	0xc
	.4byte	0x481
	.uleb128 0x3
	.byte	0x8
	.byte	0x4b
	.byte	0xc
	.4byte	0x492
	.uleb128 0x3
	.byte	0x8
	.byte	0x4c
	.byte	0xc
	.4byte	0x4b2
	.uleb128 0x3
	.byte	0x8
	.byte	0x4d
	.byte	0xc
	.4byte	0x4d2
	.uleb128 0x3
	.byte	0x8
	.byte	0x4e
	.byte	0xc
	.4byte	0x4f2
	.uleb128 0x3
	.byte	0x8
	.byte	0x50
	.byte	0xc
	.4byte	0x508
	.uleb128 0x3
	.byte	0x8
	.byte	0x51
	.byte	0xc
	.4byte	0x52d
	.uleb128 0xa
	.4byte	.LASF132
	.byte	0x9
	.byte	0x5
	.byte	0xc
	.4byte	0x3e
	.uleb128 0x26
	.2byte	0x114
	.byte	0x9
	.byte	0x11
	.byte	0x10
	.4byte	.LASF225
	.4byte	0xa57
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x9
	.byte	0x13
	.byte	0x6
	.4byte	0x3e
	.byte	0
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x9
	.byte	0x15
	.byte	0x6
	.4byte	0x3e
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x9
	.byte	0x16
	.byte	0x6
	.4byte	0x3e
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF60
	.byte	0x9
	.byte	0x17
	.byte	0x6
	.4byte	0x3e
	.byte	0xc
	.uleb128 0x10
	.string	"day"
	.byte	0x9
	.byte	0x18
	.byte	0x6
	.4byte	0x3e
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF61
	.byte	0x9
	.byte	0x19
	.byte	0x6
	.4byte	0x3e
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF62
	.byte	0x9
	.byte	0x1a
	.byte	0x6
	.4byte	0x3e
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF63
	.byte	0x9
	.byte	0x1d
	.byte	0x7
	.4byte	0xa57
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF64
	.byte	0x9
	.byte	0x20
	.byte	0x6
	.4byte	0x3e
	.byte	0x34
	.uleb128 0x2
	.4byte	.LASF65
	.byte	0x9
	.byte	0x23
	.byte	0x6
	.4byte	0x3e
	.byte	0x38
	.uleb128 0x2
	.4byte	.LASF66
	.byte	0x9
	.byte	0x26
	.byte	0x6
	.4byte	0x3e
	.byte	0x3c
	.uleb128 0x2
	.4byte	.LASF67
	.byte	0x9
	.byte	0x27
	.byte	0x6
	.4byte	0x3e
	.byte	0x40
	.uleb128 0x2
	.4byte	.LASF68
	.byte	0x9
	.byte	0x28
	.byte	0x6
	.4byte	0x3e
	.byte	0x44
	.uleb128 0x2
	.4byte	.LASF69
	.byte	0x9
	.byte	0x29
	.byte	0x6
	.4byte	0x3e
	.byte	0x48
	.uleb128 0x2
	.4byte	.LASF70
	.byte	0x9
	.byte	0x2c
	.byte	0x6
	.4byte	0x3e
	.byte	0x4c
	.uleb128 0x2
	.4byte	.LASF71
	.byte	0x9
	.byte	0x2d
	.byte	0x6
	.4byte	0x3e
	.byte	0x50
	.uleb128 0x2
	.4byte	.LASF72
	.byte	0x9
	.byte	0x2e
	.byte	0x6
	.4byte	0x3e
	.byte	0x54
	.uleb128 0x2
	.4byte	.LASF73
	.byte	0x9
	.byte	0x2f
	.byte	0x6
	.4byte	0x3e
	.byte	0x58
	.uleb128 0x2
	.4byte	.LASF74
	.byte	0x9
	.byte	0x32
	.byte	0x6
	.4byte	0x3e
	.byte	0x5c
	.uleb128 0x2
	.4byte	.LASF75
	.byte	0x9
	.byte	0x33
	.byte	0x6
	.4byte	0x3e
	.byte	0x60
	.uleb128 0x2
	.4byte	.LASF76
	.byte	0x9
	.byte	0x34
	.byte	0x6
	.4byte	0x3e
	.byte	0x64
	.uleb128 0x2
	.4byte	.LASF77
	.byte	0x9
	.byte	0x36
	.byte	0x6
	.4byte	0x3e
	.byte	0x68
	.uleb128 0x2
	.4byte	.LASF78
	.byte	0x9
	.byte	0x38
	.byte	0x6
	.4byte	0x3e
	.byte	0x6c
	.uleb128 0x2
	.4byte	.LASF79
	.byte	0x9
	.byte	0x3b
	.byte	0x6
	.4byte	0x3e
	.byte	0x70
	.uleb128 0x2
	.4byte	.LASF80
	.byte	0x9
	.byte	0x3c
	.byte	0x6
	.4byte	0x3e
	.byte	0x74
	.uleb128 0x2
	.4byte	.LASF81
	.byte	0x9
	.byte	0x3d
	.byte	0x6
	.4byte	0x3e
	.byte	0x78
	.uleb128 0x2
	.4byte	.LASF82
	.byte	0x9
	.byte	0x41
	.byte	0x6
	.4byte	0x3e
	.byte	0x7c
	.uleb128 0x2
	.4byte	.LASF83
	.byte	0x9
	.byte	0x43
	.byte	0x6
	.4byte	0x3e
	.byte	0x80
	.uleb128 0x2
	.4byte	.LASF84
	.byte	0x9
	.byte	0x45
	.byte	0x6
	.4byte	0x3e
	.byte	0x84
	.uleb128 0x2
	.4byte	.LASF85
	.byte	0x9
	.byte	0x46
	.byte	0x6
	.4byte	0x3e
	.byte	0x88
	.uleb128 0x2
	.4byte	.LASF86
	.byte	0x9
	.byte	0x47
	.byte	0x6
	.4byte	0x3e
	.byte	0x8c
	.uleb128 0x2
	.4byte	.LASF87
	.byte	0x9
	.byte	0x48
	.byte	0x6
	.4byte	0x3e
	.byte	0x90
	.uleb128 0x2
	.4byte	.LASF88
	.byte	0x9
	.byte	0x4b
	.byte	0x6
	.4byte	0x3e
	.byte	0x94
	.uleb128 0x2
	.4byte	.LASF89
	.byte	0x9
	.byte	0x4d
	.byte	0x6
	.4byte	0x3e
	.byte	0x98
	.uleb128 0x2
	.4byte	.LASF90
	.byte	0x9
	.byte	0x4e
	.byte	0x6
	.4byte	0x3e
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF91
	.byte	0x9
	.byte	0x4f
	.byte	0x6
	.4byte	0x3e
	.byte	0xa0
	.uleb128 0x2
	.4byte	.LASF92
	.byte	0x9
	.byte	0x51
	.byte	0x6
	.4byte	0x3e
	.byte	0xa4
	.uleb128 0x2
	.4byte	.LASF93
	.byte	0x9
	.byte	0x52
	.byte	0x6
	.4byte	0x3e
	.byte	0xa8
	.uleb128 0x2
	.4byte	.LASF94
	.byte	0x9
	.byte	0x56
	.byte	0x6
	.4byte	0x3e
	.byte	0xac
	.uleb128 0x2
	.4byte	.LASF95
	.byte	0x9
	.byte	0x57
	.byte	0x6
	.4byte	0x3e
	.byte	0xb0
	.uleb128 0x2
	.4byte	.LASF96
	.byte	0x9
	.byte	0x58
	.byte	0x6
	.4byte	0x3e
	.byte	0xb4
	.uleb128 0x2
	.4byte	.LASF97
	.byte	0x9
	.byte	0x5c
	.byte	0x6
	.4byte	0x3e
	.byte	0xb8
	.uleb128 0x2
	.4byte	.LASF98
	.byte	0x9
	.byte	0x5d
	.byte	0x6
	.4byte	0x3e
	.byte	0xbc
	.uleb128 0x2
	.4byte	.LASF99
	.byte	0x9
	.byte	0x5e
	.byte	0x6
	.4byte	0x3e
	.byte	0xc0
	.uleb128 0x2
	.4byte	.LASF100
	.byte	0x9
	.byte	0x5f
	.byte	0x6
	.4byte	0x3e
	.byte	0xc4
	.uleb128 0x2
	.4byte	.LASF101
	.byte	0x9
	.byte	0x62
	.byte	0x6
	.4byte	0x3e
	.byte	0xc8
	.uleb128 0x2
	.4byte	.LASF102
	.byte	0x9
	.byte	0x63
	.byte	0x6
	.4byte	0x3e
	.byte	0xcc
	.uleb128 0x2
	.4byte	.LASF103
	.byte	0x9
	.byte	0x65
	.byte	0x6
	.4byte	0x3e
	.byte	0xd0
	.uleb128 0x2
	.4byte	.LASF104
	.byte	0x9
	.byte	0x66
	.byte	0x6
	.4byte	0x3e
	.byte	0xd4
	.uleb128 0x2
	.4byte	.LASF105
	.byte	0x9
	.byte	0x69
	.byte	0x6
	.4byte	0x3e
	.byte	0xd8
	.uleb128 0x2
	.4byte	.LASF106
	.byte	0x9
	.byte	0x6a
	.byte	0x6
	.4byte	0x3e
	.byte	0xdc
	.uleb128 0x2
	.4byte	.LASF107
	.byte	0x9
	.byte	0x6b
	.byte	0x6
	.4byte	0x3e
	.byte	0xe0
	.uleb128 0x2
	.4byte	.LASF108
	.byte	0x9
	.byte	0x6c
	.byte	0x6
	.4byte	0x3e
	.byte	0xe4
	.uleb128 0x2
	.4byte	.LASF109
	.byte	0x9
	.byte	0x6d
	.byte	0x6
	.4byte	0x3e
	.byte	0xe8
	.uleb128 0x2
	.4byte	.LASF110
	.byte	0x9
	.byte	0x70
	.byte	0x6
	.4byte	0x3e
	.byte	0xec
	.uleb128 0x2
	.4byte	.LASF111
	.byte	0x9
	.byte	0x71
	.byte	0x6
	.4byte	0x3e
	.byte	0xf0
	.uleb128 0x2
	.4byte	.LASF112
	.byte	0x9
	.byte	0x72
	.byte	0x6
	.4byte	0x3e
	.byte	0xf4
	.uleb128 0x2
	.4byte	.LASF113
	.byte	0x9
	.byte	0x73
	.byte	0x6
	.4byte	0x3e
	.byte	0xf8
	.uleb128 0x2
	.4byte	.LASF114
	.byte	0x9
	.byte	0x77
	.byte	0x7
	.4byte	0xa57
	.byte	0xfc
	.byte	0
	.uleb128 0x7
	.4byte	0xb3
	.4byte	0xa67
	.uleb128 0x8
	.4byte	0x37
	.byte	0x14
	.byte	0
	.uleb128 0x15
	.string	"Mii"
	.byte	0x9
	.byte	0x78
	.byte	0x3
	.4byte	0x749
	.uleb128 0xd
	.4byte	.LASF115
	.byte	0xa
	.byte	0x18
	.byte	0x13
	.4byte	0x64
	.uleb128 0xf
	.4byte	0xa73
	.uleb128 0xd
	.4byte	.LASF116
	.byte	0xa
	.byte	0x30
	.byte	0x14
	.4byte	0x85
	.uleb128 0x15
	.string	"u8"
	.byte	0xb
	.byte	0x11
	.byte	0x11
	.4byte	0xa73
	.uleb128 0xf
	.4byte	0xa90
	.uleb128 0x15
	.string	"u32"
	.byte	0xb
	.byte	0x13
	.byte	0x12
	.4byte	0xa84
	.uleb128 0x15
	.string	"f32"
	.byte	0xb
	.byte	0x2b
	.byte	0xf
	.4byte	0x633
	.uleb128 0x9
	.byte	0x1
	.byte	0x2
	.4byte	.LASF117
	.uleb128 0x27
	.4byte	.LASF131
	.byte	0x3c
	.byte	0xc
	.byte	0x6b
	.byte	0x10
	.4byte	0xb8c
	.uleb128 0x10
	.string	"w"
	.byte	0xc
	.byte	0x6c
	.byte	0x9
	.4byte	0xaa0
	.byte	0
	.uleb128 0x10
	.string	"h"
	.byte	0xc
	.byte	0x6d
	.byte	0x9
	.4byte	0xaa0
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF118
	.byte	0xc
	.byte	0x6e
	.byte	0x9
	.4byte	0x3e
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF119
	.byte	0xc
	.byte	0x6f
	.byte	0x9
	.4byte	0x3e
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF120
	.byte	0xc
	.byte	0x70
	.byte	0x9
	.4byte	0x3e
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF121
	.byte	0xc
	.byte	0x71
	.byte	0x9
	.4byte	0x3e
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF122
	.byte	0xc
	.byte	0x73
	.byte	0xa
	.4byte	0xab8
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF123
	.byte	0xc
	.byte	0x74
	.byte	0x9
	.4byte	0xaa0
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF124
	.byte	0xc
	.byte	0x75
	.byte	0x9
	.4byte	0xaa0
	.byte	0x20
	.uleb128 0x2
	.4byte	.LASF125
	.byte	0xc
	.byte	0x76
	.byte	0x9
	.4byte	0xaa0
	.byte	0x24
	.uleb128 0x2
	.4byte	.LASF126
	.byte	0xc
	.byte	0x77
	.byte	0x9
	.4byte	0xaa0
	.byte	0x28
	.uleb128 0x2
	.4byte	.LASF127
	.byte	0xc
	.byte	0x78
	.byte	0x9
	.4byte	0xaa0
	.byte	0x2c
	.uleb128 0x2
	.4byte	.LASF128
	.byte	0xc
	.byte	0x79
	.byte	0x9
	.4byte	0xaac
	.byte	0x30
	.uleb128 0x2
	.4byte	.LASF129
	.byte	0xc
	.byte	0x7a
	.byte	0x9
	.4byte	0xaac
	.byte	0x34
	.uleb128 0x2
	.4byte	.LASF130
	.byte	0xc
	.byte	0x7c
	.byte	0xb
	.4byte	0x9f
	.byte	0x38
	.byte	0
	.uleb128 0xd
	.4byte	.LASF131
	.byte	0xc
	.byte	0x7d
	.byte	0x3
	.4byte	0xabf
	.uleb128 0xf
	.4byte	0xb8c
	.uleb128 0x7
	.4byte	0xa7f
	.4byte	0xba8
	.uleb128 0x28
	.byte	0
	.uleb128 0xa
	.4byte	.LASF133
	.byte	0xd
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF134
	.byte	0xd
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL18mii_heads_png_size
	.uleb128 0xa
	.4byte	.LASF135
	.byte	0xe
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF136
	.byte	0xe
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL19mii_hairs1_png_size
	.uleb128 0xa
	.4byte	.LASF137
	.byte	0xf
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF138
	.byte	0xf
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL19mii_hairs2_png_size
	.uleb128 0xa
	.4byte	.LASF139
	.byte	0x10
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF140
	.byte	0x10
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL21mii_eyebrows_png_size
	.uleb128 0xa
	.4byte	.LASF141
	.byte	0x11
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF142
	.byte	0x11
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL18mii_eyes1_png_size
	.uleb128 0xa
	.4byte	.LASF143
	.byte	0x12
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF144
	.byte	0x12
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL18mii_eyes2_png_size
	.uleb128 0xa
	.4byte	.LASF145
	.byte	0x13
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF146
	.byte	0x13
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL18mii_eyes3_png_size
	.uleb128 0xa
	.4byte	.LASF147
	.byte	0x14
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF148
	.byte	0x14
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL18mii_noses_png_size
	.uleb128 0xa
	.4byte	.LASF149
	.byte	0x15
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF150
	.byte	0x15
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL21mii_features_png_size
	.uleb128 0xa
	.4byte	.LASF151
	.byte	0x16
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF152
	.byte	0x16
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL17mii_lips_png_size
	.uleb128 0xa
	.4byte	.LASF153
	.byte	0x17
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF154
	.byte	0x17
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL17mii_mole_png_size
	.uleb128 0xa
	.4byte	.LASF155
	.byte	0x18
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF156
	.byte	0x18
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL19mii_beards_png_size
	.uleb128 0xa
	.4byte	.LASF157
	.byte	0x19
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF158
	.byte	0x19
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL21mii_mustache_png_size
	.uleb128 0xa
	.4byte	.LASF159
	.byte	0x1a
	.byte	0x6
	.byte	0x16
	.4byte	0xb9d
	.uleb128 0xb
	.4byte	.LASF160
	.byte	0x1a
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL20mii_glasses_png_size
	.uleb128 0x5
	.4byte	.LASF161
	.byte	0x14
	.byte	0x6
	.4byte	0xd41
	.uleb128 0x5
	.byte	0x3
	.4byte	miis
	.uleb128 0xc
	.4byte	0xa67
	.uleb128 0x4
	.4byte	.LASF162
	.byte	0x16
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL9img_heads
	.uleb128 0xc
	.4byte	0xb8c
	.uleb128 0x4
	.4byte	.LASF163
	.byte	0x17
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL10img_hairs1
	.uleb128 0x4
	.4byte	.LASF164
	.byte	0x18
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL10img_hairs2
	.uleb128 0x4
	.4byte	.LASF165
	.byte	0x19
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL12img_eyebrows
	.uleb128 0x4
	.4byte	.LASF166
	.byte	0x1a
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL9img_eyes1
	.uleb128 0x4
	.4byte	.LASF167
	.byte	0x1b
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL9img_eyes2
	.uleb128 0x4
	.4byte	.LASF168
	.byte	0x1c
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL9img_eyes3
	.uleb128 0x4
	.4byte	.LASF169
	.byte	0x1d
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL9img_noses
	.uleb128 0x4
	.4byte	.LASF170
	.byte	0x1e
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL12img_features
	.uleb128 0x4
	.4byte	.LASF171
	.byte	0x1f
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL8img_lips
	.uleb128 0x4
	.4byte	.LASF172
	.byte	0x20
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL8img_mole
	.uleb128 0x4
	.4byte	.LASF173
	.byte	0x21
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL10img_beards
	.uleb128 0x4
	.4byte	.LASF174
	.byte	0x22
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL12img_mustache
	.uleb128 0x4
	.4byte	.LASF175
	.byte	0x23
	.byte	0x17
	.4byte	0xd57
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZL11img_glasses
	.uleb128 0x7
	.4byte	0xd57
	.4byte	0xe49
	.uleb128 0x8
	.4byte	0x37
	.byte	0x63
	.byte	0
	.uleb128 0x5
	.4byte	.LASF176
	.byte	0x24
	.byte	0x10
	.4byte	0xe39
	.uleb128 0x5
	.byte	0x3
	.4byte	img_staticmii
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0xe6a
	.uleb128 0x8
	.4byte	0x37
	.byte	0x47
	.byte	0
	.uleb128 0x5
	.4byte	.LASF177
	.byte	0x27
	.byte	0x5
	.4byte	0xe5a
	.uleb128 0x5
	.byte	0x3
	.4byte	hairbg
	.uleb128 0x5
	.4byte	.LASF178
	.byte	0x28
	.byte	0x5
	.4byte	0xe5a
	.uleb128 0x5
	.byte	0x3
	.4byte	hairfg
	.uleb128 0x7
	.4byte	0x37
	.4byte	0xe9c
	.uleb128 0x8
	.4byte	0x37
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	.LASF179
	.byte	0x29
	.byte	0xe
	.4byte	0xe8c
	.uleb128 0x5
	.byte	0x3
	.4byte	haircol
	.uleb128 0x7
	.4byte	0x37
	.4byte	0xebd
	.uleb128 0x8
	.4byte	0x37
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	.LASF180
	.byte	0x2a
	.byte	0xe
	.4byte	0xead
	.uleb128 0x5
	.byte	0x3
	.4byte	skincol
	.uleb128 0x5
	.4byte	.LASF181
	.byte	0x2b
	.byte	0xe
	.4byte	0xead
	.uleb128 0x5
	.byte	0x3
	.4byte	eyecol
	.uleb128 0x7
	.4byte	0x37
	.4byte	0xeef
	.uleb128 0x8
	.4byte	0x37
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.4byte	.LASF182
	.byte	0x2c
	.byte	0xe
	.4byte	0xedf
	.uleb128 0x5
	.byte	0x3
	.4byte	lipcol
	.uleb128 0x5
	.4byte	.LASF183
	.byte	0x2d
	.byte	0xe
	.4byte	0xead
	.uleb128 0x5
	.byte	0x3
	.4byte	glassescol
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0xf21
	.uleb128 0x8
	.4byte	0x37
	.byte	0x17
	.byte	0
	.uleb128 0x5
	.4byte	.LASF184
	.byte	0x2e
	.byte	0x5
	.4byte	0xf11
	.uleb128 0x5
	.byte	0x3
	.4byte	eyebrows
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0xf42
	.uleb128 0x8
	.4byte	0x37
	.byte	0x2f
	.byte	0
	.uleb128 0x5
	.4byte	.LASF185
	.byte	0x2f
	.byte	0x5
	.4byte	0xf32
	.uleb128 0x5
	.byte	0x3
	.4byte	eyes
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0xf63
	.uleb128 0x8
	.4byte	0x37
	.byte	0xb
	.byte	0
	.uleb128 0x5
	.4byte	.LASF186
	.byte	0x30
	.byte	0x5
	.4byte	0xf53
	.uleb128 0x5
	.byte	0x3
	.4byte	noses
	.uleb128 0x5
	.4byte	.LASF187
	.byte	0x31
	.byte	0x5
	.4byte	0xf11
	.uleb128 0x5
	.byte	0x3
	.4byte	lips
	.uleb128 0x5
	.4byte	.LASF188
	.byte	0x35
	.byte	0x5
	.4byte	0x3e
	.uleb128 0x5
	.byte	0x3
	.4byte	feature
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0xfa6
	.uleb128 0x8
	.4byte	0x37
	.byte	0x63
	.byte	0
	.uleb128 0x5
	.4byte	.LASF189
	.byte	0x36
	.byte	0x5
	.4byte	0xf96
	.uleb128 0x5
	.byte	0x3
	.4byte	blink
	.uleb128 0x5
	.4byte	.LASF190
	.byte	0x37
	.byte	0x5
	.4byte	0xf96
	.uleb128 0x5
	.byte	0x3
	.4byte	blinkrand
	.uleb128 0x5
	.4byte	.LASF191
	.byte	0x38
	.byte	0x5
	.4byte	0xf96
	.uleb128 0x5
	.byte	0x3
	.4byte	blinkcount
	.uleb128 0x5
	.4byte	.LASF192
	.byte	0x39
	.byte	0x5
	.4byte	0xf96
	.uleb128 0x5
	.byte	0x3
	.4byte	startblink
	.uleb128 0x5
	.4byte	.LASF193
	.byte	0x3b
	.byte	0x5
	.4byte	0x3e
	.uleb128 0x5
	.byte	0x3
	.4byte	neck
	.uleb128 0x5
	.4byte	.LASF194
	.byte	0x3c
	.byte	0x5
	.4byte	0xf96
	.uleb128 0x5
	.byte	0x3
	.4byte	bodyadjust
	.uleb128 0x7
	.4byte	0xb3
	.4byte	0x1022
	.uleb128 0x8
	.4byte	0x37
	.byte	0x63
	.uleb128 0x8
	.4byte	0x37
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.4byte	.LASF195
	.byte	0x3e
	.byte	0x6
	.4byte	0x100c
	.uleb128 0x5
	.byte	0x3
	.4byte	miinames
	.uleb128 0x6
	.4byte	.LASF196
	.byte	0x1b
	.byte	0x8a
	.byte	0x10
	.4byte	0xd57
	.4byte	0x104e
	.uleb128 0x1
	.4byte	0xaa0
	.uleb128 0x1
	.4byte	0xaa0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF197
	.byte	0x1c
	.byte	0x26
	.byte	0x7
	.4byte	0xae
	.4byte	0x1069
	.uleb128 0x1
	.4byte	0xae
	.uleb128 0x1
	.4byte	0xbf
	.byte	0
	.uleb128 0x11
	.4byte	.LASF198
	.byte	0x1b
	.byte	0x86
	.4byte	0x1084
	.uleb128 0x1
	.4byte	0x3e
	.uleb128 0x1
	.4byte	0x3e
	.uleb128 0x1
	.4byte	0xd57
	.byte	0
	.uleb128 0x11
	.4byte	.LASF199
	.byte	0x1b
	.byte	0x6e
	.4byte	0x10b3
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0x10b3
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaa0
	.byte	0
	.uleb128 0xc
	.4byte	0xb98
	.uleb128 0x11
	.4byte	.LASF200
	.byte	0x1b
	.byte	0x75
	.4byte	0x10ec
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0x10b3
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaac
	.uleb128 0x1
	.4byte	0xaa0
	.uleb128 0x1
	.4byte	0x3e
	.byte	0
	.uleb128 0x29
	.4byte	.LASF226
	.byte	0x1b
	.byte	0x85
	.byte	0x6
	.uleb128 0x1b
	.4byte	.LASF202
	.byte	0x9
	.byte	0x7b
	.byte	0x7
	.4byte	0xd41
	.uleb128 0x11
	.4byte	.LASF203
	.byte	0x1b
	.byte	0x31
	.4byte	0x1120
	.uleb128 0x1
	.4byte	0xd57
	.uleb128 0x1
	.4byte	0xaa0
	.uleb128 0x1
	.4byte	0xaa0
	.uleb128 0x1
	.4byte	0xaa0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF204
	.byte	0x1b
	.byte	0x8b
	.byte	0x10
	.4byte	0xd57
	.4byte	0x1136
	.uleb128 0x1
	.4byte	0x1136
	.byte	0
	.uleb128 0xc
	.4byte	0xa9b
	.uleb128 0x2a
	.4byte	.LASF205
	.byte	0x1
	.2byte	0x12a
	.byte	0x6
	.4byte	.LASF227
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1166
	.uleb128 0x2b
	.string	"i"
	.byte	0x1
	.2byte	0x12b
	.byte	0x5
	.4byte	0xa90
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF206
	.byte	0x1
	.byte	0x94
	.byte	0x6
	.4byte	.LASF228
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11dc
	.uleb128 0x14
	.string	"mii"
	.byte	0x1
	.byte	0x94
	.byte	0x1a
	.4byte	0xa67
	.uleb128 0x2
	.byte	0x8e
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF207
	.byte	0x94
	.byte	0x23
	.4byte	0x3e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0xe
	.4byte	.LASF208
	.byte	0x94
	.byte	0x2e
	.4byte	0x3e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1100
	.uleb128 0xe
	.4byte	.LASF209
	.byte	0x94
	.byte	0x3d
	.4byte	0x3e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0xe
	.4byte	.LASF210
	.byte	0x94
	.byte	0x4a
	.4byte	0x3e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1092
	.uleb128 0x14
	.string	"tex"
	.byte	0x1
	.byte	0x94
	.byte	0x63
	.4byte	0xd57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF229
	.byte	0x1
	.byte	0x71
	.byte	0x6
	.4byte	.LASF230
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF213
	.byte	0x65
	.4byte	.LASF215
	.4byte	0x3e
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1251
	.uleb128 0xe
	.4byte	.LASF211
	.byte	0x65
	.byte	0x14
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.4byte	0x1238
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x67
	.byte	0x7
	.4byte	0x1251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x18
	.4byte	.LBB21
	.4byte	.LBE21-.LBB21
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x6b
	.byte	0x7
	.4byte	0x1261
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0x1261
	.uleb128 0x8
	.4byte	0x37
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0x1271
	.uleb128 0x8
	.4byte	0x37
	.byte	0x1
	.byte	0
	.uleb128 0x16
	.4byte	.LASF214
	.byte	0x59
	.4byte	.LASF216
	.4byte	0x3e
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12d0
	.uleb128 0xe
	.4byte	.LASF211
	.byte	0x59
	.byte	0x18
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.4byte	0x12b7
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x5b
	.byte	0x7
	.4byte	0x1261
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x18
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x5f
	.byte	0x7
	.4byte	0x12d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0x12e0
	.uleb128 0x8
	.4byte	0x37
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.4byte	.LASF217
	.byte	0x4d
	.4byte	.LASF218
	.4byte	0x3e
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x133f
	.uleb128 0xe
	.4byte	.LASF211
	.byte	0x4d
	.byte	0x14
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x1326
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x4f
	.byte	0x7
	.4byte	0x1251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x18
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x53
	.byte	0x7
	.4byte	0x1251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF219
	.byte	0x41
	.4byte	.LASF220
	.4byte	0x3e
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139e
	.uleb128 0xe
	.4byte	.LASF211
	.byte	0x41
	.byte	0x16
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x1385
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x43
	.byte	0x7
	.4byte	0x139e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x4
	.4byte	.LASF212
	.byte	0x47
	.byte	0x7
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x3e
	.4byte	0x13ae
	.uleb128 0x8
	.4byte	0x37
	.byte	0x7
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF231
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.string	"tex"
	.byte	0x2
	.byte	0x24
	.byte	0x27
	.4byte	0xd57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.string	"x"
	.byte	0x2
	.byte	0x24
	.byte	0x36
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.string	"y"
	.byte	0x2
	.byte	0x24
	.byte	0x43
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 25
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x6c
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF51:
	.string	"atoll"
.LASF132:
	.string	"NoOfMiis"
.LASF76:
	.string	"facialFeature"
.LASF114:
	.string	"creator"
.LASF111:
	.string	"moleSize"
.LASF4:
	.string	"size_t"
.LASF191:
	.string	"blinkcount"
.LASF48:
	.string	"_ZSt3divll"
.LASF44:
	.string	"system"
.LASF102:
	.string	"glassesColor"
.LASF229:
	.string	"GRRLIB_MiisInit"
.LASF5:
	.string	"__uint8_t"
.LASF81:
	.string	"hairPart"
.LASF107:
	.string	"facialHairColor"
.LASF124:
	.string	"tileh"
.LASF138:
	.string	"mii_hairs2_png_size"
.LASF45:
	.string	"wcstombs"
.LASF19:
	.string	"7lldiv_t"
.LASF214:
	.string	"MakeMiiShocked"
.LASF152:
	.string	"mii_lips_png_size"
.LASF228:
	.string	"_Z15GRRLIB_BuildMii3MiiiiiiP13GRRLIB_texImg"
.LASF186:
	.string	"noses"
.LASF135:
	.string	"mii_hairs1_png"
.LASF163:
	.string	"img_hairs1"
.LASF123:
	.string	"tilew"
.LASF164:
	.string	"img_hairs2"
.LASF204:
	.string	"GRRLIB_LoadTexture"
.LASF103:
	.string	"glassesSize"
.LASF182:
	.string	"lipcol"
.LASF202:
	.string	"loadMiis_Wii"
.LASF27:
	.string	"atexit"
.LASF15:
	.string	"div_t"
.LASF197:
	.string	"strcpy"
.LASF3:
	.string	"signed char"
.LASF95:
	.string	"noseSize"
.LASF35:
	.string	"mblen"
.LASF192:
	.string	"startblink"
.LASF140:
	.string	"mii_eyebrows_png_size"
.LASF12:
	.string	"long unsigned int"
.LASF105:
	.string	"mustacheType"
.LASF79:
	.string	"hairType"
.LASF10:
	.string	"long long unsigned int"
.LASF94:
	.string	"noseType"
.LASF212:
	.string	"miipart"
.LASF143:
	.string	"mii_eyes2_png"
.LASF14:
	.string	"quot"
.LASF171:
	.string	"img_lips"
.LASF126:
	.string	"nbtileh"
.LASF54:
	.string	"strtof"
.LASF11:
	.string	"long int"
.LASF156:
	.string	"mii_beards_png_size"
.LASF157:
	.string	"mii_mustache_png"
.LASF42:
	.string	"strtol"
.LASF47:
	.string	"__gnu_cxx"
.LASF125:
	.string	"nbtilew"
.LASF213:
	.string	"MakeMiiMad"
.LASF1:
	.string	"long long int"
.LASF29:
	.string	"double"
.LASF133:
	.string	"mii_heads_png"
.LASF39:
	.string	"qsort"
.LASF155:
	.string	"mii_beards_png"
.LASF165:
	.string	"img_eyebrows"
.LASF180:
	.string	"skincol"
.LASF208:
	.string	"miiblinks"
.LASF175:
	.string	"img_glasses"
.LASF210:
	.string	"miimouth"
.LASF38:
	.string	"mbtowc"
.LASF211:
	.string	"bodypart"
.LASF223:
	.string	"C:\\\\devkitPro\\\\examples\\\\wii\\\\Miis\\\\rendermiiexample\\\\build"
.LASF196:
	.string	"GRRLIB_CreateEmptyTexture"
.LASF78:
	.string	"downloaded"
.LASF49:
	.string	"_ZN9__gnu_cxx3divExx"
.LASF112:
	.string	"moleVertPos"
.LASF139:
	.string	"mii_eyebrows_png"
.LASF57:
	.string	"exists"
.LASF60:
	.string	"month"
.LASF74:
	.string	"faceShape"
.LASF0:
	.string	"unsigned int"
.LASF209:
	.string	"miieyes"
.LASF199:
	.string	"GRRLIB_DrawImg"
.LASF198:
	.string	"GRRLIB_CompoEnd"
.LASF193:
	.string	"neck"
.LASF230:
	.string	"_Z15GRRLIB_MiisInitv"
.LASF188:
	.string	"feature"
.LASF201:
	.string	"rand"
.LASF216:
	.string	"_Z14MakeMiiShockedi"
.LASF84:
	.string	"eyebrowColor"
.LASF194:
	.string	"bodyadjust"
.LASF231:
	.string	"GRRLIB_SetHandle"
.LASF63:
	.string	"name"
.LASF16:
	.string	"5div_t"
.LASF184:
	.string	"eyebrows"
.LASF41:
	.string	"strtod"
.LASF162:
	.string	"img_heads"
.LASF88:
	.string	"eyeType"
.LASF50:
	.string	"lldiv"
.LASF205:
	.string	"GRRLIB_CreateStaticMiis"
.LASF37:
	.string	"wchar_t"
.LASF207:
	.string	"miiid"
.LASF172:
	.string	"img_mole"
.LASF117:
	.string	"bool"
.LASF166:
	.string	"img_eyes1"
.LASF167:
	.string	"img_eyes2"
.LASF168:
	.string	"img_eyes3"
.LASF7:
	.string	"short int"
.LASF160:
	.string	"mii_glasses_png_size"
.LASF224:
	.string	"decltype(nullptr)"
.LASF18:
	.string	"ldiv_t"
.LASF92:
	.string	"eyeSize"
.LASF86:
	.string	"eyebrowVertPos"
.LASF190:
	.string	"blinkrand"
.LASF108:
	.string	"mustacheSize"
.LASF104:
	.string	"glassesVertPos"
.LASF33:
	.string	"getenv"
.LASF176:
	.string	"img_staticmii"
.LASF118:
	.string	"handlex"
.LASF119:
	.string	"handley"
.LASF141:
	.string	"mii_eyes1_png"
.LASF159:
	.string	"mii_glasses_png"
.LASF113:
	.string	"moleHorizPos"
.LASF97:
	.string	"lipType"
.LASF149:
	.string	"mii_features_png"
.LASF200:
	.string	"GRRLIB_DrawTile"
.LASF2:
	.string	"long double"
.LASF173:
	.string	"img_beards"
.LASF32:
	.string	"bsearch"
.LASF183:
	.string	"glassescol"
.LASF215:
	.string	"_Z10MakeMiiMadi"
.LASF218:
	.string	"_Z10MakeMiiSadi"
.LASF220:
	.string	"_Z12MakeMiiHappyi"
.LASF161:
	.string	"miis"
.LASF80:
	.string	"hairColor"
.LASF122:
	.string	"tiledtex"
.LASF206:
	.string	"GRRLIB_BuildMii"
.LASF93:
	.string	"eyeHorizSpacing"
.LASF222:
	.string	"C:/devkitPro/examples/wii/Miis/rendermiiexample/source/miidraw.cpp"
.LASF91:
	.string	"eyeColor"
.LASF34:
	.string	"ldiv"
.LASF59:
	.string	"female"
.LASF187:
	.string	"lips"
.LASF20:
	.string	"lldiv_t"
.LASF55:
	.string	"float"
.LASF151:
	.string	"mii_lips_png"
.LASF90:
	.string	"eyeVertPos"
.LASF98:
	.string	"lipColor"
.LASF87:
	.string	"eyebrowHorizSpacing"
.LASF40:
	.string	"srand"
.LASF28:
	.string	"atof"
.LASF53:
	.string	"strtoull"
.LASF170:
	.string	"img_features"
.LASF30:
	.string	"atoi"
.LASF58:
	.string	"invalid"
.LASF31:
	.string	"atol"
.LASF6:
	.string	"unsigned char"
.LASF17:
	.string	"6ldiv_t"
.LASF147:
	.string	"mii_noses_png"
.LASF70:
	.string	"systemID0"
.LASF71:
	.string	"systemID1"
.LASF72:
	.string	"systemID2"
.LASF73:
	.string	"systemID3"
.LASF75:
	.string	"skinColor"
.LASF174:
	.string	"img_mustache"
.LASF56:
	.string	"strtold"
.LASF148:
	.string	"mii_noses_png_size"
.LASF52:
	.string	"strtoll"
.LASF46:
	.string	"wctomb"
.LASF177:
	.string	"hairbg"
.LASF24:
	.string	"_ZSt3absd"
.LASF22:
	.string	"_ZSt3abse"
.LASF23:
	.string	"_ZSt3absf"
.LASF179:
	.string	"haircol"
.LASF137:
	.string	"mii_hairs2_png"
.LASF221:
	.string	"GNU C++17 12.1.0 -mcall-sysv -mrvl -mcpu=750 -meabi -mhard-float -g"
.LASF26:
	.string	"_ZSt3absl"
.LASF116:
	.string	"uint32_t"
.LASF131:
	.string	"GRRLIB_texImg"
.LASF145:
	.string	"mii_eyes3_png"
.LASF25:
	.string	"_ZSt3absx"
.LASF219:
	.string	"MakeMiiHappy"
.LASF13:
	.string	"char"
.LASF178:
	.string	"hairfg"
.LASF109:
	.string	"mustacheVertPos"
.LASF203:
	.string	"GRRLIB_InitTileSet"
.LASF100:
	.string	"lipVertPos"
.LASF61:
	.string	"favColor"
.LASF106:
	.string	"beardType"
.LASF9:
	.string	"__uint32_t"
.LASF153:
	.string	"mii_mole_png"
.LASF96:
	.string	"noseVertPos"
.LASF101:
	.string	"glassesType"
.LASF150:
	.string	"mii_features_png_size"
.LASF110:
	.string	"mole"
.LASF77:
	.string	"mingleOff"
.LASF99:
	.string	"lipSize"
.LASF8:
	.string	"short unsigned int"
.LASF225:
	.string	"3Mii"
.LASF217:
	.string	"MakeMiiSad"
.LASF158:
	.string	"mii_mustache_png_size"
.LASF62:
	.string	"favorite"
.LASF189:
	.string	"blink"
.LASF120:
	.string	"offsetx"
.LASF121:
	.string	"offsety"
.LASF83:
	.string	"eyebrowRotation"
.LASF43:
	.string	"strtoul"
.LASF136:
	.string	"mii_hairs1_png_size"
.LASF142:
	.string	"mii_eyes1_png_size"
.LASF144:
	.string	"mii_eyes2_png_size"
.LASF146:
	.string	"mii_eyes3_png_size"
.LASF115:
	.string	"uint8_t"
.LASF85:
	.string	"eyebrowSize"
.LASF82:
	.string	"eyebrowType"
.LASF226:
	.string	"GRRLIB_CompoStart"
.LASF154:
	.string	"mii_mole_png_size"
.LASF195:
	.string	"miinames"
.LASF21:
	.string	"__compar_fn_t"
.LASF129:
	.string	"ofnormaltexy"
.LASF181:
	.string	"eyecol"
.LASF128:
	.string	"ofnormaltexx"
.LASF66:
	.string	"miiID1"
.LASF67:
	.string	"miiID2"
.LASF68:
	.string	"miiID3"
.LASF69:
	.string	"miiID4"
.LASF89:
	.string	"eyeRotation"
.LASF169:
	.string	"img_noses"
.LASF227:
	.string	"_Z23GRRLIB_CreateStaticMiisv"
.LASF64:
	.string	"height"
.LASF130:
	.string	"data"
.LASF127:
	.string	"tilestart"
.LASF36:
	.string	"mbstowcs"
.LASF134:
	.string	"mii_heads_png_size"
.LASF185:
	.string	"eyes"
.LASF65:
	.string	"weight"
	.ident	"GCC: (devkitPPC release 41) 12.1.0"
	.gnu_attribute 4, 9
