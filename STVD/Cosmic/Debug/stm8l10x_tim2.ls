   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 63 void TIM2_DeInit(void)
  45                     ; 64 {
  47                     	switch	.text
  48  0000               _TIM2_DeInit:
  52                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  54  0000 725f5250      	clr	21072
  55                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  57  0004 725f5251      	clr	21073
  58                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  60  0008 725f5252      	clr	21074
  61                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  63  000c 725f5253      	clr	21075
  64                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  66  0010 725f5254      	clr	21076
  67                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  69  0014 725f5256      	clr	21078
  70                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  72  0018 725f525a      	clr	21082
  73                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  75  001c 35015258      	mov	21080,#1
  76                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  78  0020 35015259      	mov	21081,#1
  79                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  81  0024 725f525a      	clr	21082
  82                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  84  0028 725f5258      	clr	21080
  85                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  87  002c 725f5259      	clr	21081
  88                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  90  0030 725f525b      	clr	21083
  91                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  93  0034 725f525c      	clr	21084
  94                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  96  0038 725f525d      	clr	21085
  97                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  99  003c 35ff525e      	mov	21086,#255
 100                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 102  0040 35ff525f      	mov	21087,#255
 103                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 105  0044 725f5260      	clr	21088
 106                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 108  0048 725f5261      	clr	21089
 109                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 111  004c 725f5262      	clr	21090
 112                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 114  0050 725f5263      	clr	21091
 115                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 117  0054 725f5265      	clr	21093
 118                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 120  0058 35015257      	mov	21079,#1
 121                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 123  005c 725f5264      	clr	21092
 124                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 126  0060 725f5255      	clr	21077
 127                     ; 100 }
 130  0064 81            	ret	
 292                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 292                     ; 126                        uint16_t TIM2_Period)
 292                     ; 127 {
 293                     	switch	.text
 294  0065               _TIM2_TimeBaseInit:
 296       fffffffe      OFST: set -2
 299                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 301                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 303                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 305  0065 7b03          	ld	a,(OFST+5,sp)
 306  0067 c7525e        	ld	21086,a
 307                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 309  006a 7b04          	ld	a,(OFST+6,sp)
 310  006c c7525f        	ld	21087,a
 311                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 313  006f 9e            	ld	a,xh
 314  0070 c7525d        	ld	21085,a
 315                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 317  0073 c65250        	ld	a,21072
 318  0076 a48f          	and	a,#143
 319  0078 c75250        	ld	21072,a
 320                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 322  007b 9f            	ld	a,xl
 323  007c ca5250        	or	a,21072
 324  007f c75250        	ld	21072,a
 325                     ; 142 }
 328  0082 81            	ret	
 526                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 526                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 526                     ; 171                   uint16_t TIM2_Pulse,
 526                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 526                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 526                     ; 174 {
 527                     	switch	.text
 528  0083               _TIM2_OC1Init:
 530  0083 89            	pushw	x
 531  0084 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 175   uint8_t tmpccmr1 = 0;
 537                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 539                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 541                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 543                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 545                     ; 183   tmpccmr1 = TIM2->CCMR1;
 547  0085 c65258        	ld	a,21080
 548  0088 6b01          	ld	(OFST+0,sp),a
 550                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 552  008a 7211525a      	bres	21082,#0
 553                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 555  008e a48f          	and	a,#143
 556  0090 6b01          	ld	(OFST+0,sp),a
 558                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 560  0092 9e            	ld	a,xh
 561  0093 1a01          	or	a,(OFST+0,sp)
 562  0095 6b01          	ld	(OFST+0,sp),a
 564                     ; 193   TIM2->CCMR1 = tmpccmr1;
 566  0097 c75258        	ld	21080,a
 567                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 569  009a 9f            	ld	a,xl
 570  009b 4a            	dec	a
 571  009c 2606          	jrne	L722
 572                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 574  009e 7210525a      	bset	21082,#0
 576  00a2 2004          	jra	L132
 577  00a4               L722:
 578                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 580  00a4 7211525a      	bres	21082,#0
 581  00a8               L132:
 582                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 584  00a8 7b08          	ld	a,(OFST+7,sp)
 585  00aa 4a            	dec	a
 586  00ab 2606          	jrne	L332
 587                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 589  00ad 7212525a      	bset	21082,#1
 591  00b1 2004          	jra	L532
 592  00b3               L332:
 593                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 595  00b3 7213525a      	bres	21082,#1
 596  00b7               L532:
 597                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 599  00b7 7b09          	ld	a,(OFST+8,sp)
 600  00b9 4a            	dec	a
 601  00ba 2606          	jrne	L732
 602                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 604  00bc 72105265      	bset	21093,#0
 606  00c0 2004          	jra	L142
 607  00c2               L732:
 608                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 610  00c2 72115265      	bres	21093,#0
 611  00c6               L142:
 612                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 614  00c6 7b06          	ld	a,(OFST+5,sp)
 615  00c8 c75260        	ld	21088,a
 616                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 618  00cb 7b07          	ld	a,(OFST+6,sp)
 619  00cd c75261        	ld	21089,a
 620                     ; 228 }
 623  00d0 5b03          	addw	sp,#3
 624  00d2 81            	ret	
 707                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 707                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 707                     ; 257                   uint16_t TIM2_Pulse,
 707                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 707                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 707                     ; 260 {
 708                     	switch	.text
 709  00d3               _TIM2_OC2Init:
 711  00d3 89            	pushw	x
 712  00d4 88            	push	a
 713       00000001      OFST:	set	1
 716                     ; 261   uint8_t tmpccmr2 = 0;
 718                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 720                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 722                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 724                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 726                     ; 269   tmpccmr2 = TIM2->CCMR2;
 728  00d5 c65259        	ld	a,21081
 729  00d8 6b01          	ld	(OFST+0,sp),a
 731                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 733  00da 7219525a      	bres	21082,#4
 734                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 736  00de a48f          	and	a,#143
 737  00e0 6b01          	ld	(OFST+0,sp),a
 739                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 741  00e2 9e            	ld	a,xh
 742  00e3 1a01          	or	a,(OFST+0,sp)
 743  00e5 6b01          	ld	(OFST+0,sp),a
 745                     ; 280   TIM2->CCMR2 = tmpccmr2;
 747  00e7 c75259        	ld	21081,a
 748                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 750  00ea 9f            	ld	a,xl
 751  00eb 4a            	dec	a
 752  00ec 2606          	jrne	L503
 753                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 755  00ee 7218525a      	bset	21082,#4
 757  00f2 2004          	jra	L703
 758  00f4               L503:
 759                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 761  00f4 7219525a      	bres	21082,#4
 762  00f8               L703:
 763                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 765  00f8 7b08          	ld	a,(OFST+7,sp)
 766  00fa 4a            	dec	a
 767  00fb 2606          	jrne	L113
 768                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 770  00fd 721a525a      	bset	21082,#5
 772  0101 2004          	jra	L313
 773  0103               L113:
 774                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 776  0103 721b525a      	bres	21082,#5
 777  0107               L313:
 778                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 780  0107 7b09          	ld	a,(OFST+8,sp)
 781  0109 4a            	dec	a
 782  010a 2606          	jrne	L513
 783                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 785  010c 72145265      	bset	21093,#2
 787  0110 2004          	jra	L713
 788  0112               L513:
 789                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 791  0112 72155265      	bres	21093,#2
 792  0116               L713:
 793                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 795  0116 7b06          	ld	a,(OFST+5,sp)
 796  0118 c75262        	ld	21090,a
 797                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 799  011b 7b07          	ld	a,(OFST+6,sp)
 800  011d c75263        	ld	21091,a
 801                     ; 316 }
 804  0120 5b03          	addw	sp,#3
 805  0122 81            	ret	
