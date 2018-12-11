   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  46                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  46                     ; 54 {
  47                     	switch	.text
  48  0000               f_NonHandledInterrupt:
  52                     ; 58 }
  55  0000 80            	iret	
  77                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 67 {
  78                     	switch	.text
  79  0001               f_TRAP_IRQHandler:
  83                     ; 71 }
  86  0001 80            	iret	
 108                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 108                     ; 79 {
 109                     	switch	.text
 110  0002               f_FLASH_IRQHandler:
 114                     ; 83 }
 117  0002 80            	iret	
 140                     ; 90 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 140                     ; 91 {
 141                     	switch	.text
 142  0003               f_AWU_IRQHandler:
 144  0003 8a            	push	cc
 145  0004 84            	pop	a
 146  0005 a4bf          	and	a,#191
 147  0007 88            	push	a
 148  0008 86            	pop	cc
 149  0009 3b0002        	push	c_x+2
 150  000c be00          	ldw	x,c_x
 151  000e 89            	pushw	x
 152  000f 3b0002        	push	c_y+2
 153  0012 be00          	ldw	x,c_y
 154  0014 89            	pushw	x
 157                     ; 95   AWU_GetFlagStatus();		
 159  0015 cd0000        	call	_AWU_GetFlagStatus
 161                     ; 96 }
 164  0018 85            	popw	x
 165  0019 bf00          	ldw	c_y,x
 166  001b 320002        	pop	c_y+2
 167  001e 85            	popw	x
 168  001f bf00          	ldw	c_x,x
 169  0021 320002        	pop	c_x+2
 170  0024 80            	iret	
 192                     ; 103 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 192                     ; 104 {
 193                     	switch	.text
 194  0025               f_EXTIB_IRQHandler:
 198                     ; 108 }
 201  0025 80            	iret	
 223                     ; 115 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 223                     ; 116 {
 224                     	switch	.text
 225  0026               f_EXTID_IRQHandler:
 229                     ; 120 }
 232  0026 80            	iret	
 254                     ; 127 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 254                     ; 128 {
 255                     	switch	.text
 256  0027               f_EXTI0_IRQHandler:
 260                     ; 132 }
 263  0027 80            	iret	
 285                     ; 139 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 285                     ; 140 {
 286                     	switch	.text
 287  0028               f_EXTI1_IRQHandler:
 291                     ; 144 }
 294  0028 80            	iret	
 316                     ; 151 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 316                     ; 152 {
 317                     	switch	.text
 318  0029               f_EXTI2_IRQHandler:
 322                     ; 156 }
 325  0029 80            	iret	
 347                     ; 163 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 347                     ; 164 {
 348                     	switch	.text
 349  002a               f_EXTI3_IRQHandler:
 353                     ; 168 }
 356  002a 80            	iret	
 378                     ; 175 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 378                     ; 176 {
 379                     	switch	.text
 380  002b               f_EXTI4_IRQHandler:
 384                     ; 180 }
 387  002b 80            	iret	
 409                     ; 187 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 409                     ; 188 {
 410                     	switch	.text
 411  002c               f_EXTI5_IRQHandler:
 415                     ; 192 }
 418  002c 80            	iret	
 440                     ; 199 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 440                     ; 200 
 440                     ; 201 {
 441                     	switch	.text
 442  002d               f_EXTI6_IRQHandler:
 446                     ; 205 }
 449  002d 80            	iret	
 471                     ; 212 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 471                     ; 213 {
 472                     	switch	.text
 473  002e               f_EXTI7_IRQHandler:
 477                     ; 217 }
 480  002e 80            	iret	
 502                     ; 224 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 502                     ; 225 {
 503                     	switch	.text
 504  002f               f_COMP_IRQHandler:
 508                     ; 229 }
 511  002f 80            	iret	
 550                     ; 236 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 550                     ; 237 {
 551                     	switch	.text
 552  0030               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 554  0030 8a            	push	cc
 555  0031 84            	pop	a
 556  0032 a4bf          	and	a,#191
 557  0034 88            	push	a
 558  0035 86            	pop	cc
 559       00000001      OFST:	set	1
 560  0036 3b0002        	push	c_x+2
 561  0039 be00          	ldw	x,c_x
 562  003b 89            	pushw	x
 563  003c 3b0002        	push	c_y+2
 564  003f be00          	ldw	x,c_y
 565  0041 89            	pushw	x
 566  0042 88            	push	a
 569                     ; 238   uint8_t PWM_Value = 0;
 571                     ; 239  if (counter >= COUNTER)               
 573  0043 be00          	ldw	x,_counter
 574  0045 b300          	cpw	x,_COUNTER
 575  0047 252c          	jrult	L712
 576                     ; 242     counter = 0;
 578  0049 5f            	clrw	x
 579  004a bf00          	ldw	_counter,x
 580                     ; 244     if (sin.Up == TRUE)
 582  004c b62f          	ld	a,_sin+47
 583  004e 4a            	dec	a
 584  004f 2609          	jrne	L122
 585                     ; 248       PWM_Value = (uint8_t)(AVERAGE_AMP + sin.Value[sin.Index]);
 587  0051 b62e          	ld	a,_sin+46
 588  0053 97            	ld	xl,a
 589  0054 e600          	ld	a,(_sin,x)
 590  0056 ab62          	add	a,#98
 592  0058 2008          	jra	L322
 593  005a               L122:
 594                     ; 255       PWM_Value = (uint8_t)(AVERAGE_AMP - sin.Value[sin.Index]);
 596  005a b62e          	ld	a,_sin+46
 597  005c 97            	ld	xl,a
 598  005d e600          	ld	a,(_sin,x)
 599  005f a062          	sub	a,#98
 600  0061 40            	neg	a
 601  0062               L322:
 602  0062 6b01          	ld	(OFST+0,sp),a
 604                     ; 257     TIM2_SetCompare1((uint16_t)PWM_Value);
 606  0064 5f            	clrw	x
 607  0065 97            	ld	xl,a
 608  0066 cd0000        	call	_TIM2_SetCompare1
 610                     ; 259     sin.Index++;
 612  0069 3c2e          	inc	_sin+46
 613                     ; 260     if (sin.Index == nbr_of_samples_half) 
 615  006b b62e          	ld	a,_sin+46
 616  006d a12e          	cp	a,#46
 617  006f 2604          	jrne	L712
 618                     ; 263       sin.Index = 0;
 620  0071 3f2e          	clr	_sin+46
 621                     ; 265       sin.Up=(bool)(~sin.Up);
 623  0073 332f          	cpl	_sin+47
 624  0075               L712:
 625                     ; 269   counter++;
 627  0075 be00          	ldw	x,_counter
 628  0077 5c            	incw	x
 629  0078 bf00          	ldw	_counter,x
 630                     ; 271   TIM2_ClearITPendingBit(TIM2_IT_Update);
 632  007a a601          	ld	a,#1
 633  007c cd0000        	call	_TIM2_ClearITPendingBit
 635                     ; 272 }
 638  007f 84            	pop	a
 639  0080 85            	popw	x
 640  0081 bf00          	ldw	c_y,x
 641  0083 320002        	pop	c_y+2
 642  0086 85            	popw	x
 643  0087 bf00          	ldw	c_x,x
 644  0089 320002        	pop	c_x+2
 645  008c 80            	iret	
 668                     ; 279 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 668                     ; 280 {
 669                     	switch	.text
 670  008d               f_TIM2_CAP_IRQHandler:
 674                     ; 284 }
 677  008d 80            	iret	
 700                     ; 292 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 700                     ; 293 {
 701                     	switch	.text
 702  008e               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 706                     ; 297 }
 709  008e 80            	iret	
 732                     ; 303 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 732                     ; 304 {
 733                     	switch	.text
 734  008f               f_TIM3_CAP_IRQHandler:
 738                     ; 308 }
 741  008f 80            	iret	
 767                     ; 314 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 767                     ; 315 {
 768                     	switch	.text
 769  0090               f_TIM4_UPD_OVF_IRQHandler:
 771  0090 8a            	push	cc
 772  0091 84            	pop	a
 773  0092 a4bf          	and	a,#191
 774  0094 88            	push	a
 775  0095 86            	pop	cc
 776  0096 3b0002        	push	c_x+2
 777  0099 be00          	ldw	x,c_x
 778  009b 89            	pushw	x
 779  009c 3b0002        	push	c_y+2
 780  009f be00          	ldw	x,c_y
 781  00a1 89            	pushw	x
 784                     ; 319 	secTick++;
 786  00a2 be00          	ldw	x,_secTick
 787  00a4 5c            	incw	x
 788  00a5 bf00          	ldw	_secTick,x
 789                     ; 320   tim4Tick++;
 791  00a7 ae0000        	ldw	x,#_tim4Tick
 792  00aa a601          	ld	a,#1
 793  00ac cd0000        	call	c_lgadc
 795                     ; 321   TIM4_ClearITPendingBit(TIM4_IT_Update);		
 797  00af a601          	ld	a,#1
 798  00b1 cd0000        	call	_TIM4_ClearITPendingBit
 800                     ; 322 }
 803  00b4 85            	popw	x
 804  00b5 bf00          	ldw	c_y,x
 805  00b7 320002        	pop	c_y+2
 806  00ba 85            	popw	x
 807  00bb bf00          	ldw	c_x,x
 808  00bd 320002        	pop	c_x+2
 809  00c0 80            	iret	
 831                     ; 329 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
 831                     ; 330 {
 832                     	switch	.text
 833  00c1               f_SPI_IRQHandler:
 837                     ; 334 }
 840  00c1 80            	iret	
 863                     ; 340 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
 863                     ; 341 {
 864                     	switch	.text
 865  00c2               f_USART_TX_IRQHandler:
 869                     ; 345 }
 872  00c2 80            	iret	
 895                     ; 352 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
 895                     ; 353 {
 896                     	switch	.text
 897  00c3               f_USART_RX_IRQHandler:
 901                     ; 357 }
 904  00c3 80            	iret	
 926                     ; 365 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
 926                     ; 366 {
 927                     	switch	.text
 928  00c4               f_I2C_IRQHandler:
 932                     ; 370 }
 935  00c4 80            	iret	
 947                     	xref.b	_COUNTER
 948                     	xref.b	_counter
 949                     	xref.b	_sin
 950                     	xref.b	_secTick
 951                     	xref.b	_tim4Tick
 952                     	xdef	f_I2C_IRQHandler
 953                     	xdef	f_USART_RX_IRQHandler
 954                     	xdef	f_USART_TX_IRQHandler
 955                     	xdef	f_SPI_IRQHandler
 956                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 957                     	xdef	f_TIM3_CAP_IRQHandler
 958                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 959                     	xdef	f_TIM2_CAP_IRQHandler
 960                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 961                     	xdef	f_COMP_IRQHandler
 962                     	xdef	f_EXTI7_IRQHandler
 963                     	xdef	f_EXTI6_IRQHandler
 964                     	xdef	f_EXTI5_IRQHandler
 965                     	xdef	f_EXTI4_IRQHandler
 966                     	xdef	f_EXTI3_IRQHandler
 967                     	xdef	f_EXTI2_IRQHandler
 968                     	xdef	f_EXTI1_IRQHandler
 969                     	xdef	f_EXTI0_IRQHandler
 970                     	xdef	f_EXTID_IRQHandler
 971                     	xdef	f_EXTIB_IRQHandler
 972                     	xdef	f_AWU_IRQHandler
 973                     	xdef	f_FLASH_IRQHandler
 974                     	xdef	f_TRAP_IRQHandler
 975                     	xdef	f_NonHandledInterrupt
 976                     	xref	_TIM4_ClearITPendingBit
 977                     	xref	_TIM2_ClearITPendingBit
 978                     	xref	_TIM2_SetCompare1
 979                     	xref	_AWU_GetFlagStatus
 980                     	xref.b	c_x
 981                     	xref.b	c_y
1000                     	xref	c_lgadc
1001                     	end
