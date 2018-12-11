   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  51                     ; 68 void CLK_DeInit(void)
  51                     ; 69 {
  53                     	switch	.text
  54  0000               _CLK_DeInit:
  58                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  60  0000 350350c0      	mov	20672,#3
  61                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  63  0004 725f50c3      	clr	20675
  64                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  66  0008 725f50c5      	clr	20677
  67                     ; 73 }
  70  000c 81            	ret	
 125                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 125                     ; 81 {
 126                     	switch	.text
 127  000d               _CLK_CCOCmd:
 131                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 133                     ; 85   if (NewState != DISABLE)
 135  000d 4d            	tnz	a
 136  000e 2705          	jreq	L74
 137                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 139  0010 721050c5      	bset	20677,#0
 142  0014 81            	ret	
 143  0015               L74:
 144                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 146  0015 721150c5      	bres	20677,#0
 147                     ; 96 }
 150  0019 81            	ret	
 255                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 255                     ; 114 {
 256                     	switch	.text
 257  001a               _CLK_PeripheralClockConfig:
 259  001a 89            	pushw	x
 260       00000000      OFST:	set	0
 263                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 265                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 267                     ; 119     if (NewState != DISABLE)
 269  001b 9f            	ld	a,xl
 270  001c 4d            	tnz	a
 271  001d 2706          	jreq	L711
 272                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 274  001f 9e            	ld	a,xh
 275  0020 ca50c3        	or	a,20675
 277  0023 2006          	jra	L121
 278  0025               L711:
 279                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 281  0025 7b01          	ld	a,(OFST+1,sp)
 282  0027 43            	cpl	a
 283  0028 c450c3        	and	a,20675
 284  002b               L121:
 285  002b c750c3        	ld	20675,a
 286                     ; 129 }
 289  002e 85            	popw	x
 290  002f 81            	ret	
 365                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 365                     ; 142 {
 366                     	switch	.text
 367  0030               _CLK_MasterPrescalerConfig:
 369  0030 88            	push	a
 370       00000000      OFST:	set	0
 373                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 375                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 377  0031 c650c0        	ld	a,20672
 378  0034 a4fc          	and	a,#252
 379  0036 c750c0        	ld	20672,a
 380                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 382  0039 7b01          	ld	a,(OFST+1,sp)
 383  003b c750c0        	ld	20672,a
 384                     ; 148 }
 387  003e 84            	pop	a
 388  003f 81            	ret	
 461                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 461                     ; 162 {
 462                     	switch	.text
 463  0040               _CLK_CCOConfig:
 465  0040 88            	push	a
 466       00000000      OFST:	set	0
 469                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 471                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 473  0041 c650c5        	ld	a,20677
 474  0044 a4f9          	and	a,#249
 475  0046 c750c5        	ld	20677,a
 476                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 478  0049 c650c5        	ld	a,20677
 479  004c 1a01          	or	a,(OFST+1,sp)
 480  004e c750c5        	ld	20677,a
 481                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 483  0051 721050c5      	bset	20677,#0
 484                     ; 174 }
 487  0055 84            	pop	a
 488  0056 81            	ret	
 541                     ; 181 uint32_t CLK_GetClockFreq(void)
 541                     ; 182 {
 542                     	switch	.text
 543  0057               _CLK_GetClockFreq:
 545  0057 5209          	subw	sp,#9
 546       00000009      OFST:	set	9
 549                     ; 183   uint32_t clockfrequency = 0;
 551                     ; 184   uint8_t tmp = 0, presc = 0;
 555                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 557  0059 c650c0        	ld	a,20672
 558  005c a403          	and	a,#3
 560                     ; 187   presc = HSIDivFactor[tmp];
 562  005e 5f            	clrw	x
 563  005f 97            	ld	xl,a
 564  0060 d60000        	ld	a,(_HSIDivFactor,x)
 565  0063 6b09          	ld	(OFST+0,sp),a
 567                     ; 188   clockfrequency = HSI_VALUE / presc;
 569  0065 b703          	ld	c_lreg+3,a
 570  0067 3f02          	clr	c_lreg+2
 571  0069 3f01          	clr	c_lreg+1
 572  006b 3f00          	clr	c_lreg
 573  006d 96            	ldw	x,sp
 574  006e 5c            	incw	x
 575  006f cd0000        	call	c_rtol
 578  0072 ae2400        	ldw	x,#9216
 579  0075 bf02          	ldw	c_lreg+2,x
 580  0077 ae00f4        	ldw	x,#244
 581  007a bf00          	ldw	c_lreg,x
 582  007c 96            	ldw	x,sp
 583  007d 5c            	incw	x
 584  007e cd0000        	call	c_ludv
 586  0081 96            	ldw	x,sp
 587  0082 1c0005        	addw	x,#OFST-4
 588  0085 cd0000        	call	c_rtol
 591                     ; 190   return((uint32_t)clockfrequency);
 593  0088 96            	ldw	x,sp
 594  0089 1c0005        	addw	x,#OFST-4
 595  008c cd0000        	call	c_ltor
 599  008f 5b09          	addw	sp,#9
 600  0091 81            	ret	
 625                     	xdef	_HSIDivFactor
 626                     	xdef	_CLK_GetClockFreq
 627                     	xdef	_CLK_CCOConfig
 628                     	xdef	_CLK_MasterPrescalerConfig
 629                     	xdef	_CLK_PeripheralClockConfig
 630                     	xdef	_CLK_CCOCmd
 631                     	xdef	_CLK_DeInit
 632                     	xref.b	c_lreg
 633                     	xref.b	c_x
 652                     	xref	c_ltor
 653                     	xref	c_ludv
 654                     	xref	c_rtol
 655                     	end
