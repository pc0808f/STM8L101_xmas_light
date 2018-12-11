   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 57 uint8_t ITC_GetCPUCC(void)
  45                     ; 58 {
  47                     	switch	.text
  48  0000               _ITC_GetCPUCC:
  52                     ; 60   _asm("push cc");
  55  0000 8a            	push	cc
  57                     ; 61   _asm("pop a");
  60  0001 84            	pop	a
  62                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret	
  88                     ; 76 void ITC_DeInit(void)
  88                     ; 77 {
  89                     	switch	.text
  90  0003               _ITC_DeInit:
  94                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  96  0003 35ff7f70      	mov	32624,#255
  97                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
  99  0007 35ff7f71      	mov	32625,#255
 100                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 102  000b 35ff7f72      	mov	32626,#255
 103                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 105  000f 35ff7f73      	mov	32627,#255
 106                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 108  0013 35ff7f74      	mov	32628,#255
 109                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 111  0017 35ff7f75      	mov	32629,#255
 112                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 114  001b 35ff7f76      	mov	32630,#255
 115                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 117  001f 35ff7f77      	mov	32631,#255
 118                     ; 86 }
 121  0023 81            	ret	
 146                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 94 {
 147                     	switch	.text
 148  0024               _ITC_GetSoftIntStatus:
 152                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 154  0024 adda          	call	_ITC_GetCPUCC
 156  0026 a428          	and	a,#40
 159  0028 81            	ret	
 414                     .const:	section	.text
 415  0000               L42:
 416  0000 004b          	dc.w	L14
 417  0002 0075          	dc.w	L702
 418  0004 0075          	dc.w	L702
 419  0006 0050          	dc.w	L34
 420  0008 0075          	dc.w	L702
 421  000a 0050          	dc.w	L34
 422  000c 0050          	dc.w	L34
 423  000e 0055          	dc.w	L54
 424  0010 0055          	dc.w	L54
 425  0012 0055          	dc.w	L54
 426  0014 0055          	dc.w	L54
 427  0016 005a          	dc.w	L74
 428  0018 005a          	dc.w	L74
 429  001a 005a          	dc.w	L74
 430  001c 005a          	dc.w	L74
 431  001e 0075          	dc.w	L702
 432  0020 0075          	dc.w	L702
 433  0022 005f          	dc.w	L15
 434  0024 005f          	dc.w	L15
 435  0026 0064          	dc.w	L35
 436  0028 0064          	dc.w	L35
 437  002a 0064          	dc.w	L35
 438  002c 0075          	dc.w	L702
 439  002e 0075          	dc.w	L702
 440  0030 0069          	dc.w	L55
 441  0032 0069          	dc.w	L55
 442  0034 0069          	dc.w	L55
 443  0036 006e          	dc.w	L75
 444  0038 006e          	dc.w	L75
 445                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 445                     ; 127 {
 446                     	switch	.text
 447  0029               _ITC_GetSoftwarePriority:
 449  0029 88            	push	a
 450  002a 89            	pushw	x
 451       00000002      OFST:	set	2
 454                     ; 128   uint8_t Value = 0;
 456  002b 0f02          	clr	(OFST+0,sp)
 458                     ; 129   uint8_t Mask = 0;
 460                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 462                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 464  002d a403          	and	a,#3
 465  002f 48            	sll	a
 466  0030 5f            	clrw	x
 467  0031 97            	ld	xl,a
 468  0032 a603          	ld	a,#3
 469  0034 5d            	tnzw	x
 470  0035 2704          	jreq	L61
 471  0037               L02:
 472  0037 48            	sll	a
 473  0038 5a            	decw	x
 474  0039 26fc          	jrne	L02
 475  003b               L61:
 476  003b 6b01          	ld	(OFST-1,sp),a
 478                     ; 137   switch (IRQn)
 480  003d 7b03          	ld	a,(OFST+1,sp)
 482                     ; 185     default:
 482                     ; 186       break;
 483  003f 4a            	dec	a
 484  0040 a11d          	cp	a,#29
 485  0042 2431          	jruge	L702
 486  0044 5f            	clrw	x
 487  0045 97            	ld	xl,a
 488  0046 58            	sllw	x
 489  0047 de0000        	ldw	x,(L42,x)
 490  004a fc            	jp	(x)
 491  004b               L14:
 492                     ; 139     case FLASH_IRQn:
 492                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 494  004b c67f70        	ld	a,32624
 495                     ; 141       break;
 497  004e 2021          	jp	LC001
 498  0050               L34:
 499                     ; 143     case AWU_IRQn:
 499                     ; 144     case EXTIB_IRQn:
 499                     ; 145     case EXTID_IRQn:
 499                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 501  0050 c67f71        	ld	a,32625
 502                     ; 147       break;
 504  0053 201c          	jp	LC001
 505  0055               L54:
 506                     ; 149     case EXTI0_IRQn:
 506                     ; 150     case EXTI1_IRQn:
 506                     ; 151     case EXTI2_IRQn:
 506                     ; 152     case EXTI3_IRQn:
 506                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 508  0055 c67f72        	ld	a,32626
 509                     ; 154       break;
 511  0058 2017          	jp	LC001
 512  005a               L74:
 513                     ; 156     case EXTI4_IRQn:
 513                     ; 157     case EXTI5_IRQn:
 513                     ; 158     case EXTI6_IRQn:
 513                     ; 159     case EXTI7_IRQn:
 513                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 515  005a c67f73        	ld	a,32627
 516                     ; 161       break;
 518  005d 2012          	jp	LC001
 519  005f               L15:
 520                     ; 163     case COMP_IRQn:
 520                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 520                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 522  005f c67f74        	ld	a,32628
 523                     ; 166       break;
 525  0062 200d          	jp	LC001
 526  0064               L35:
 527                     ; 168     case TIM2_CAP_IRQn:
 527                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 527                     ; 170     case TIM3_CAP_IRQn:
 527                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 529  0064 c67f75        	ld	a,32629
 530                     ; 172       break;
 532  0067 2008          	jp	LC001
 533  0069               L55:
 534                     ; 174     case TIM4_UPD_OVF_IRQn:
 534                     ; 175     case SPI_IRQn:
 534                     ; 176     case USART_TX_IRQn:
 534                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 536  0069 c67f76        	ld	a,32630
 537                     ; 178       break;
 539  006c 2003          	jp	LC001
 540  006e               L75:
 541                     ; 180     case USART_RX_IRQn:
 541                     ; 181     case I2C_IRQn:
 541                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 543  006e c67f77        	ld	a,32631
 544  0071               LC001:
 545  0071 1401          	and	a,(OFST-1,sp)
 546  0073 6b02          	ld	(OFST+0,sp),a
 548                     ; 183       break;
 550                     ; 185     default:
 550                     ; 186       break;
 552  0075               L702:
 553                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 555  0075 7b03          	ld	a,(OFST+1,sp)
 556  0077 a403          	and	a,#3
 557  0079 48            	sll	a
 558  007a 5f            	clrw	x
 559  007b 97            	ld	xl,a
 560  007c 7b02          	ld	a,(OFST+0,sp)
 561  007e 5d            	tnzw	x
 562  007f 2704          	jreq	L62
 563  0081               L03:
 564  0081 44            	srl	a
 565  0082 5a            	decw	x
 566  0083 26fc          	jrne	L03
 567  0085               L62:
 569                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 573  0085 5b03          	addw	sp,#3
 574  0087 81            	ret	
 638                     	switch	.const
 639  003a               L64:
 640  003a 00bf          	dc.w	L112
 641  003c 014d          	dc.w	L762
 642  003e 014d          	dc.w	L762
 643  0040 00d1          	dc.w	L312
 644  0042 014d          	dc.w	L762
 645  0044 00d1          	dc.w	L312
 646  0046 00d1          	dc.w	L312
 647  0048 00e3          	dc.w	L512
 648  004a 00e3          	dc.w	L512
 649  004c 00e3          	dc.w	L512
 650  004e 00e3          	dc.w	L512
 651  0050 00f5          	dc.w	L712
 652  0052 00f5          	dc.w	L712
 653  0054 00f5          	dc.w	L712
 654  0056 00f5          	dc.w	L712
 655  0058 014d          	dc.w	L762
 656  005a 014d          	dc.w	L762
 657  005c 0107          	dc.w	L122
 658  005e 0107          	dc.w	L122
 659  0060 0119          	dc.w	L322
 660  0062 0119          	dc.w	L322
 661  0064 0119          	dc.w	L322
 662  0066 014d          	dc.w	L762
 663  0068 014d          	dc.w	L762
 664  006a 012b          	dc.w	L522
 665  006c 012b          	dc.w	L522
 666  006e 012b          	dc.w	L522
 667  0070 013d          	dc.w	L722
 668  0072 013d          	dc.w	L722
 669                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 669                     ; 235 {
 670                     	switch	.text
 671  0088               _ITC_SetSoftwarePriority:
 673  0088 89            	pushw	x
 674  0089 89            	pushw	x
 675       00000002      OFST:	set	2
 678                     ; 236   uint8_t Mask = 0;
 680                     ; 237   uint8_t NewPriority = 0;
 682                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 684                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 686                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 688                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 690  008a 9e            	ld	a,xh
 691  008b a403          	and	a,#3
 692  008d 48            	sll	a
 693  008e 5f            	clrw	x
 694  008f 97            	ld	xl,a
 695  0090 a603          	ld	a,#3
 696  0092 5d            	tnzw	x
 697  0093 2704          	jreq	L43
 698  0095               L63:
 699  0095 48            	sll	a
 700  0096 5a            	decw	x
 701  0097 26fc          	jrne	L63
 702  0099               L43:
 703  0099 43            	cpl	a
 704  009a 6b01          	ld	(OFST-1,sp),a
 706                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 708  009c 7b03          	ld	a,(OFST+1,sp)
 709  009e a403          	and	a,#3
 710  00a0 48            	sll	a
 711  00a1 5f            	clrw	x
 712  00a2 97            	ld	xl,a
 713  00a3 7b04          	ld	a,(OFST+2,sp)
 714  00a5 5d            	tnzw	x
 715  00a6 2704          	jreq	L04
 716  00a8               L24:
 717  00a8 48            	sll	a
 718  00a9 5a            	decw	x
 719  00aa 26fc          	jrne	L24
 720  00ac               L04:
 721  00ac 6b02          	ld	(OFST+0,sp),a
 723                     ; 253   switch (IRQn)
 725  00ae 7b03          	ld	a,(OFST+1,sp)
 727                     ; 309     default:
 727                     ; 310       break;
 728  00b0 4a            	dec	a
 729  00b1 a11d          	cp	a,#29
 730  00b3 2503cc014d    	jruge	L762
 731  00b8 5f            	clrw	x
 732  00b9 97            	ld	xl,a
 733  00ba 58            	sllw	x
 734  00bb de003a        	ldw	x,(L64,x)
 735  00be fc            	jp	(x)
 736  00bf               L112:
 737                     ; 255     case FLASH_IRQn:
 737                     ; 256       ITC->ISPR1 &= Mask;
 739  00bf c67f70        	ld	a,32624
 740  00c2 1401          	and	a,(OFST-1,sp)
 741  00c4 c77f70        	ld	32624,a
 742                     ; 257       ITC->ISPR1 |= NewPriority;
 744  00c7 c67f70        	ld	a,32624
 745  00ca 1a02          	or	a,(OFST+0,sp)
 746  00cc c77f70        	ld	32624,a
 747                     ; 258       break;
 749  00cf 207c          	jra	L762
 750  00d1               L312:
 751                     ; 260     case AWU_IRQn:
 751                     ; 261     case EXTIB_IRQn:
 751                     ; 262     case EXTID_IRQn:
 751                     ; 263       ITC->ISPR2 &= Mask;
 753  00d1 c67f71        	ld	a,32625
 754  00d4 1401          	and	a,(OFST-1,sp)
 755  00d6 c77f71        	ld	32625,a
 756                     ; 264       ITC->ISPR2 |= NewPriority;
 758  00d9 c67f71        	ld	a,32625
 759  00dc 1a02          	or	a,(OFST+0,sp)
 760  00de c77f71        	ld	32625,a
 761                     ; 265       break;
 763  00e1 206a          	jra	L762
 764  00e3               L512:
 765                     ; 267     case EXTI0_IRQn:
 765                     ; 268     case EXTI1_IRQn:
 765                     ; 269     case EXTI2_IRQn:
 765                     ; 270     case EXTI3_IRQn:
 765                     ; 271       ITC->ISPR3 &= Mask;
 767  00e3 c67f72        	ld	a,32626
 768  00e6 1401          	and	a,(OFST-1,sp)
 769  00e8 c77f72        	ld	32626,a
 770                     ; 272       ITC->ISPR3 |= NewPriority;
 772  00eb c67f72        	ld	a,32626
 773  00ee 1a02          	or	a,(OFST+0,sp)
 774  00f0 c77f72        	ld	32626,a
 775                     ; 273       break;
 777  00f3 2058          	jra	L762
 778  00f5               L712:
 779                     ; 275     case EXTI4_IRQn:
 779                     ; 276     case EXTI5_IRQn:
 779                     ; 277     case EXTI6_IRQn:
 779                     ; 278     case EXTI7_IRQn:
 779                     ; 279       ITC->ISPR4 &= Mask;
 781  00f5 c67f73        	ld	a,32627
 782  00f8 1401          	and	a,(OFST-1,sp)
 783  00fa c77f73        	ld	32627,a
 784                     ; 280       ITC->ISPR4 |= NewPriority;
 786  00fd c67f73        	ld	a,32627
 787  0100 1a02          	or	a,(OFST+0,sp)
 788  0102 c77f73        	ld	32627,a
 789                     ; 281       break;
 791  0105 2046          	jra	L762
 792  0107               L122:
 793                     ; 283     case COMP_IRQn:
 793                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 793                     ; 285       ITC->ISPR5 &= Mask;
 795  0107 c67f74        	ld	a,32628
 796  010a 1401          	and	a,(OFST-1,sp)
 797  010c c77f74        	ld	32628,a
 798                     ; 286       ITC->ISPR5 |= NewPriority;
 800  010f c67f74        	ld	a,32628
 801  0112 1a02          	or	a,(OFST+0,sp)
 802  0114 c77f74        	ld	32628,a
 803                     ; 287       break;
 805  0117 2034          	jra	L762
 806  0119               L322:
 807                     ; 289     case TIM2_CAP_IRQn:
 807                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 807                     ; 291     case TIM3_CAP_IRQn:
 807                     ; 292       ITC->ISPR6 &= Mask;
 809  0119 c67f75        	ld	a,32629
 810  011c 1401          	and	a,(OFST-1,sp)
 811  011e c77f75        	ld	32629,a
 812                     ; 293       ITC->ISPR6 |= NewPriority;
 814  0121 c67f75        	ld	a,32629
 815  0124 1a02          	or	a,(OFST+0,sp)
 816  0126 c77f75        	ld	32629,a
 817                     ; 294       break;
 819  0129 2022          	jra	L762
 820  012b               L522:
 821                     ; 296     case TIM4_UPD_OVF_IRQn:
 821                     ; 297     case SPI_IRQn:
 821                     ; 298     case USART_TX_IRQn:
 821                     ; 299       ITC->ISPR7 &= Mask;
 823  012b c67f76        	ld	a,32630
 824  012e 1401          	and	a,(OFST-1,sp)
 825  0130 c77f76        	ld	32630,a
 826                     ; 300       ITC->ISPR7 |= NewPriority;
 828  0133 c67f76        	ld	a,32630
 829  0136 1a02          	or	a,(OFST+0,sp)
 830  0138 c77f76        	ld	32630,a
 831                     ; 301       break;
 833  013b 2010          	jra	L762
 834  013d               L722:
 835                     ; 303     case USART_RX_IRQn:
 835                     ; 304     case I2C_IRQn:
 835                     ; 305       ITC->ISPR8 &= Mask;
 837  013d c67f77        	ld	a,32631
 838  0140 1401          	and	a,(OFST-1,sp)
 839  0142 c77f77        	ld	32631,a
 840                     ; 306       ITC->ISPR8 |= NewPriority;
 842  0145 c67f77        	ld	a,32631
 843  0148 1a02          	or	a,(OFST+0,sp)
 844  014a c77f77        	ld	32631,a
 845                     ; 307       break;
 847                     ; 309     default:
 847                     ; 310       break;
 849  014d               L762:
 850                     ; 312 }
 853  014d 5b04          	addw	sp,#4
 854  014f 81            	ret	
 867                     	xdef	_ITC_SetSoftwarePriority
 868                     	xdef	_ITC_GetSoftwarePriority
 869                     	xdef	_ITC_GetSoftIntStatus
 870                     	xdef	_ITC_DeInit
 871                     	xdef	_ITC_GetCPUCC
 890                     	end
