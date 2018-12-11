   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  17                     .const:	section	.text
  18  0000               _APR_Array:
  19  0000 00            	dc.b	0
  20  0001 08            	dc.b	8
  21  0002 10            	dc.b	16
  22  0003 20            	dc.b	32
  23  0004 3e            	dc.b	62
  24  0005 3e            	dc.b	62
  25  0006 3e            	dc.b	62
  26  0007 3e            	dc.b	62
  27  0008 3e            	dc.b	62
  28  0009 3e            	dc.b	62
  29  000a 3e            	dc.b	62
  30  000b 3e            	dc.b	62
  31  000c 3e            	dc.b	62
  32  000d 3d            	dc.b	61
  33  000e 3d            	dc.b	61
  34  000f 24            	dc.b	36
  35  0010 0e            	dc.b	14
  36  0011               _TBR_Array:
  37  0011 00            	dc.b	0
  38  0012 01            	dc.b	1
  39  0013 01            	dc.b	1
  40  0014 01            	dc.b	1
  41  0015 01            	dc.b	1
  42  0016 02            	dc.b	2
  43  0017 03            	dc.b	3
  44  0018 04            	dc.b	4
  45  0019 05            	dc.b	5
  46  001a 06            	dc.b	6
  47  001b 07            	dc.b	7
  48  001c 08            	dc.b	8
  49  001d 09            	dc.b	9
  50  001e 0a            	dc.b	10
  51  001f 0b            	dc.b	11
  52  0020 0e            	dc.b	14
  53  0021 0f            	dc.b	15
  82                     ; 73 void AWU_DeInit(void)
  82                     ; 74 {
  84                     	switch	.text
  85  0000               _AWU_DeInit:
  89                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  91  0000 725f50f0      	clr	20720
  92                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  94  0004 353f50f1      	mov	20721,#63
  95                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  97  0008 725f50f2      	clr	20722
  98                     ; 78 }
 101  000c 81            	ret	
 263                     ; 86 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 87 {
 264                     	switch	.text
 265  000d               _AWU_Init:
 267  000d 88            	push	a
 268       00000000      OFST:	set	0
 271                     ; 89   assert_param(IS_AWU_TIMEBASE(AWU_TimeBase));
 273                     ; 92   AWU->CSR |= AWU_CSR_AWUEN;
 275  000e 721850f0      	bset	20720,#4
 276                     ; 95   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 278  0012 c650f2        	ld	a,20722
 279  0015 a4f0          	and	a,#240
 280  0017 c750f2        	ld	20722,a
 281                     ; 96   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 283  001a 7b01          	ld	a,(OFST+1,sp)
 284  001c 5f            	clrw	x
 285  001d 97            	ld	xl,a
 286  001e c650f2        	ld	a,20722
 287  0021 da0011        	or	a,(_TBR_Array,x)
 288  0024 c750f2        	ld	20722,a
 289                     ; 99   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 291  0027 c650f1        	ld	a,20721
 292  002a a4c0          	and	a,#192
 293  002c c750f1        	ld	20721,a
 294                     ; 100   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 296  002f 7b01          	ld	a,(OFST+1,sp)
 297  0031 5f            	clrw	x
 298  0032 97            	ld	xl,a
 299  0033 c650f1        	ld	a,20721
 300  0036 da0000        	or	a,(_APR_Array,x)
 301  0039 c750f1        	ld	20721,a
 302                     ; 102 }
 305  003c 84            	pop	a
 306  003d 81            	ret	
 361                     ; 110 void AWU_Cmd(FunctionalState NewState)
 361                     ; 111 {
 362                     	switch	.text
 363  003e               _AWU_Cmd:
 367                     ; 112   assert_param(IS_FUNCTIONAL_STATE(NewState));
 369                     ; 114   if (NewState != DISABLE)
 371  003e 4d            	tnz	a
 372  003f 2705          	jreq	L331
 373                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 375  0041 721850f0      	bset	20720,#4
 378  0045 81            	ret	
 379  0046               L331:
 380                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 382  0046 721950f0      	bres	20720,#4
 383                     ; 124 }
 386  004a 81            	ret	
 439                     	switch	.const
 440  0022               L41:
 441  0022 000003e8      	dc.l	1000
 442                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 442                     ; 140 {
 443                     	switch	.text
 444  004b               _AWU_LSICalibrationConfig:
 446  004b 5206          	subw	sp,#6
 447       00000006      OFST:	set	6
 450                     ; 142   uint16_t lsifreqkhz = 0x0;
 452                     ; 143   uint16_t A = 0x0;
 454                     ; 146   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 456                     ; 148   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 458  004d 96            	ldw	x,sp
 459  004e 1c0009        	addw	x,#OFST+3
 460  0051 cd0000        	call	c_ltor
 462  0054 ae0022        	ldw	x,#L41
 463  0057 cd0000        	call	c_ludv
 465  005a be02          	ldw	x,c_lreg+2
 466  005c 1f03          	ldw	(OFST-3,sp),x
 468                     ; 152   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 470  005e 54            	srlw	x
 471  005f 54            	srlw	x
 472  0060 1f05          	ldw	(OFST-1,sp),x
 474                     ; 154   if ((4U * A) >= ((lsifreqkhz - (4U * A)) *(1U + (2U * A))))
 476  0062 58            	sllw	x
 477  0063 58            	sllw	x
 478  0064 1f01          	ldw	(OFST-5,sp),x
 480  0066 1e03          	ldw	x,(OFST-3,sp)
 481  0068 72f001        	subw	x,(OFST-5,sp)
 482  006b 1605          	ldw	y,(OFST-1,sp)
 483  006d 9058          	sllw	y
 484  006f 905c          	incw	y
 485  0071 cd0000        	call	c_imul
 487  0074 1605          	ldw	y,(OFST-1,sp)
 488  0076 9058          	sllw	y
 489  0078 bf00          	ldw	c_x,x
 490  007a 9058          	sllw	y
 491  007c 90b300        	cpw	y,c_x
 492  007f 7b06          	ld	a,(OFST+0,sp)
 493  0081 2504          	jrult	L561
 494                     ; 156     AWU->APR = (uint8_t)(A - 2U);
 496  0083 a002          	sub	a,#2
 498  0085 2001          	jra	L761
 499  0087               L561:
 500                     ; 160     AWU->APR = (uint8_t)(A - 1U);
 502  0087 4a            	dec	a
 503  0088               L761:
 504  0088 c750f1        	ld	20721,a
 505                     ; 163 }
 508  008b 5b06          	addw	sp,#6
 509  008d 81            	ret	
 532                     ; 170 void AWU_IdleModeEnable(void)
 532                     ; 171 {
 533                     	switch	.text
 534  008e               _AWU_IdleModeEnable:
 538                     ; 174   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 540  008e 721950f0      	bres	20720,#4
 541                     ; 177   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 543  0092 35f050f2      	mov	20722,#240
 544                     ; 179 }
 547  0096 81            	ret	
 591                     ; 186 FlagStatus AWU_GetFlagStatus(void)
 591                     ; 187 {
 592                     	switch	.text
 593  0097               _AWU_GetFlagStatus:
 597                     ; 188   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 599  0097 720a50f002    	btjt	20720,#5,L22
 600  009c 4f            	clr	a
 602  009d 81            	ret	
 603  009e               L22:
 604  009e a601          	ld	a,#1
 607  00a0 81            	ret	
 642                     	xdef	_TBR_Array
 643                     	xdef	_APR_Array
 644                     	xdef	_AWU_GetFlagStatus
 645                     	xdef	_AWU_IdleModeEnable
 646                     	xdef	_AWU_LSICalibrationConfig
 647                     	xdef	_AWU_Cmd
 648                     	xdef	_AWU_Init
 649                     	xdef	_AWU_DeInit
 650                     	xref.b	c_lreg
 651                     	xref.b	c_x
 670                     	xref	c_imul
 671                     	xref	c_ludv
 672                     	xref	c_ltor
 673                     	end
