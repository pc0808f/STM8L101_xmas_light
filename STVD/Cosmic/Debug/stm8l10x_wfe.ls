   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 55 void WFE_DeInit(void)
  45                     ; 56 {
  47                     	switch	.text
  48  0000               _WFE_DeInit:
  52                     ; 57   WFE->CR1 = WFE_CR1_RESET_VALUE;
  54  0000 725f50a6      	clr	20646
  55                     ; 58   WFE->CR2 = WFE_CR2_RESET_VALUE;
  57  0004 725f50a7      	clr	20647
  58                     ; 59 }
  61  0008 81            	ret	
 238                     ; 80 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 238                     ; 81 {
 239                     	switch	.text
 240  0009               _WFE_WakeUpSourceEventCmd:
 242  0009 89            	pushw	x
 243  000a 88            	push	a
 244       00000001      OFST:	set	1
 247                     ; 82   uint8_t register_index = 0;
 249                     ; 84   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 251                     ; 85   assert_param(IS_FUNCTIONAL_STATE(NewState));
 253                     ; 88   register_index = (uint8_t)((uint16_t)WFE_Source >> (uint8_t)0x08);
 255  000b 9e            	ld	a,xh
 256  000c 6b01          	ld	(OFST+0,sp),a
 258                     ; 90   if (NewState != DISABLE)
 260  000e 0d06          	tnz	(OFST+5,sp)
 261  0010 2719          	jreq	L721
 262                     ; 92     switch (register_index)
 265                     ; 102       default:
 265                     ; 103         break;
 266  0012 4a            	dec	a
 267  0013 2705          	jreq	L12
 268  0015 4a            	dec	a
 269  0016 2709          	jreq	L32
 270  0018 2022          	jra	L531
 271  001a               L12:
 272                     ; 94       case 1:
 272                     ; 95         WFE->CR1 |= (uint8_t)WFE_Source;
 274  001a c650a6        	ld	a,20646
 275  001d 1a03          	or	a,(OFST+2,sp)
 276                     ; 96         break;
 278  001f 2018          	jp	LC001
 279  0021               L32:
 280                     ; 98       case 2:
 280                     ; 99         WFE->CR2 |= (uint8_t)WFE_Source;
 282  0021 c650a7        	ld	a,20647
 283  0024 1a03          	or	a,(OFST+2,sp)
 284  0026               LC002:
 285  0026 c750a7        	ld	20647,a
 286                     ; 100         break;
 288  0029 2011          	jra	L531
 289                     ; 102       default:
 289                     ; 103         break;
 292  002b               L721:
 293                     ; 108     switch (register_index)
 296                     ; 118       default:
 296                     ; 119         break;
 297  002b 4a            	dec	a
 298  002c 2705          	jreq	L72
 299  002e 4a            	dec	a
 300  002f 270e          	jreq	L13
 301  0031 2009          	jra	L531
 302  0033               L72:
 303                     ; 110       case 1:
 303                     ; 111         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 305  0033 7b03          	ld	a,(OFST+2,sp)
 306  0035 43            	cpl	a
 307  0036 c450a6        	and	a,20646
 308  0039               LC001:
 309  0039 c750a6        	ld	20646,a
 310                     ; 112         break;
 311  003c               L531:
 312                     ; 122 }
 315  003c 5b03          	addw	sp,#3
 316  003e 81            	ret	
 317  003f               L13:
 318                     ; 114       case 2:
 318                     ; 115         WFE->CR2 &= (uint8_t)(~(uint8_t)WFE_Source);
 320  003f 7b03          	ld	a,(OFST+2,sp)
 321  0041 43            	cpl	a
 322  0042 c450a7        	and	a,20647
 323                     ; 116         break;
 325  0045 20df          	jp	LC002
 326                     ; 118       default:
 326                     ; 119         break;
 374                     ; 142 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 374                     ; 143 {
 375                     	switch	.text
 376  0047               _WFE_GetWakeUpSourceEventStatus:
 378  0047 89            	pushw	x
 379  0048 88            	push	a
 380       00000001      OFST:	set	1
 383                     ; 144   FunctionalState status = DISABLE;
 385  0049 0f01          	clr	(OFST+0,sp)
 387                     ; 146   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 389                     ; 148   switch (WFE_Source)
 392                     ; 187     default:
 392                     ; 188       break;
 393  004b 1d0101        	subw	x,#257
 394  004e 2735          	jreq	L341
 395  0050 5a            	decw	x
 396  0051 2732          	jreq	L341
 397  0053 1d000e        	subw	x,#14
 398  0056 272d          	jreq	L341
 399  0058 1d0010        	subw	x,#16
 400  005b 2728          	jreq	L341
 401  005d 1d0020        	subw	x,#32
 402  0060 2723          	jreq	L341
 403  0062 1d0040        	subw	x,#64
 404  0065 271e          	jreq	L341
 405  0067 1d0081        	subw	x,#129
 406  006a 2722          	jreq	L541
 407  006c 5a            	decw	x
 408  006d 271f          	jreq	L541
 409  006f 1d0002        	subw	x,#2
 410  0072 271a          	jreq	L541
 411  0074 1d0004        	subw	x,#4
 412  0077 2715          	jreq	L541
 413  0079 1d0008        	subw	x,#8
 414  007c 2710          	jreq	L541
 415  007e 1d0010        	subw	x,#16
 416  0081 270b          	jreq	L541
 417  0083 2018          	jra	L571
 418  0085               L341:
 419                     ; 150     case WFE_Source_TIM2_EV0:
 419                     ; 151     case WFE_Source_TIM2_EV1:
 419                     ; 152     case WFE_Source_EXTI_EV0:
 419                     ; 153     case WFE_Source_EXTI_EV1:
 419                     ; 154     case WFE_Source_EXTI_EV2:
 419                     ; 155     case WFE_Source_EXTI_EV3:
 419                     ; 156 
 419                     ; 157       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 421  0085 c650a6        	ld	a,20646
 422  0088 1503          	bcp	a,(OFST+2,sp)
 423  008a 270f          	jreq	L302
 424                     ; 160         status = ENABLE;
 426  008c 2007          	jp	LC004
 427                     ; 165         status = DISABLE;
 428  008e               L541:
 429                     ; 169     case WFE_Source_EXTI_EV4:
 429                     ; 170     case WFE_Source_EXTI_EV5:
 429                     ; 171     case WFE_Source_EXTI_EV6:
 429                     ; 172     case WFE_Source_EXTI_EV7:
 429                     ; 173     case WFE_Source_EXTI_EVB:
 429                     ; 174     case WFE_Source_EXTI_EVD:
 429                     ; 175 
 429                     ; 176       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 431  008e c650a7        	ld	a,20647
 432  0091 1503          	bcp	a,(OFST+2,sp)
 433  0093 2706          	jreq	L302
 434                     ; 179         status = ENABLE;
 436  0095               LC004:
 438  0095 a601          	ld	a,#1
 439  0097 6b01          	ld	(OFST+0,sp),a
 442  0099 2002          	jra	L571
 443  009b               L302:
 444                     ; 184         status = DISABLE;
 447  009b 0f01          	clr	(OFST+0,sp)
 449                     ; 187     default:
 449                     ; 188       break;
 451  009d               L571:
 452                     ; 190   return status;
 454  009d 7b01          	ld	a,(OFST+0,sp)
 457  009f 5b03          	addw	sp,#3
 458  00a1 81            	ret	
 471                     	xdef	_WFE_GetWakeUpSourceEventStatus
 472                     	xdef	_WFE_WakeUpSourceEventCmd
 473                     	xdef	_WFE_DeInit
 492                     	end