1003                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1003                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1003                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1003                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1003                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1003                     ; 349 
1003                     ; 350 {
1004                     	switch	.text
1005  0123               _TIM2_BKRConfig:
1007  0123 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1013                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1015                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1017                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1019                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1021                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1021                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1021                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1023  0124 9f            	ld	a,xl
1024  0125 1a01          	or	a,(OFST+1,sp)
1025  0127 1a05          	or	a,(OFST+5,sp)
1026  0129 1a06          	or	a,(OFST+6,sp)
1027  012b 1a07          	or	a,(OFST+7,sp)
1028  012d c75264        	ld	21092,a
1029                     ; 364 }
1032  0130 85            	popw	x
1033  0131 81            	ret	
1217                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1217                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1217                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1217                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1217                     ; 394                  uint8_t TIM2_ICFilter)
1217                     ; 395 {
1218                     	switch	.text
1219  0132               _TIM2_ICInit:
1221  0132 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1227                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1229  0133 9e            	ld	a,xh
1230  0134 4d            	tnz	a
1231  0135 2614          	jrne	L735
1232                     ; 402     TI1_Config(TIM2_ICPolarity,
1232                     ; 403                TIM2_ICSelection,
1232                     ; 404                TIM2_ICFilter);
1234  0137 7b07          	ld	a,(OFST+7,sp)
1235  0139 88            	push	a
1236  013a 7b06          	ld	a,(OFST+6,sp)
1237  013c 97            	ld	xl,a
1238  013d 7b03          	ld	a,(OFST+3,sp)
1239  013f 95            	ld	xh,a
1240  0140 cd052d        	call	L3_TI1_Config
1242  0143 84            	pop	a
1243                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1245  0144 7b06          	ld	a,(OFST+6,sp)
1246  0146 cd0461        	call	_TIM2_SetIC1Prescaler
1249  0149 2012          	jra	L145
1250  014b               L735:
1251                     ; 412     TI2_Config(TIM2_ICPolarity,
1251                     ; 413                TIM2_ICSelection,
1251                     ; 414                TIM2_ICFilter);
1253  014b 7b07          	ld	a,(OFST+7,sp)
1254  014d 88            	push	a
1255  014e 7b06          	ld	a,(OFST+6,sp)
1256  0150 97            	ld	xl,a
1257  0151 7b03          	ld	a,(OFST+3,sp)
1258  0153 95            	ld	xh,a
1259  0154 cd0565        	call	L5_TI2_Config
1261  0157 84            	pop	a
1262                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1264  0158 7b06          	ld	a,(OFST+6,sp)
1265  015a cd046f        	call	_TIM2_SetIC2Prescaler
1267  015d               L145:
1268                     ; 418 }
1271  015d 85            	popw	x
1272  015e 81            	ret	
1368                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1368                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1368                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1368                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1368                     ; 448                      uint8_t TIM2_ICFilter)
1368                     ; 449 {
1369                     	switch	.text
1370  015f               _TIM2_PWMIConfig:
1372  015f 89            	pushw	x
1373  0160 89            	pushw	x
1374       00000002      OFST:	set	2
1377                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1379                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1381                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1383                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1385  0161 9f            	ld	a,xl
1386  0162 4d            	tnz	a
1387  0163 2605          	jrne	L116
1388                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1390  0165 4c            	inc	a
1391  0166 6b01          	ld	(OFST-1,sp),a
1394  0168 2002          	jra	L316
1395  016a               L116:
1396                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1398  016a 0f01          	clr	(OFST-1,sp)
1400  016c               L316:
1401                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1403  016c 7b07          	ld	a,(OFST+5,sp)
1404  016e 4a            	dec	a
1405  016f 2604          	jrne	L516
1406                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1408  0171 a602          	ld	a,#2
1410  0173 2002          	jra	L716
1411  0175               L516:
1412                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1414  0175 a601          	ld	a,#1
1415  0177               L716:
1416  0177 6b02          	ld	(OFST+0,sp),a
1418                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1420  0179 7b03          	ld	a,(OFST+1,sp)
1421  017b 2626          	jrne	L126
1422                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1422                     ; 480                TIM2_ICFilter);
1424  017d 7b09          	ld	a,(OFST+7,sp)
1425  017f 88            	push	a
1426  0180 7b08          	ld	a,(OFST+6,sp)
1427  0182 97            	ld	xl,a
1428  0183 7b05          	ld	a,(OFST+3,sp)
1429  0185 95            	ld	xh,a
1430  0186 cd052d        	call	L3_TI1_Config
1432  0189 84            	pop	a
1433                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1435  018a 7b08          	ld	a,(OFST+6,sp)
1436  018c cd0461        	call	_TIM2_SetIC1Prescaler
1438                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1440  018f 7b09          	ld	a,(OFST+7,sp)
1441  0191 88            	push	a
1442  0192 7b03          	ld	a,(OFST+1,sp)
1443  0194 97            	ld	xl,a
1444  0195 7b02          	ld	a,(OFST+0,sp)
1445  0197 95            	ld	xh,a
1446  0198 cd0565        	call	L5_TI2_Config
1448  019b 84            	pop	a
1449                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1451  019c 7b08          	ld	a,(OFST+6,sp)
1452  019e cd046f        	call	_TIM2_SetIC2Prescaler
1455  01a1 2024          	jra	L326
1456  01a3               L126:
1457                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1457                     ; 495                TIM2_ICFilter);
1459  01a3 7b09          	ld	a,(OFST+7,sp)
1460  01a5 88            	push	a
1461  01a6 7b08          	ld	a,(OFST+6,sp)
1462  01a8 97            	ld	xl,a
1463  01a9 7b05          	ld	a,(OFST+3,sp)
1464  01ab 95            	ld	xh,a
1465  01ac cd0565        	call	L5_TI2_Config
1467  01af 84            	pop	a
1468                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1470  01b0 7b08          	ld	a,(OFST+6,sp)
1471  01b2 cd046f        	call	_TIM2_SetIC2Prescaler
1473                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1475  01b5 7b09          	ld	a,(OFST+7,sp)
1476  01b7 88            	push	a
1477  01b8 7b03          	ld	a,(OFST+1,sp)
1478  01ba 97            	ld	xl,a
1479  01bb 7b02          	ld	a,(OFST+0,sp)
1480  01bd 95            	ld	xh,a
1481  01be cd052d        	call	L3_TI1_Config
1483  01c1 84            	pop	a
1484                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1486  01c2 7b08          	ld	a,(OFST+6,sp)
1487  01c4 cd0461        	call	_TIM2_SetIC1Prescaler
1489  01c7               L326:
1490                     ; 506 }
1493  01c7 5b04          	addw	sp,#4
1494  01c9 81            	ret	
1549                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1549                     ; 515 {
1550                     	switch	.text
1551  01ca               _TIM2_Cmd:
1555                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1557                     ; 520   if (NewState != DISABLE)
1559  01ca 4d            	tnz	a
1560  01cb 2705          	jreq	L356
1561                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1563  01cd 72105250      	bset	21072,#0
1566  01d1 81            	ret	
1567  01d2               L356:
1568                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1570  01d2 72115250      	bres	21072,#0
1571                     ; 528 }
1574  01d6 81            	ret	
1610                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1610                     ; 537 {
1611                     	switch	.text
1612  01d7               _TIM2_CtrlPWMOutputs:
1616                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1618                     ; 543   if (NewState != DISABLE)
1620  01d7 4d            	tnz	a
1621  01d8 2705          	jreq	L576
1622                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1624  01da 721e5264      	bset	21092,#7
1627  01de 81            	ret	
1628  01df               L576:
1629                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1631  01df 721f5264      	bres	21092,#7
1632                     ; 551 }
1635  01e3 81            	ret	
1721                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1721                     ; 567 {
1722                     	switch	.text
1723  01e4               _TIM2_ITConfig:
1725  01e4 89            	pushw	x
1726       00000000      OFST:	set	0
1729                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1731                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1733                     ; 572   if (NewState != DISABLE)
1735  01e5 9f            	ld	a,xl
1736  01e6 4d            	tnz	a
1737  01e7 2706          	jreq	L147
1738                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1740  01e9 9e            	ld	a,xh
1741  01ea ca5254        	or	a,21076
1743  01ed 2006          	jra	L347
1744  01ef               L147:
1745                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1747  01ef 7b01          	ld	a,(OFST+1,sp)
1748  01f1 43            	cpl	a
1749  01f2 c45254        	and	a,21076
1750  01f5               L347:
1751  01f5 c75254        	ld	21076,a
1752                     ; 582 }
1755  01f8 85            	popw	x
1756  01f9 81            	ret	
1780                     ; 589 void TIM2_InternalClockConfig(void)
1780                     ; 590 {
1781                     	switch	.text
1782  01fa               _TIM2_InternalClockConfig:
1786                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1788  01fa c65252        	ld	a,21074
1789  01fd a4f8          	and	a,#248
1790  01ff c75252        	ld	21074,a
1791                     ; 593 }
1794  0202 81            	ret	
1911                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1911                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1911                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1911                     ; 614 {
1912                     	switch	.text
1913  0203               _TIM2_ETRClockMode1Config:
1915  0203 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1921  0204 7b05          	ld	a,(OFST+5,sp)
1922  0206 88            	push	a
1923  0207 7b02          	ld	a,(OFST+2,sp)
1924  0209 95            	ld	xh,a
1925  020a ad33          	call	_TIM2_ETRConfig
1927  020c 84            	pop	a
1928                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1930  020d c65252        	ld	a,21074
1931  0210 a4f8          	and	a,#248
1932  0212 c75252        	ld	21074,a
1933                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1935  0215 c65252        	ld	a,21074
1936  0218 aa07          	or	a,#7
1937  021a c75252        	ld	21074,a
1938                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1940  021d c65252        	ld	a,21074
1941  0220 a48f          	and	a,#143
1942  0222 c75252        	ld	21074,a
1943                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1945  0225 c65252        	ld	a,21074
1946  0228 aa70          	or	a,#112
1947  022a c75252        	ld	21074,a
1948                     ; 625 }
1951  022d 85            	popw	x
1952  022e 81            	ret	
2010                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2010                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2010                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2010                     ; 637 {
2011                     	switch	.text
2012  022f               _TIM2_ETRClockMode2Config:
2014  022f 89            	pushw	x
2015       00000000      OFST:	set	0
2018                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2020  0230 7b05          	ld	a,(OFST+5,sp)
2021  0232 88            	push	a
2022  0233 7b02          	ld	a,(OFST+2,sp)
2023  0235 95            	ld	xh,a
2024  0236 ad07          	call	_TIM2_ETRConfig
2026  0238 721c5253      	bset	21075,#6
2027                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2029                     ; 643 }
2032  023c 5b03          	addw	sp,#3
2033  023e 81            	ret	
2089                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2089                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2089                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2089                     ; 663 {
2090                     	switch	.text
2091  023f               _TIM2_ETRConfig:
2093  023f 89            	pushw	x
2094       00000000      OFST:	set	0
2097                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2099                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2101                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2103                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2105  0240 9f            	ld	a,xl
2106  0241 1a01          	or	a,(OFST+1,sp)
2107  0243 1a05          	or	a,(OFST+5,sp)
2108  0245 ca5253        	or	a,21075
2109  0248 c75253        	ld	21075,a
2110                     ; 670 }
2113  024b 85            	popw	x
2114  024c 81            	ret	
2203                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2203                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2203                     ; 689                                  uint8_t TIM2_ICFilter)
2203                     ; 690 {
2204                     	switch	.text
2205  024d               _TIM2_TIxExternalClockConfig:
2207  024d 89            	pushw	x
2208       00000000      OFST:	set	0
2211                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2213                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2215                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2217                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2219  024e 9e            	ld	a,xh
2220  024f a160          	cp	a,#96
2221  0251 260d          	jrne	L3411
2222                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2224  0253 7b05          	ld	a,(OFST+5,sp)
2225  0255 88            	push	a
2226  0256 9f            	ld	a,xl
2227  0257 ae0001        	ldw	x,#1
2228  025a 95            	ld	xh,a
2229  025b cd0565        	call	L5_TI2_Config
2232  025e 200c          	jra	L5411
2233  0260               L3411:
2234                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2236  0260 7b05          	ld	a,(OFST+5,sp)
2237  0262 88            	push	a
2238  0263 7b03          	ld	a,(OFST+3,sp)
2239  0265 ae0001        	ldw	x,#1
2240  0268 95            	ld	xh,a
2241  0269 cd052d        	call	L3_TI1_Config
2243  026c               L5411:
2244  026c 84            	pop	a
2245                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2247  026d 7b01          	ld	a,(OFST+1,sp)
2248  026f ad0a          	call	_TIM2_SelectInputTrigger
2250                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2252  0271 c65252        	ld	a,21074
2253  0274 aa07          	or	a,#7
2254  0276 c75252        	ld	21074,a
2255                     ; 711 }
2258  0279 85            	popw	x
2259  027a 81            	ret	
2359                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2359                     ; 728 {
2360                     	switch	.text
2361  027b               _TIM2_SelectInputTrigger:
2363  027b 88            	push	a
2364  027c 88            	push	a
2365       00000001      OFST:	set	1
2368                     ; 729   uint8_t tmpsmcr = 0;
2370                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2372                     ; 734   tmpsmcr = TIM2->SMCR;
2374  027d c65252        	ld	a,21074
2376                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2378  0280 a48f          	and	a,#143
2380                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2382  0282 1a02          	or	a,(OFST+1,sp)
2384                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2386  0284 c75252        	ld	21074,a
2387                     ; 741 }
2390  0287 85            	popw	x
2391  0288 81            	ret	
2427                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2427                     ; 750 {
2428                     	switch	.text
2429  0289               _TIM2_UpdateDisableConfig:
2433                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2435                     ; 755   if (NewState != DISABLE)
2437  0289 4d            	tnz	a
2438  028a 2705          	jreq	L7221
2439                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2441  028c 72125250      	bset	21072,#1
2444  0290 81            	ret	
2445  0291               L7221:
2446                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2448  0291 72135250      	bres	21072,#1
2449                     ; 763 }
2452  0295 81            	ret	
2510                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2510                     ; 774 {
2511                     	switch	.text
2512  0296               _TIM2_UpdateRequestConfig:
2516                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2518                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2520  0296 4a            	dec	a
2521  0297 2605          	jrne	L1621
2522                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2524  0299 72145250      	bset	21072,#2
2527  029d 81            	ret	
2528  029e               L1621:
2529                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2531  029e 72155250      	bres	21072,#2
2532                     ; 787 }
2535  02a2 81            	ret	
2571                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2571                     ; 796 {
2572                     	switch	.text
2573  02a3               _TIM2_SelectHallSensor:
2577                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2579                     ; 801   if (NewState != DISABLE)
2581  02a3 4d            	tnz	a
2582  02a4 2705          	jreq	L3031
2583                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2585  02a6 721e5251      	bset	21073,#7
2588  02aa 81            	ret	
2589  02ab               L3031:
2590                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2592  02ab 721f5251      	bres	21073,#7
2593                     ; 809 }
2596  02af 81            	ret	
2653                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2653                     ; 820 {
2654                     	switch	.text
2655  02b0               _TIM2_SelectOnePulseMode:
2659                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2661                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2663  02b0 4a            	dec	a
2664  02b1 2605          	jrne	L5331
2665                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2667  02b3 72165250      	bset	21072,#3
2670  02b7 81            	ret	
2671  02b8               L5331:
2672                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2674  02b8 72175250      	bres	21072,#3
2675                     ; 833 }
2678  02bc 81            	ret	
2777                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2777                     ; 848 {
2778                     	switch	.text
2779  02bd               _TIM2_SelectOutputTrigger:
2781  02bd 88            	push	a
2782  02be 88            	push	a
2783       00000001      OFST:	set	1
2786                     ; 849   uint8_t tmpcr2 = 0;
2788                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2790                     ; 854   tmpcr2 = TIM2->CR2;
2792  02bf c65251        	ld	a,21073
2794                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2796  02c2 a48f          	and	a,#143
2798                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2800  02c4 1a02          	or	a,(OFST+1,sp)
2802                     ; 862   TIM2->CR2 = tmpcr2;
2804  02c6 c75251        	ld	21073,a
2805                     ; 863 }
2808  02c9 85            	popw	x
2809  02ca 81            	ret	
2892                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2892                     ; 876 {
2893                     	switch	.text
2894  02cb               _TIM2_SelectSlaveMode:
2896  02cb 88            	push	a
2897  02cc 88            	push	a
2898       00000001      OFST:	set	1
2901                     ; 877   uint8_t tmpsmcr = 0;
2903                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2905                     ; 882   tmpsmcr = TIM2->SMCR;
2907  02cd c65252        	ld	a,21074
2909                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2911  02d0 a4f8          	and	a,#248
2913                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2915  02d2 1a02          	or	a,(OFST+1,sp)
2917                     ; 890   TIM2->SMCR = tmpsmcr;
2919  02d4 c75252        	ld	21074,a
2920                     ; 891 }
2923  02d7 85            	popw	x
2924  02d8 81            	ret	
2960                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2960                     ; 900 {
2961                     	switch	.text
2962  02d9               _TIM2_SelectMasterSlaveMode:
2966                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2968                     ; 905   if (NewState != DISABLE)
2970  02d9 4d            	tnz	a
2971  02da 2705          	jreq	L7541
2972                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
2974  02dc 721e5252      	bset	21074,#7
2977  02e0 81            	ret	
2978  02e1               L7541:
2979                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2981  02e1 721f5252      	bres	21074,#7
2982                     ; 913 }
2985  02e5 81            	ret	
3098                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3098                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3098                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3098                     ; 935 {
3099                     	switch	.text
3100  02e6               _TIM2_EncoderInterfaceConfig:
3102  02e6 89            	pushw	x
3103  02e7 5203          	subw	sp,#3
3104       00000003      OFST:	set	3
3107                     ; 936   uint8_t tmpsmcr = 0;
3109                     ; 937   uint8_t tmpccmr1 = 0;
3111                     ; 938   uint8_t tmpccmr2 = 0;
3113                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3115                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3117                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3119                     ; 945   tmpsmcr = TIM2->SMCR;
3121  02e9 c65252        	ld	a,21074
3122  02ec 6b01          	ld	(OFST-2,sp),a
3124                     ; 946   tmpccmr1 = TIM2->CCMR1;
3126  02ee c65258        	ld	a,21080
3127  02f1 6b02          	ld	(OFST-1,sp),a
3129                     ; 947   tmpccmr2 = TIM2->CCMR2;
3131  02f3 c65259        	ld	a,21081
3132  02f6 6b03          	ld	(OFST+0,sp),a
3134                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3136  02f8 7b01          	ld	a,(OFST-2,sp)
3137  02fa a4f0          	and	a,#240
3138  02fc 6b01          	ld	(OFST-2,sp),a
3140                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3142  02fe 9e            	ld	a,xh
3143  02ff 1a01          	or	a,(OFST-2,sp)
3144  0301 6b01          	ld	(OFST-2,sp),a
3146                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3148  0303 7b02          	ld	a,(OFST-1,sp)
3149  0305 a4fc          	and	a,#252
3150  0307 6b02          	ld	(OFST-1,sp),a
3152                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3154  0309 7b03          	ld	a,(OFST+0,sp)
3155  030b a4fc          	and	a,#252
3156  030d 6b03          	ld	(OFST+0,sp),a
3158                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3160  030f 7b02          	ld	a,(OFST-1,sp)
3161  0311 aa01          	or	a,#1
3162  0313 6b02          	ld	(OFST-1,sp),a
3164                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3166  0315 7b03          	ld	a,(OFST+0,sp)
3167  0317 aa01          	or	a,#1
3168  0319 6b03          	ld	(OFST+0,sp),a
3170                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3172  031b 9f            	ld	a,xl
3173  031c 4a            	dec	a
3174  031d 2606          	jrne	L7351
3175                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3177  031f 7212525a      	bset	21082,#1
3179  0323 2004          	jra	L1451
3180  0325               L7351:
3181                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3183  0325 7213525a      	bres	21082,#1
3184  0329               L1451:
3185                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3187  0329 7b08          	ld	a,(OFST+5,sp)
3188  032b 4a            	dec	a
3189  032c 2606          	jrne	L3451
3190                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3192  032e 721a525a      	bset	21082,#5
3194  0332 2004          	jra	L5451
3195  0334               L3451:
3196                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3198  0334 721b525a      	bres	21082,#5
3199  0338               L5451:
3200                     ; 978   TIM2->SMCR = tmpsmcr;
3202  0338 7b01          	ld	a,(OFST-2,sp)
3203  033a c75252        	ld	21074,a
3204                     ; 979   TIM2->CCMR1 = tmpccmr1;
3206  033d 7b02          	ld	a,(OFST-1,sp)
3207  033f c75258        	ld	21080,a
3208                     ; 980   TIM2->CCMR2 = tmpccmr2;
3210  0342 7b03          	ld	a,(OFST+0,sp)
3211  0344 c75259        	ld	21081,a
3212                     ; 981 }
3215  0347 5b05          	addw	sp,#5
3216  0349 81            	ret	
3284                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3284                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3284                     ; 1003 {
3285                     	switch	.text
3286  034a               _TIM2_PrescalerConfig:
3290                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3292                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3294                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3296  034a 9e            	ld	a,xh
3297  034b c7525d        	ld	21085,a
3298                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3300  034e 9f            	ld	a,xl
3301  034f 4a            	dec	a
3302  0350 2605          	jrne	L1061
3303                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3305  0352 72105257      	bset	21079,#0
3308  0356 81            	ret	
3309  0357               L1061:
3310                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3312  0357 72115257      	bres	21079,#0
3313                     ; 1020 }
3316  035b 81            	ret	
3361                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3361                     ; 1034 {
3362                     	switch	.text
3363  035c               _TIM2_CounterModeConfig:
3365  035c 88            	push	a
3366  035d 88            	push	a
3367       00000001      OFST:	set	1
3370                     ; 1035   uint8_t tmpcr1 = 0;
3372                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3374                     ; 1040   tmpcr1 = TIM2->CR1;
3376  035e c65250        	ld	a,21072
3378                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3380  0361 a48f          	and	a,#143
3382                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3384  0363 1a02          	or	a,(OFST+1,sp)
3386                     ; 1048   TIM2->CR1 = tmpcr1;
3388  0365 c75250        	ld	21072,a
3389                     ; 1049 }
3392  0368 85            	popw	x
3393  0369 81            	ret	
3460                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3460                     ; 1060 {
3461                     	switch	.text
3462  036a               _TIM2_ForcedOC1Config:
3464  036a 88            	push	a
3465  036b 88            	push	a
3466       00000001      OFST:	set	1
3469                     ; 1061   uint8_t tmpccmr1 = 0;
3471                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3473                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3475  036c c65258        	ld	a,21080
3477                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3479  036f a48f          	and	a,#143
3481                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3483  0371 1a02          	or	a,(OFST+1,sp)
3485                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3487  0373 c75258        	ld	21080,a
3488                     ; 1075 }
3491  0376 85            	popw	x
3492  0377 81            	ret	
3537                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3537                     ; 1086 {
3538                     	switch	.text
3539  0378               _TIM2_ForcedOC2Config:
3541  0378 88            	push	a
3542  0379 88            	push	a
3543       00000001      OFST:	set	1
3546                     ; 1087   uint8_t tmpccmr2 = 0;
3548                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3550                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3552  037a c65259        	ld	a,21081
3554                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3556  037d a48f          	and	a,#143
3558                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3560  037f 1a02          	or	a,(OFST+1,sp)
3562                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3564  0381 c75259        	ld	21081,a
3565                     ; 1101 }
3568  0384 85            	popw	x
3569  0385 81            	ret	
3605                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3605                     ; 1110 {
3606                     	switch	.text
3607  0386               _TIM2_ARRPreloadConfig:
3611                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3613                     ; 1115   if (NewState != DISABLE)
3615  0386 4d            	tnz	a
3616  0387 2705          	jreq	L1271
3617                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3619  0389 721e5250      	bset	21072,#7
3622  038d 81            	ret	
3623  038e               L1271:
3624                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3626  038e 721f5250      	bres	21072,#7
3627                     ; 1123 }
3630  0392 81            	ret	
3666                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3666                     ; 1132 {
3667                     	switch	.text
3668  0393               _TIM2_OC1PreloadConfig:
3672                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3674                     ; 1137   if (NewState != DISABLE)
3676  0393 4d            	tnz	a
3677  0394 2705          	jreq	L3471
3678                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3680  0396 72165258      	bset	21080,#3
3683  039a 81            	ret	
3684  039b               L3471:
3685                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3687  039b 72175258      	bres	21080,#3
3688                     ; 1145 }
3691  039f 81            	ret	
3727                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3727                     ; 1154 {
3728                     	switch	.text
3729  03a0               _TIM2_OC2PreloadConfig:
3733                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3735                     ; 1159   if (NewState != DISABLE)
3737  03a0 4d            	tnz	a
3738  03a1 2705          	jreq	L5671
3739                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3741  03a3 72165259      	bset	21081,#3
3744  03a7 81            	ret	
3745  03a8               L5671:
3746                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3748  03a8 72175259      	bres	21081,#3
3749                     ; 1167 }
3752  03ac 81            	ret	
3787                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3787                     ; 1175 {
3788                     	switch	.text
3789  03ad               _TIM2_OC1FastCmd:
3793                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3795                     ; 1180   if (NewState != DISABLE)
3797  03ad 4d            	tnz	a
3798  03ae 2705          	jreq	L7002
3799                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3801  03b0 72145258      	bset	21080,#2
3804  03b4 81            	ret	
3805  03b5               L7002:
3806                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3808  03b5 72155258      	bres	21080,#2
3809                     ; 1188 }
3812  03b9 81            	ret	
3847                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3847                     ; 1196 {
3848                     	switch	.text
3849  03ba               _TIM2_OC2FastCmd:
3853                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3855                     ; 1201   if (NewState != DISABLE)
3857  03ba 4d            	tnz	a
3858  03bb 2705          	jreq	L1302
3859                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3861  03bd 72145259      	bset	21081,#2
3864  03c1 81            	ret	
3865  03c2               L1302:
3866                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3868  03c2 72155259      	bres	21081,#2
3869                     ; 1209 }
3872  03c6 81            	ret	
3953                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3953                     ; 1223 {
3954                     	switch	.text
3955  03c7               _TIM2_GenerateEvent:
3959                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3961                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3963  03c7 ca5257        	or	a,21079
3964  03ca c75257        	ld	21079,a
3965                     ; 1229 }
3968  03cd 81            	ret	
4004                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4004                     ; 1240 {
4005                     	switch	.text
4006  03ce               _TIM2_OC1PolarityConfig:
4010                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4012                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4014  03ce 4a            	dec	a
4015  03cf 2605          	jrne	L7012
4016                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4018  03d1 7212525a      	bset	21082,#1
4021  03d5 81            	ret	
4022  03d6               L7012:
4023                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4025  03d6 7213525a      	bres	21082,#1
4026                     ; 1253 }
4029  03da 81            	ret	
4065                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4065                     ; 1264 {
4066                     	switch	.text
4067  03db               _TIM2_OC2PolarityConfig:
4071                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4073                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4075  03db 4a            	dec	a
4076  03dc 2605          	jrne	L1312
4077                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4079  03de 721a525a      	bset	21082,#5
4082  03e2 81            	ret	
4083  03e3               L1312:
4084                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4086  03e3 721b525a      	bres	21082,#5
4087                     ; 1277 }
4090  03e7 81            	ret	
4135                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4135                     ; 1290                  FunctionalState NewState)
4135                     ; 1291 {
4136                     	switch	.text
4137  03e8               _TIM2_CCxCmd:
4139  03e8 89            	pushw	x
4140       00000000      OFST:	set	0
4143                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4145                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4147                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4149  03e9 9e            	ld	a,xh
4150  03ea 4d            	tnz	a
4151  03eb 2610          	jrne	L7512
4152                     ; 1299     if (NewState != DISABLE)
4154  03ed 9f            	ld	a,xl
4155  03ee 4d            	tnz	a
4156  03ef 2706          	jreq	L1612
4157                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4159  03f1 7210525a      	bset	21082,#0
4161  03f5 2014          	jra	L5612
4162  03f7               L1612:
4163                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4165  03f7 7211525a      	bres	21082,#0
4166  03fb 200e          	jra	L5612
4167  03fd               L7512:
4168                     ; 1312     if (NewState != DISABLE)
4170  03fd 7b02          	ld	a,(OFST+2,sp)
4171  03ff 2706          	jreq	L7612
4172                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4174  0401 7218525a      	bset	21082,#4
4176  0405 2004          	jra	L5612
4177  0407               L7612:
4178                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4180  0407 7219525a      	bres	21082,#4
4181  040b               L5612:
4182                     ; 1322 }
4185  040b 85            	popw	x
4186  040c 81            	ret	
4231                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4231                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4231                     ; 1344 {
4232                     	switch	.text
4233  040d               _TIM2_SelectOCxM:
4235  040d 89            	pushw	x
4236       00000000      OFST:	set	0
4239                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4241                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4243                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4245  040e 9e            	ld	a,xh
4246  040f 4d            	tnz	a
4247  0410 2615          	jrne	L5122
4248                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4250  0412 7211525a      	bres	21082,#0
4251                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4253  0416 c65258        	ld	a,21080
4254  0419 a48f          	and	a,#143
4255  041b c75258        	ld	21080,a
4256                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4258  041e 9f            	ld	a,xl
4259  041f ca5258        	or	a,21080
4260  0422 c75258        	ld	21080,a
4262  0425 2014          	jra	L7122
4263  0427               L5122:
4264                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4266  0427 7219525a      	bres	21082,#4
4267                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4269  042b c65259        	ld	a,21081
4270  042e a48f          	and	a,#143
4271  0430 c75259        	ld	21081,a
4272                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4274  0433 c65259        	ld	a,21081
4275  0436 1a02          	or	a,(OFST+2,sp)
4276  0438 c75259        	ld	21081,a
4277  043b               L7122:
4278                     ; 1371 }
4281  043b 85            	popw	x
4282  043c 81            	ret	
4316                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4316                     ; 1380 {
4317                     	switch	.text
4318  043d               _TIM2_SetCounter:
4322                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4324  043d 9e            	ld	a,xh
4325  043e c7525b        	ld	21083,a
4326                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4328  0441 9f            	ld	a,xl
4329  0442 c7525c        	ld	21084,a
4330                     ; 1385 }
4333  0445 81            	ret	
4367                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4367                     ; 1394 {
4368                     	switch	.text
4369  0446               _TIM2_SetAutoreload:
4373                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4375  0446 9e            	ld	a,xh
4376  0447 c7525e        	ld	21086,a
4377                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4379  044a 9f            	ld	a,xl
4380  044b c7525f        	ld	21087,a
4381                     ; 1398 }
4384  044e 81            	ret	
4418                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4418                     ; 1407 {
4419                     	switch	.text
4420  044f               _TIM2_SetCompare1:
4424                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4426  044f 9e            	ld	a,xh
4427  0450 c75260        	ld	21088,a
4428                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4430  0453 9f            	ld	a,xl
4431  0454 c75261        	ld	21089,a
4432                     ; 1411 }
4435  0457 81            	ret	
4469                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4469                     ; 1420 {
4470                     	switch	.text
4471  0458               _TIM2_SetCompare2:
4475                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4477  0458 9e            	ld	a,xh
4478  0459 c75262        	ld	21090,a
4479                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4481  045c 9f            	ld	a,xl
4482  045d c75263        	ld	21091,a
4483                     ; 1424 }
4486  0460 81            	ret	
4531                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4531                     ; 1437 {
4532                     	switch	.text
4533  0461               _TIM2_SetIC1Prescaler:
4535  0461 88            	push	a
4536  0462 88            	push	a
4537       00000001      OFST:	set	1
4540                     ; 1438   uint8_t tmpccmr1 = 0;
4542                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4544                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4546  0463 c65258        	ld	a,21080
4548                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4550  0466 a4f3          	and	a,#243
4552                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4554  0468 1a02          	or	a,(OFST+1,sp)
4556                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4558  046a c75258        	ld	21080,a
4559                     ; 1452 }
4562  046d 85            	popw	x
4563  046e 81            	ret	
4608                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4608                     ; 1465 {
4609                     	switch	.text
4610  046f               _TIM2_SetIC2Prescaler:
4612  046f 88            	push	a
4613  0470 88            	push	a
4614       00000001      OFST:	set	1
4617                     ; 1466   uint8_t tmpccmr2 = 0;
4619                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4621                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4623  0471 c65259        	ld	a,21081
4625                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4627  0474 a4f3          	and	a,#243
4629                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4631  0476 1a02          	or	a,(OFST+1,sp)
4633                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4635  0478 c75259        	ld	21081,a
4636                     ; 1480 }
4639  047b 85            	popw	x
4640  047c 81            	ret	
4692                     ; 1487 uint16_t TIM2_GetCapture1(void)
4692                     ; 1488 {
4693                     	switch	.text
4694  047d               _TIM2_GetCapture1:
4696  047d 5204          	subw	sp,#4
4697       00000004      OFST:	set	4
4700                     ; 1489   uint16_t tmpccr1 = 0;
4702                     ; 1492   tmpccr1h = TIM2->CCR1H;
4704  047f c65260        	ld	a,21088
4705  0482 6b02          	ld	(OFST-2,sp),a
4707                     ; 1493   tmpccr1l = TIM2->CCR1L;
4709  0484 c65261        	ld	a,21089
4710  0487 6b01          	ld	(OFST-3,sp),a
4712                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4714  0489 5f            	clrw	x
4715  048a 97            	ld	xl,a
4716  048b 1f03          	ldw	(OFST-1,sp),x
4718                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4720  048d 5f            	clrw	x
4721  048e 7b02          	ld	a,(OFST-2,sp)
4722  0490 97            	ld	xl,a
4723  0491 7b04          	ld	a,(OFST+0,sp)
4724  0493 01            	rrwa	x,a
4725  0494 1a03          	or	a,(OFST-1,sp)
4726  0496 01            	rrwa	x,a
4728                     ; 1498   return ((uint16_t)tmpccr1);
4732  0497 5b04          	addw	sp,#4
4733  0499 81            	ret	
4785                     ; 1506 uint16_t TIM2_GetCapture2(void)
4785                     ; 1507 {
4786                     	switch	.text
4787  049a               _TIM2_GetCapture2:
4789  049a 5204          	subw	sp,#4
4790       00000004      OFST:	set	4
4793                     ; 1508   uint16_t tmpccr2 = 0;
4795                     ; 1511   tmpccr2h = TIM2->CCR2H;
4797  049c c65262        	ld	a,21090
4798  049f 6b02          	ld	(OFST-2,sp),a
4800                     ; 1512   tmpccr2l = TIM2->CCR2L;
4802  04a1 c65263        	ld	a,21091
4803  04a4 6b01          	ld	(OFST-3,sp),a
4805                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4807  04a6 5f            	clrw	x
4808  04a7 97            	ld	xl,a
4809  04a8 1f03          	ldw	(OFST-1,sp),x
4811                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4813  04aa 5f            	clrw	x
4814  04ab 7b02          	ld	a,(OFST-2,sp)
4815  04ad 97            	ld	xl,a
4816  04ae 7b04          	ld	a,(OFST+0,sp)
4817  04b0 01            	rrwa	x,a
4818  04b1 1a03          	or	a,(OFST-1,sp)
4819  04b3 01            	rrwa	x,a
4821                     ; 1517   return ((uint16_t)tmpccr2);
4825  04b4 5b04          	addw	sp,#4
4826  04b6 81            	ret	
4878                     ; 1525 uint16_t TIM2_GetCounter(void)
4878                     ; 1526 {
4879                     	switch	.text
4880  04b7               _TIM2_GetCounter:
4882  04b7 5204          	subw	sp,#4
4883       00000004      OFST:	set	4
4886                     ; 1527   uint16_t tmpcnt = 0;
4888                     ; 1530   tmpcntrh = TIM2->CNTRH;
4890  04b9 c6525b        	ld	a,21083
4891  04bc 6b02          	ld	(OFST-2,sp),a
4893                     ; 1531   tmpcntrl = TIM2->CNTRL;
4895  04be c6525c        	ld	a,21084
4896  04c1 6b01          	ld	(OFST-3,sp),a
4898                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4900  04c3 5f            	clrw	x
4901  04c4 97            	ld	xl,a
4902  04c5 1f03          	ldw	(OFST-1,sp),x
4904                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4906  04c7 5f            	clrw	x
4907  04c8 7b02          	ld	a,(OFST-2,sp)
4908  04ca 97            	ld	xl,a
4909  04cb 7b04          	ld	a,(OFST+0,sp)
4910  04cd 01            	rrwa	x,a
4911  04ce 1a03          	or	a,(OFST-1,sp)
4912  04d0 01            	rrwa	x,a
4914                     ; 1536   return ((uint16_t)tmpcnt);
4918  04d1 5b04          	addw	sp,#4
4919  04d3 81            	ret	
4943                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4943                     ; 1545 {
4944                     	switch	.text
4945  04d4               _TIM2_GetPrescaler:
4949                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4951  04d4 c6525d        	ld	a,21085
4954  04d7 81            	ret	
5093                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5093                     ; 1564 {
5094                     	switch	.text
5095  04d8               _TIM2_GetFlagStatus:
5097  04d8 89            	pushw	x
5098  04d9 89            	pushw	x
5099       00000002      OFST:	set	2
5102                     ; 1565   FlagStatus bitstatus = RESET;
5104                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5106                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5108  04da 9f            	ld	a,xl
5109  04db c45255        	and	a,21077
5110  04de 6b01          	ld	(OFST-1,sp),a
5112                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5114  04e0 c65256        	ld	a,21078
5115  04e3 1403          	and	a,(OFST+1,sp)
5116  04e5 6b02          	ld	(OFST+0,sp),a
5118                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5120  04e7 1a01          	or	a,(OFST-1,sp)
5121  04e9 2702          	jreq	L3552
5122                     ; 1576     bitstatus = SET;
5124  04eb a601          	ld	a,#1
5127  04ed               L3552:
5128                     ; 1580     bitstatus = RESET;
5131                     ; 1582   return ((FlagStatus)bitstatus);
5135  04ed 5b04          	addw	sp,#4
5136  04ef 81            	ret	
5171                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5171                     ; 1597 {
5172                     	switch	.text
5173  04f0               _TIM2_ClearFlag:
5175  04f0 89            	pushw	x
5176       00000000      OFST:	set	0
5179                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5181                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5183  04f1 9f            	ld	a,xl
5184  04f2 43            	cpl	a
5185  04f3 c75255        	ld	21077,a
5186                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5188  04f6 7b01          	ld	a,(OFST+1,sp)
5189  04f8 43            	cpl	a
5190  04f9 c75256        	ld	21078,a
5191                     ; 1603 }
5194  04fc 85            	popw	x
5195  04fd 81            	ret	
5259                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5259                     ; 1617 {
5260                     	switch	.text
5261  04fe               _TIM2_GetITStatus:
5263  04fe 88            	push	a
5264  04ff 5203          	subw	sp,#3
5265       00000003      OFST:	set	3
5268                     ; 1618   __IO ITStatus bitstatus = RESET;
5270  0501 0f03          	clr	(OFST+0,sp)
5272                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5274  0503 0f01          	clr	(OFST-2,sp)
5278  0505 0f02          	clr	(OFST-1,sp)
5280                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5282                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5284  0507 c45255        	and	a,21077
5285  050a 6b01          	ld	(OFST-2,sp),a
5287                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5289  050c c65254        	ld	a,21076
5290  050f 1404          	and	a,(OFST+1,sp)
5291  0511 6b02          	ld	(OFST-1,sp),a
5293                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5295  0513 0d01          	tnz	(OFST-2,sp)
5296  0515 270a          	jreq	L7262
5298  0517 0d02          	tnz	(OFST-1,sp)
5299  0519 2706          	jreq	L7262
5300                     ; 1631     bitstatus = (ITStatus)SET;
5302  051b a601          	ld	a,#1
5303  051d 6b03          	ld	(OFST+0,sp),a
5306  051f 2002          	jra	L1362
5307  0521               L7262:
5308                     ; 1635     bitstatus = (ITStatus)RESET;
5310  0521 0f03          	clr	(OFST+0,sp)
5312  0523               L1362:
5313                     ; 1637   return ((ITStatus)bitstatus);
5315  0523 7b03          	ld	a,(OFST+0,sp)
5318  0525 5b04          	addw	sp,#4
5319  0527 81            	ret	
5355                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5355                     ; 1652 {
5356                     	switch	.text
5357  0528               _TIM2_ClearITPendingBit:
5361                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5363                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5365  0528 43            	cpl	a
5366  0529 c75255        	ld	21077,a
5367                     ; 1658 }
5370  052c 81            	ret	
5442                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5442                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5442                     ; 1677                        uint8_t TIM2_ICFilter)
5442                     ; 1678 {
5443                     	switch	.text
5444  052d               L3_TI1_Config:
5446  052d 89            	pushw	x
5447  052e 89            	pushw	x
5448       00000002      OFST:	set	2
5451                     ; 1679   uint8_t tmpccmr1 = 0;
5453                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5455  052f 9e            	ld	a,xh
5456  0530 6b01          	ld	(OFST-1,sp),a
5458                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5460  0532 c65258        	ld	a,21080
5461  0535 6b02          	ld	(OFST+0,sp),a
5463                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5465                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5467                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5469                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5471  0537 7211525a      	bres	21082,#0
5472                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5474  053b a40c          	and	a,#12
5475  053d 6b02          	ld	(OFST+0,sp),a
5477                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5479  053f 7b07          	ld	a,(OFST+5,sp)
5480  0541 97            	ld	xl,a
5481  0542 a610          	ld	a,#16
5482  0544 42            	mul	x,a
5483  0545 9f            	ld	a,xl
5484  0546 1a04          	or	a,(OFST+2,sp)
5485  0548 1a02          	or	a,(OFST+0,sp)
5486  054a 6b02          	ld	(OFST+0,sp),a
5488                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5490  054c c75258        	ld	21080,a
5491                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5493  054f 7b01          	ld	a,(OFST-1,sp)
5494  0551 4a            	dec	a
5495  0552 2606          	jrne	L7072
5496                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5498  0554 7212525a      	bset	21082,#1
5500  0558 2004          	jra	L1172
5501  055a               L7072:
5502                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5504  055a 7213525a      	bres	21082,#1
5505  055e               L1172:
5506                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5508  055e 7210525a      	bset	21082,#0
5509                     ; 1709 }
5512  0562 5b04          	addw	sp,#4
5513  0564 81            	ret	
5585                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5585                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5585                     ; 1728                        uint8_t TIM2_ICFilter)
5585                     ; 1729 {
5586                     	switch	.text
5587  0565               L5_TI2_Config:
5589  0565 89            	pushw	x
5590  0566 89            	pushw	x
5591       00000002      OFST:	set	2
5594                     ; 1730   uint8_t tmpccmr2 = 0;
5596                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5598  0567 9e            	ld	a,xh
5599  0568 6b01          	ld	(OFST-1,sp),a
5601                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5603                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5605                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5607                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5609  056a c65259        	ld	a,21081
5610  056d 6b02          	ld	(OFST+0,sp),a
5612                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5614  056f 7219525a      	bres	21082,#4
5615                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5617  0573 a40c          	and	a,#12
5618  0575 6b02          	ld	(OFST+0,sp),a
5620                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5622  0577 7b07          	ld	a,(OFST+5,sp)
5623  0579 97            	ld	xl,a
5624  057a a610          	ld	a,#16
5625  057c 42            	mul	x,a
5626  057d 9f            	ld	a,xl
5627  057e 1a04          	or	a,(OFST+2,sp)
5628  0580 1a02          	or	a,(OFST+0,sp)
5629  0582 6b02          	ld	(OFST+0,sp),a
5631                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5633  0584 c75259        	ld	21081,a
5634                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5636  0587 7b01          	ld	a,(OFST-1,sp)
5637  0589 4a            	dec	a
5638  058a 2606          	jrne	L1572
5639                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5641  058c 721a525a      	bset	21082,#5
5643  0590 2004          	jra	L3572
5644  0592               L1572:
5645                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5647  0592 721b525a      	bres	21082,#5
5648  0596               L3572:
5649                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5651  0596 7218525a      	bset	21082,#4
5652                     ; 1761 }
5655  059a 5b04          	addw	sp,#4
5656  059c 81            	ret	
5724                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5724                     ; 1772 {
5725                     	switch	.text
5726  059d               _TIM2_ComputeLsiClockFreq:
5728  059d 520c          	subw	sp,#12
5729       0000000c      OFST:	set	12
5732                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5734  059f 4b00          	push	#0
5735  05a1 4b0c          	push	#12
5736  05a3 4b01          	push	#1
5737  05a5 5f            	clrw	x
5738  05a6 cd0132        	call	_TIM2_ICInit
5740  05a9 5b03          	addw	sp,#3
5741                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5743  05ab ae0201        	ldw	x,#513
5744  05ae cd01e4        	call	_TIM2_ITConfig
5746                     ; 1783   TIM2_Cmd(ENABLE);
5748  05b1 a601          	ld	a,#1
5749  05b3 cd01ca        	call	_TIM2_Cmd
5751                     ; 1785   TIM2->SR1 = 0x00;
5753  05b6 725f5255      	clr	21077
5754                     ; 1786   TIM2->SR2 = 0x00;
5756  05ba 725f5256      	clr	21078
5757                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5759  05be ae0002        	ldw	x,#2
5760  05c1 cd04f0        	call	_TIM2_ClearFlag
5763  05c4               L1103:
5764                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5766  05c4 72035255fb    	btjf	21077,#1,L1103
5767                     ; 1795   ICValue1 = TIM2_GetCapture1();
5769  05c9 cd047d        	call	_TIM2_GetCapture1
5771  05cc 1f09          	ldw	(OFST-3,sp),x
5773                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5775  05ce ae0002        	ldw	x,#2
5776  05d1 cd04f0        	call	_TIM2_ClearFlag
5779  05d4               L7103:
5780                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5782  05d4 72035255fb    	btjf	21077,#1,L7103
5783                     ; 1802   ICValue2 = TIM2_GetCapture1();
5785  05d9 cd047d        	call	_TIM2_GetCapture1
5787  05dc 1f0b          	ldw	(OFST-1,sp),x
5789                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5791  05de ae0002        	ldw	x,#2
5792  05e1 cd04f0        	call	_TIM2_ClearFlag
5794                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5796  05e4 7211525a      	bres	21082,#0
5797                     ; 1808   TIM2->CCMR1 = 0x00;
5799  05e8 725f5258      	clr	21080
5800                     ; 1810   TIM2_Cmd(DISABLE);
5802  05ec 4f            	clr	a
5803  05ed cd01ca        	call	_TIM2_Cmd
5805                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5807  05f0 1e0b          	ldw	x,(OFST-1,sp)
5808  05f2 72f009        	subw	x,(OFST-3,sp)
5809  05f5 cd0000        	call	c_uitolx
5811  05f8 96            	ldw	x,sp
5812  05f9 5c            	incw	x
5813  05fa cd0000        	call	c_rtol
5816  05fd 96            	ldw	x,sp
5817  05fe 1c000f        	addw	x,#OFST+3
5818  0601 cd0000        	call	c_ltor
5820  0604 a603          	ld	a,#3
5821  0606 cd0000        	call	c_llsh
5823  0609 96            	ldw	x,sp
5824  060a 5c            	incw	x
5825  060b cd0000        	call	c_ludv
5827  060e 96            	ldw	x,sp
5828  060f 1c0005        	addw	x,#OFST-7
5829  0612 cd0000        	call	c_rtol
5832                     ; 1814   return LSIClockFreq;
5834  0615 96            	ldw	x,sp
5835  0616 1c0005        	addw	x,#OFST-7
5836  0619 cd0000        	call	c_ltor
5840  061c 5b0c          	addw	sp,#12
5841  061e 81            	ret	
5865                     ; 1822 FunctionalState TIM2_GetStatus(void)
5865                     ; 1823 {
5866                     	switch	.text
5867  061f               _TIM2_GetStatus:
5871                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5873  061f c65250        	ld	a,21072
5874  0622 a401          	and	a,#1
5877  0624 81            	ret	
5890                     	xdef	_TIM2_GetStatus
5891                     	xdef	_TIM2_ComputeLsiClockFreq
5892                     	xdef	_TIM2_ClearITPendingBit
5893                     	xdef	_TIM2_GetITStatus
5894                     	xdef	_TIM2_ClearFlag
5895                     	xdef	_TIM2_GetFlagStatus
5896                     	xdef	_TIM2_GetPrescaler
5897                     	xdef	_TIM2_GetCounter
5898                     	xdef	_TIM2_GetCapture2
5899                     	xdef	_TIM2_GetCapture1
5900                     	xdef	_TIM2_SetIC2Prescaler
5901                     	xdef	_TIM2_SetIC1Prescaler
5902                     	xdef	_TIM2_SetCompare2
5903                     	xdef	_TIM2_SetCompare1
5904                     	xdef	_TIM2_SetAutoreload
5905                     	xdef	_TIM2_SetCounter
5906                     	xdef	_TIM2_SelectOCxM
5907                     	xdef	_TIM2_CCxCmd
5908                     	xdef	_TIM2_OC2PolarityConfig
5909                     	xdef	_TIM2_OC1PolarityConfig
5910                     	xdef	_TIM2_GenerateEvent
5911                     	xdef	_TIM2_OC2FastCmd
5912                     	xdef	_TIM2_OC1FastCmd
5913                     	xdef	_TIM2_OC2PreloadConfig
5914                     	xdef	_TIM2_OC1PreloadConfig
5915                     	xdef	_TIM2_ARRPreloadConfig
5916                     	xdef	_TIM2_ForcedOC2Config
5917                     	xdef	_TIM2_ForcedOC1Config
5918                     	xdef	_TIM2_CounterModeConfig
5919                     	xdef	_TIM2_PrescalerConfig
5920                     	xdef	_TIM2_EncoderInterfaceConfig
5921                     	xdef	_TIM2_SelectMasterSlaveMode
5922                     	xdef	_TIM2_SelectSlaveMode
5923                     	xdef	_TIM2_SelectOutputTrigger
5924                     	xdef	_TIM2_SelectOnePulseMode
5925                     	xdef	_TIM2_SelectHallSensor
5926                     	xdef	_TIM2_UpdateRequestConfig
5927                     	xdef	_TIM2_UpdateDisableConfig
5928                     	xdef	_TIM2_SelectInputTrigger
5929                     	xdef	_TIM2_TIxExternalClockConfig
5930                     	xdef	_TIM2_ETRConfig
5931                     	xdef	_TIM2_ETRClockMode2Config
5932                     	xdef	_TIM2_ETRClockMode1Config
5933                     	xdef	_TIM2_InternalClockConfig
5934                     	xdef	_TIM2_ITConfig
5935                     	xdef	_TIM2_CtrlPWMOutputs
5936                     	xdef	_TIM2_Cmd
5937                     	xdef	_TIM2_PWMIConfig
5938                     	xdef	_TIM2_ICInit
5939                     	xdef	_TIM2_BKRConfig
5940                     	xdef	_TIM2_OC2Init
5941                     	xdef	_TIM2_OC1Init
5942                     	xdef	_TIM2_TimeBaseInit
5943                     	xdef	_TIM2_DeInit
5944                     	xref.b	c_x
5963                     	xref	c_ludv
5964                     	xref	c_rtol
5965                     	xref	c_uitolx
5966                     	xref	c_llsh
5967                     	xref	c_ltor
5968                     	end
