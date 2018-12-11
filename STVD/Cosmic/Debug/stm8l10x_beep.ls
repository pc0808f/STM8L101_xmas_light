   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 92 void BEEP_DeInit(void)
  45                     ; 93 {
  47                     	switch	.text
  48  0000               _BEEP_DeInit:
  52                     ; 94   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  54  0000 351f50f3      	mov	20723,#31
  55                     ; 95 }
  58  0004 81            	ret	
 123                     ; 104 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 123                     ; 105 {
 124                     	switch	.text
 125  0005               _BEEP_Init:
 127  0005 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 108   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 133                     ; 111   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 135  0006 c650f3        	ld	a,20723
 136  0009 a41f          	and	a,#31
 137  000b a11f          	cp	a,#31
 138  000d 260c          	jrne	L15
 139                     ; 113     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 141  000f c650f3        	ld	a,20723
 142  0012 a4e0          	and	a,#224
 143  0014 c750f3        	ld	20723,a
 144                     ; 114     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 146  0017 721050f3      	bset	20723,#0
 147  001b               L15:
 148                     ; 118   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 150  001b c650f3        	ld	a,20723
 151  001e a43f          	and	a,#63
 152  0020 c750f3        	ld	20723,a
 153                     ; 119   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 155  0023 c650f3        	ld	a,20723
 156  0026 1a01          	or	a,(OFST+1,sp)
 157  0028 c750f3        	ld	20723,a
 158                     ; 121 }
 161  002b 84            	pop	a
 162  002c 81            	ret	
 217                     ; 129 void BEEP_Cmd(FunctionalState NewState)
 217                     ; 130 {
 218                     	switch	.text
 219  002d               _BEEP_Cmd:
 223                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 225                     ; 134   if (NewState != DISABLE)
 227  002d 4d            	tnz	a
 228  002e 2705          	jreq	L101
 229                     ; 137     BEEP->CSR |= BEEP_CSR_BEEPEN;
 231  0030 721a50f3      	bset	20723,#5
 234  0034 81            	ret	
 235  0035               L101:
 236                     ; 142     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 238  0035 721b50f3      	bres	20723,#5
 239                     ; 144 }
 242  0039 81            	ret	
 295                     .const:	section	.text
 296  0000               L41:
 297  0000 000003e8      	dc.l	1000
 298                     ; 185 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 298                     ; 186 {
 299                     	switch	.text
 300  003a               _BEEP_LSICalibrationConfig:
 302  003a 5206          	subw	sp,#6
 303       00000006      OFST:	set	6
 306                     ; 192   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 308                     ; 194   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 310  003c 96            	ldw	x,sp
 311  003d 1c0009        	addw	x,#OFST+3
 312  0040 cd0000        	call	c_ltor
 314  0043 ae0000        	ldw	x,#L41
 315  0046 cd0000        	call	c_ludv
 317  0049 be02          	ldw	x,c_lreg+2
 318  004b 1f03          	ldw	(OFST-3,sp),x
 320                     ; 198   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 322  004d c650f3        	ld	a,20723
 323  0050 a4e0          	and	a,#224
 324  0052 c750f3        	ld	20723,a
 325                     ; 200   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 327  0055 54            	srlw	x
 328  0056 54            	srlw	x
 329  0057 54            	srlw	x
 330  0058 1f05          	ldw	(OFST-1,sp),x
 332                     ; 202   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 334  005a 58            	sllw	x
 335  005b 58            	sllw	x
 336  005c 58            	sllw	x
 337  005d 1f01          	ldw	(OFST-5,sp),x
 339  005f 1e03          	ldw	x,(OFST-3,sp)
 340  0061 72f001        	subw	x,(OFST-5,sp)
 341  0064 1605          	ldw	y,(OFST-1,sp)
 342  0066 9058          	sllw	y
 343  0068 905c          	incw	y
 344  006a cd0000        	call	c_imul
 346  006d 1605          	ldw	y,(OFST-1,sp)
 347  006f 9058          	sllw	y
 348  0071 9058          	sllw	y
 349  0073 bf00          	ldw	c_x,x
 350  0075 9058          	sllw	y
 351  0077 90b300        	cpw	y,c_x
 352  007a 7b06          	ld	a,(OFST+0,sp)
 353  007c 2504          	jrult	L331
 354                     ; 204     BEEP->CSR |= (uint8_t)(A - 2U);
 356  007e a002          	sub	a,#2
 358  0080 2001          	jra	L531
 359  0082               L331:
 360                     ; 208     BEEP->CSR |= (uint8_t)(A - 1U);
 362  0082 4a            	dec	a
 363  0083               L531:
 364  0083 ca50f3        	or	a,20723
 365  0086 c750f3        	ld	20723,a
 366                     ; 211 }
 369  0089 5b06          	addw	sp,#6
 370  008b 81            	ret	
 383                     	xdef	_BEEP_LSICalibrationConfig
 384                     	xdef	_BEEP_Cmd
 385                     	xdef	_BEEP_Init
 386                     	xdef	_BEEP_DeInit
 387                     	xref.b	c_lreg
 388                     	xref.b	c_x
 407                     	xref	c_imul
 408                     	xref	c_ludv
 409                     	xref	c_ltor
 410                     	end
