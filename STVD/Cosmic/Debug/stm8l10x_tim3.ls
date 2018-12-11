   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 64 void TIM3_DeInit(void)
  45                     ; 65 {
  47                     	switch	.text
  48  0000               _TIM3_DeInit:
  52                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  54  0000 725f5280      	clr	21120
  55                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  57  0004 725f5281      	clr	21121
  58                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  60  0008 725f5282      	clr	21122
  61                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  63  000c 725f5283      	clr	21123
  64                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  66  0010 725f5284      	clr	21124
  67                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  69  0014 725f5286      	clr	21126
  70                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  72  0018 725f528a      	clr	21130
  73                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  75  001c 35015288      	mov	21128,#1
  76                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  78  0020 35015289      	mov	21129,#1
  79                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  81  0024 725f528a      	clr	21130
  82                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  84  0028 725f5288      	clr	21128
  85                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  87  002c 725f5289      	clr	21129
  88                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  90  0030 725f528b      	clr	21131
  91                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  93  0034 725f528c      	clr	21132
  94                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  96  0038 725f528d      	clr	21133
  97                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  99  003c 35ff528e      	mov	21134,#255
 100                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 102  0040 35ff528f      	mov	21135,#255
 103                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 105  0044 725f5290      	clr	21136
 106                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 108  0048 725f5291      	clr	21137
 109                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 111  004c 725f5292      	clr	21138
 112                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 114  0050 725f5293      	clr	21139
 115                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 117  0054 725f5295      	clr	21141
 118                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 120  0058 35015287      	mov	21127,#1
 121                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 123  005c 725f5294      	clr	21140
 124                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 126  0060 725f5285      	clr	21125
 127                     ; 102 }
 130  0064 81            	ret	
 292                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 292                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 292                     ; 129                        uint16_t TIM3_Period)
 292                     ; 130 {
 293                     	switch	.text
 294  0065               _TIM3_TimeBaseInit:
 296       fffffffe      OFST: set -2
 299                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 301                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 303                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 305  0065 7b03          	ld	a,(OFST+5,sp)
 306  0067 c7528e        	ld	21134,a
 307                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 309  006a 7b04          	ld	a,(OFST+6,sp)
 310  006c c7528f        	ld	21135,a
 311                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 313  006f 9e            	ld	a,xh
 314  0070 c7528d        	ld	21133,a
 315                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 317  0073 c65280        	ld	a,21120
 318  0076 a48f          	and	a,#143
 319  0078 c75280        	ld	21120,a
 320                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 322  007b 9f            	ld	a,xl
 323  007c ca5280        	or	a,21120
 324  007f c75280        	ld	21120,a
 325                     ; 147 }
 328  0082 81            	ret	
 526                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 526                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 526                     ; 176                   uint16_t TIM3_Pulse,
 526                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 526                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 526                     ; 179 {
 527                     	switch	.text
 528  0083               _TIM3_OC1Init:
 530  0083 89            	pushw	x
 531  0084 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 180   uint8_t tmpccmr1 = 0;
 537                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 539                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 541                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 543                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 545                     ; 188   tmpccmr1 = TIM3->CCMR1;
 547  0085 c65288        	ld	a,21128
 548  0088 6b01          	ld	(OFST+0,sp),a
 550                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 552  008a 7211528a      	bres	21130,#0
 553                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 555  008e a48f          	and	a,#143
 556  0090 6b01          	ld	(OFST+0,sp),a
 558                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 560  0092 9e            	ld	a,xh
 561  0093 1a01          	or	a,(OFST+0,sp)
 562  0095 6b01          	ld	(OFST+0,sp),a
 564                     ; 198   TIM3->CCMR1 = tmpccmr1;
 566  0097 c75288        	ld	21128,a
 567                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 569  009a 9f            	ld	a,xl
 570  009b 4a            	dec	a
 571  009c 2606          	jrne	L722
 572                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 574  009e 7210528a      	bset	21130,#0
 576  00a2 2004          	jra	L132
 577  00a4               L722:
 578                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 580  00a4 7211528a      	bres	21130,#0
 581  00a8               L132:
 582                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 584  00a8 7b08          	ld	a,(OFST+7,sp)
 585  00aa 4a            	dec	a
 586  00ab 2606          	jrne	L332
 587                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 589  00ad 7212528a      	bset	21130,#1
 591  00b1 2004          	jra	L532
 592  00b3               L332:
 593                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 595  00b3 7213528a      	bres	21130,#1
 596  00b7               L532:
 597                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 599  00b7 7b09          	ld	a,(OFST+8,sp)
 600  00b9 4a            	dec	a
 601  00ba 2606          	jrne	L732
 602                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 604  00bc 72105295      	bset	21141,#0
 606  00c0 2004          	jra	L142
 607  00c2               L732:
 608                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 610  00c2 72115295      	bres	21141,#0
 611  00c6               L142:
 612                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 614  00c6 7b06          	ld	a,(OFST+5,sp)
 615  00c8 c75290        	ld	21136,a
 616                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 618  00cb 7b07          	ld	a,(OFST+6,sp)
 619  00cd c75291        	ld	21137,a
 620                     ; 233 }
 623  00d0 5b03          	addw	sp,#3
 624  00d2 81            	ret	
 707                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 707                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 707                     ; 262                   uint16_t TIM3_Pulse,
 707                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 707                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 707                     ; 265 {
 708                     	switch	.text
 709  00d3               _TIM3_OC2Init:
 711  00d3 89            	pushw	x
 712  00d4 88            	push	a
 713       00000001      OFST:	set	1
 716                     ; 266   uint8_t tmpccmr2 = 0;
 718                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 720                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 722                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 724                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 726                     ; 274   tmpccmr2 = TIM3->CCMR2;
 728  00d5 c65289        	ld	a,21129
 729  00d8 6b01          	ld	(OFST+0,sp),a
 731                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 733  00da 7219528a      	bres	21130,#4
 734                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 736  00de a48f          	and	a,#143
 737  00e0 6b01          	ld	(OFST+0,sp),a
 739                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 741  00e2 9e            	ld	a,xh
 742  00e3 1a01          	or	a,(OFST+0,sp)
 743  00e5 6b01          	ld	(OFST+0,sp),a
 745                     ; 285   TIM3->CCMR2 = tmpccmr2;
 747  00e7 c75289        	ld	21129,a
 748                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 750  00ea 9f            	ld	a,xl
 751  00eb 4a            	dec	a
 752  00ec 2606          	jrne	L503
 753                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 755  00ee 7218528a      	bset	21130,#4
 757  00f2 2004          	jra	L703
 758  00f4               L503:
 759                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 761  00f4 7219528a      	bres	21130,#4
 762  00f8               L703:
 763                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 765  00f8 7b08          	ld	a,(OFST+7,sp)
 766  00fa 4a            	dec	a
 767  00fb 2606          	jrne	L113
 768                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 770  00fd 721a528a      	bset	21130,#5
 772  0101 2004          	jra	L313
 773  0103               L113:
 774                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 776  0103 721b528a      	bres	21130,#5
 777  0107               L313:
 778                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 780  0107 7b09          	ld	a,(OFST+8,sp)
 781  0109 4a            	dec	a
 782  010a 2606          	jrne	L513
 783                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 785  010c 72145295      	bset	21141,#2
 787  0110 2004          	jra	L713
 788  0112               L513:
 789                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 791  0112 72155295      	bres	21141,#2
 792  0116               L713:
 793                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 795  0116 7b06          	ld	a,(OFST+5,sp)
 796  0118 c75292        	ld	21138,a
 797                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 799  011b 7b07          	ld	a,(OFST+6,sp)
 800  011d c75293        	ld	21139,a
 801                     ; 321 }
 804  0120 5b03          	addw	sp,#3
 805  0122 81            	ret	
1003                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1003                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1003                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1003                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1003                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1003                     ; 355 
1003                     ; 356 {
1004                     	switch	.text
1005  0123               _TIM3_BKRConfig:
1007  0123 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1013                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1015                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1017                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1019                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1021                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1021                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1021                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1023  0124 9f            	ld	a,xl
1024  0125 1a01          	or	a,(OFST+1,sp)
1025  0127 1a05          	or	a,(OFST+5,sp)
1026  0129 1a06          	or	a,(OFST+6,sp)
1027  012b 1a07          	or	a,(OFST+7,sp)
1028  012d c75294        	ld	21140,a
1029                     ; 372 }
1032  0130 85            	popw	x
1033  0131 81            	ret	
1217                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1217                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1217                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1217                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1217                     ; 402                  uint8_t TIM3_ICFilter)
1217                     ; 403 {
1218                     	switch	.text
1219  0132               _TIM3_ICInit:
1221  0132 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1227                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1229  0133 9e            	ld	a,xh
1230  0134 4d            	tnz	a
1231  0135 2614          	jrne	L735
1232                     ; 410     TI1_Config(TIM3_ICPolarity,
1232                     ; 411                TIM3_ICSelection,
1232                     ; 412                TIM3_ICFilter);
1234  0137 7b07          	ld	a,(OFST+7,sp)
1235  0139 88            	push	a
1236  013a 7b06          	ld	a,(OFST+6,sp)
1237  013c 97            	ld	xl,a
1238  013d 7b03          	ld	a,(OFST+3,sp)
1239  013f 95            	ld	xh,a
1240  0140 cd052d        	call	L3_TI1_Config
1242  0143 84            	pop	a
1243                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1245  0144 7b06          	ld	a,(OFST+6,sp)
1246  0146 cd0461        	call	_TIM3_SetIC1Prescaler
1249  0149 2012          	jra	L145
1250  014b               L735:
1251                     ; 420     TI2_Config(TIM3_ICPolarity,
1251                     ; 421                TIM3_ICSelection,
1251                     ; 422                TIM3_ICFilter);
1253  014b 7b07          	ld	a,(OFST+7,sp)
1254  014d 88            	push	a
1255  014e 7b06          	ld	a,(OFST+6,sp)
1256  0150 97            	ld	xl,a
1257  0151 7b03          	ld	a,(OFST+3,sp)
1258  0153 95            	ld	xh,a
1259  0154 cd0565        	call	L5_TI2_Config
1261  0157 84            	pop	a
1262                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1264  0158 7b06          	ld	a,(OFST+6,sp)
1265  015a cd046f        	call	_TIM3_SetIC2Prescaler
1267  015d               L145:
1268                     ; 426 }
1271  015d 85            	popw	x
1272  015e 81            	ret	
1368                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1368                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1368                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1368                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1368                     ; 456                      uint8_t TIM3_ICFilter)
1368                     ; 457 {
1369                     	switch	.text
1370  015f               _TIM3_PWMIConfig:
1372  015f 89            	pushw	x
1373  0160 89            	pushw	x
1374       00000002      OFST:	set	2
1377                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1379                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1381                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1383                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1385  0161 9f            	ld	a,xl
1386  0162 4d            	tnz	a
1387  0163 2605          	jrne	L116
1388                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1390  0165 4c            	inc	a
1391  0166 6b01          	ld	(OFST-1,sp),a
1394  0168 2002          	jra	L316
1395  016a               L116:
1396                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1398  016a 0f01          	clr	(OFST-1,sp)
1400  016c               L316:
1401                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1403  016c 7b07          	ld	a,(OFST+5,sp)
1404  016e 4a            	dec	a
1405  016f 2604          	jrne	L516
1406                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1408  0171 a602          	ld	a,#2
1410  0173 2002          	jra	L716
1411  0175               L516:
1412                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1414  0175 a601          	ld	a,#1
1415  0177               L716:
1416  0177 6b02          	ld	(OFST+0,sp),a
1418                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1420  0179 7b03          	ld	a,(OFST+1,sp)
1421  017b 2626          	jrne	L126
1422                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1422                     ; 488                TIM3_ICFilter);
1424  017d 7b09          	ld	a,(OFST+7,sp)
1425  017f 88            	push	a
1426  0180 7b08          	ld	a,(OFST+6,sp)
1427  0182 97            	ld	xl,a
1428  0183 7b05          	ld	a,(OFST+3,sp)
1429  0185 95            	ld	xh,a
1430  0186 cd052d        	call	L3_TI1_Config
1432  0189 84            	pop	a
1433                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1435  018a 7b08          	ld	a,(OFST+6,sp)
1436  018c cd0461        	call	_TIM3_SetIC1Prescaler
1438                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1440  018f 7b09          	ld	a,(OFST+7,sp)
1441  0191 88            	push	a
1442  0192 7b03          	ld	a,(OFST+1,sp)
1443  0194 97            	ld	xl,a
1444  0195 7b02          	ld	a,(OFST+0,sp)
1445  0197 95            	ld	xh,a
1446  0198 cd0565        	call	L5_TI2_Config
1448  019b 84            	pop	a
1449                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1451  019c 7b08          	ld	a,(OFST+6,sp)
1452  019e cd046f        	call	_TIM3_SetIC2Prescaler
1455  01a1 2024          	jra	L326
1456  01a3               L126:
1457                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1457                     ; 503                TIM3_ICFilter);
1459  01a3 7b09          	ld	a,(OFST+7,sp)
1460  01a5 88            	push	a
1461  01a6 7b08          	ld	a,(OFST+6,sp)
1462  01a8 97            	ld	xl,a
1463  01a9 7b05          	ld	a,(OFST+3,sp)
1464  01ab 95            	ld	xh,a
1465  01ac cd0565        	call	L5_TI2_Config
1467  01af 84            	pop	a
1468                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1470  01b0 7b08          	ld	a,(OFST+6,sp)
1471  01b2 cd046f        	call	_TIM3_SetIC2Prescaler
1473                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1475  01b5 7b09          	ld	a,(OFST+7,sp)
1476  01b7 88            	push	a
1477  01b8 7b03          	ld	a,(OFST+1,sp)
1478  01ba 97            	ld	xl,a
1479  01bb 7b02          	ld	a,(OFST+0,sp)
1480  01bd 95            	ld	xh,a
1481  01be cd052d        	call	L3_TI1_Config
1483  01c1 84            	pop	a
1484                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1486  01c2 7b08          	ld	a,(OFST+6,sp)
1487  01c4 cd0461        	call	_TIM3_SetIC1Prescaler
1489  01c7               L326:
1490                     ; 514 }
1493  01c7 5b04          	addw	sp,#4
1494  01c9 81            	ret	
1549                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1549                     ; 523 {
1550                     	switch	.text
1551  01ca               _TIM3_Cmd:
1555                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1557                     ; 528   if (NewState != DISABLE)
1559  01ca 4d            	tnz	a
1560  01cb 2705          	jreq	L356
1561                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1563  01cd 72105280      	bset	21120,#0
1566  01d1 81            	ret	
1567  01d2               L356:
1568                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1570  01d2 72115280      	bres	21120,#0
1571                     ; 536 }
1574  01d6 81            	ret	
1610                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1610                     ; 545 {
1611                     	switch	.text
1612  01d7               _TIM3_CtrlPWMOutputs:
1616                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1618                     ; 551   if (NewState != DISABLE)
1620  01d7 4d            	tnz	a
1621  01d8 2705          	jreq	L576
1622                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1624  01da 721e5294      	bset	21140,#7
1627  01de 81            	ret	
1628  01df               L576:
1629                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1631  01df 721f5294      	bres	21140,#7
1632                     ; 559 }
1635  01e3 81            	ret	
1721                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1721                     ; 575 {
1722                     	switch	.text
1723  01e4               _TIM3_ITConfig:
1725  01e4 89            	pushw	x
1726       00000000      OFST:	set	0
1729                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1731                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1733                     ; 580   if (NewState != DISABLE)
1735  01e5 9f            	ld	a,xl
1736  01e6 4d            	tnz	a
1737  01e7 2706          	jreq	L147
1738                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1740  01e9 9e            	ld	a,xh
1741  01ea ca5284        	or	a,21124
1743  01ed 2006          	jra	L347
1744  01ef               L147:
1745                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1747  01ef 7b01          	ld	a,(OFST+1,sp)
1748  01f1 43            	cpl	a
1749  01f2 c45284        	and	a,21124
1750  01f5               L347:
1751  01f5 c75284        	ld	21124,a
1752                     ; 590 }
1755  01f8 85            	popw	x
1756  01f9 81            	ret	
1780                     ; 597 void TIM3_InternalClockConfig(void)
1780                     ; 598 {
1781                     	switch	.text
1782  01fa               _TIM3_InternalClockConfig:
1786                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1788  01fa c65282        	ld	a,21122
1789  01fd a4f8          	and	a,#248
1790  01ff c75282        	ld	21122,a
1791                     ; 601 }
1794  0202 81            	ret	
1911                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1911                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1911                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1911                     ; 622 {
1912                     	switch	.text
1913  0203               _TIM3_ETRClockMode1Config:
1915  0203 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1921  0204 7b05          	ld	a,(OFST+5,sp)
1922  0206 88            	push	a
1923  0207 7b02          	ld	a,(OFST+2,sp)
1924  0209 95            	ld	xh,a
1925  020a ad33          	call	_TIM3_ETRConfig
1927  020c 84            	pop	a
1928                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1930  020d c65282        	ld	a,21122
1931  0210 a4f8          	and	a,#248
1932  0212 c75282        	ld	21122,a
1933                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1935  0215 c65282        	ld	a,21122
1936  0218 aa07          	or	a,#7
1937  021a c75282        	ld	21122,a
1938                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1940  021d c65282        	ld	a,21122
1941  0220 a48f          	and	a,#143
1942  0222 c75282        	ld	21122,a
1943                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1945  0225 c65282        	ld	a,21122
1946  0228 aa70          	or	a,#112
1947  022a c75282        	ld	21122,a
1948                     ; 633 }
1951  022d 85            	popw	x
1952  022e 81            	ret	
2010                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2010                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2010                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2010                     ; 654 {
2011                     	switch	.text
2012  022f               _TIM3_ETRClockMode2Config:
2014  022f 89            	pushw	x
2015       00000000      OFST:	set	0
2018                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2020  0230 7b05          	ld	a,(OFST+5,sp)
2021  0232 88            	push	a
2022  0233 7b02          	ld	a,(OFST+2,sp)
2023  0235 95            	ld	xh,a
2024  0236 ad07          	call	_TIM3_ETRConfig
2026  0238 721c5283      	bset	21123,#6
2027                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2029                     ; 660 }
2032  023c 5b03          	addw	sp,#3
2033  023e 81            	ret	
2089                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2089                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2089                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2089                     ; 681 {
2090                     	switch	.text
2091  023f               _TIM3_ETRConfig:
2093  023f 89            	pushw	x
2094       00000000      OFST:	set	0
2097                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2099                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2101                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2103                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2105  0240 9f            	ld	a,xl
2106  0241 1a01          	or	a,(OFST+1,sp)
2107  0243 1a05          	or	a,(OFST+5,sp)
2108  0245 ca5283        	or	a,21123
2109  0248 c75283        	ld	21123,a
2110                     ; 688 }
2113  024b 85            	popw	x
2114  024c 81            	ret	
2203                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2203                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2203                     ; 707                                  uint8_t TIM3_ICFilter)
2203                     ; 708 {
2204                     	switch	.text
2205  024d               _TIM3_TIxExternalClockConfig:
2207  024d 89            	pushw	x
2208       00000000      OFST:	set	0
2211                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2213                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2215                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2217                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2219  024e 9e            	ld	a,xh
2220  024f a160          	cp	a,#96
2221  0251 260d          	jrne	L3411
2222                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2224  0253 7b05          	ld	a,(OFST+5,sp)
2225  0255 88            	push	a
2226  0256 9f            	ld	a,xl
2227  0257 ae0001        	ldw	x,#1
2228  025a 95            	ld	xh,a
2229  025b cd0565        	call	L5_TI2_Config
2232  025e 200c          	jra	L5411
2233  0260               L3411:
2234                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2236  0260 7b05          	ld	a,(OFST+5,sp)
2237  0262 88            	push	a
2238  0263 7b03          	ld	a,(OFST+3,sp)
2239  0265 ae0001        	ldw	x,#1
2240  0268 95            	ld	xh,a
2241  0269 cd052d        	call	L3_TI1_Config
2243  026c               L5411:
2244  026c 84            	pop	a
2245                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2247  026d 7b01          	ld	a,(OFST+1,sp)
2248  026f ad0a          	call	_TIM3_SelectInputTrigger
2250                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2252  0271 c65282        	ld	a,21122
2253  0274 aa07          	or	a,#7
2254  0276 c75282        	ld	21122,a
2255                     ; 729 }
2258  0279 85            	popw	x
2259  027a 81            	ret	
2359                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2359                     ; 746 {
2360                     	switch	.text
2361  027b               _TIM3_SelectInputTrigger:
2363  027b 88            	push	a
2364  027c 88            	push	a
2365       00000001      OFST:	set	1
2368                     ; 747   uint8_t tmpsmcr = 0;
2370                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2372                     ; 752   tmpsmcr = TIM3->SMCR;
2374  027d c65282        	ld	a,21122
2376                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2378  0280 a48f          	and	a,#143
2380                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2382  0282 1a02          	or	a,(OFST+1,sp)
2384                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2386  0284 c75282        	ld	21122,a
2387                     ; 759 }
2390  0287 85            	popw	x
2391  0288 81            	ret	
2427                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2427                     ; 768 {
2428                     	switch	.text
2429  0289               _TIM3_UpdateDisableConfig:
2433                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2435                     ; 773   if (NewState != DISABLE)
2437  0289 4d            	tnz	a
2438  028a 2705          	jreq	L7221
2439                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2441  028c 72125280      	bset	21120,#1
2444  0290 81            	ret	
2445  0291               L7221:
2446                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2448  0291 72135280      	bres	21120,#1
2449                     ; 781 }
2452  0295 81            	ret	
2510                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2510                     ; 792 {
2511                     	switch	.text
2512  0296               _TIM3_UpdateRequestConfig:
2516                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2518                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2520  0296 4a            	dec	a
2521  0297 2605          	jrne	L1621
2522                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2524  0299 72145280      	bset	21120,#2
2527  029d 81            	ret	
2528  029e               L1621:
2529                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2531  029e 72155280      	bres	21120,#2
2532                     ; 805 }
2535  02a2 81            	ret	
2571                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2571                     ; 814 {
2572                     	switch	.text
2573  02a3               _TIM3_SelectHallSensor:
2577                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2579                     ; 819   if (NewState != DISABLE)
2581  02a3 4d            	tnz	a
2582  02a4 2705          	jreq	L3031
2583                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2585  02a6 721e5281      	bset	21121,#7
2588  02aa 81            	ret	
2589  02ab               L3031:
2590                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2592  02ab 721f5281      	bres	21121,#7
2593                     ; 827 }
2596  02af 81            	ret	
2653                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2653                     ; 838 {
2654                     	switch	.text
2655  02b0               _TIM3_SelectOnePulseMode:
2659                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2661                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2663  02b0 4a            	dec	a
2664  02b1 2605          	jrne	L5331
2665                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2667  02b3 72165280      	bset	21120,#3
2670  02b7 81            	ret	
2671  02b8               L5331:
2672                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2674  02b8 72175280      	bres	21120,#3
2675                     ; 851 }
2678  02bc 81            	ret	
2777                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2777                     ; 866 {
2778                     	switch	.text
2779  02bd               _TIM3_SelectOutputTrigger:
2781  02bd 88            	push	a
2782  02be 88            	push	a
2783       00000001      OFST:	set	1
2786                     ; 867   uint8_t tmpcr2 = 0;
2788                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2790                     ; 872   tmpcr2 = TIM3->CR2;
2792  02bf c65281        	ld	a,21121
2794                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2796  02c2 a48f          	and	a,#143
2798                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2800  02c4 1a02          	or	a,(OFST+1,sp)
2802                     ; 880   TIM3->CR2 = tmpcr2;
2804  02c6 c75281        	ld	21121,a
2805                     ; 881 }
2808  02c9 85            	popw	x
2809  02ca 81            	ret	
2892                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2892                     ; 894 {
2893                     	switch	.text
2894  02cb               _TIM3_SelectSlaveMode:
2896  02cb 88            	push	a
2897  02cc 88            	push	a
2898       00000001      OFST:	set	1
2901                     ; 895   uint8_t tmpsmcr = 0;
2903                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2905                     ; 900   tmpsmcr = TIM3->SMCR;
2907  02cd c65282        	ld	a,21122
2909                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2911  02d0 a4f8          	and	a,#248
2913                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2915  02d2 1a02          	or	a,(OFST+1,sp)
2917                     ; 908   TIM3->SMCR = tmpsmcr;
2919  02d4 c75282        	ld	21122,a
2920                     ; 909 }
2923  02d7 85            	popw	x
2924  02d8 81            	ret	
2960                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2960                     ; 918 {
2961                     	switch	.text
2962  02d9               _TIM3_SelectMasterSlaveMode:
2966                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2968                     ; 923   if (NewState != DISABLE)
2970  02d9 4d            	tnz	a
2971  02da 2705          	jreq	L7541
2972                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
2974  02dc 721e5282      	bset	21122,#7
2977  02e0 81            	ret	
2978  02e1               L7541:
2979                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2981  02e1 721f5282      	bres	21122,#7
2982                     ; 931 }
2985  02e5 81            	ret	
3098                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3098                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3098                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3098                     ; 953 {
3099                     	switch	.text
3100  02e6               _TIM3_EncoderInterfaceConfig:
3102  02e6 89            	pushw	x
3103  02e7 5203          	subw	sp,#3
3104       00000003      OFST:	set	3
3107                     ; 954   uint8_t tmpsmcr = 0;
3109                     ; 955   uint8_t tmpccmr1 = 0;
3111                     ; 956   uint8_t tmpccmr2 = 0;
3113                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3115                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3117                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3119                     ; 963   tmpsmcr = TIM3->SMCR;
3121  02e9 c65282        	ld	a,21122
3122  02ec 6b01          	ld	(OFST-2,sp),a
3124                     ; 964   tmpccmr1 = TIM3->CCMR1;
3126  02ee c65288        	ld	a,21128
3127  02f1 6b02          	ld	(OFST-1,sp),a
3129                     ; 965   tmpccmr2 = TIM3->CCMR2;
3131  02f3 c65289        	ld	a,21129
3132  02f6 6b03          	ld	(OFST+0,sp),a
3134                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3136  02f8 7b01          	ld	a,(OFST-2,sp)
3137  02fa a4f0          	and	a,#240
3138  02fc 6b01          	ld	(OFST-2,sp),a
3140                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3142  02fe 9e            	ld	a,xh
3143  02ff 1a01          	or	a,(OFST-2,sp)
3144  0301 6b01          	ld	(OFST-2,sp),a
3146                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3148  0303 7b02          	ld	a,(OFST-1,sp)
3149  0305 a4fc          	and	a,#252
3150  0307 6b02          	ld	(OFST-1,sp),a
3152                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3154  0309 7b03          	ld	a,(OFST+0,sp)
3155  030b a4fc          	and	a,#252
3156  030d 6b03          	ld	(OFST+0,sp),a
3158                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3160  030f 7b02          	ld	a,(OFST-1,sp)
3161  0311 aa01          	or	a,#1
3162  0313 6b02          	ld	(OFST-1,sp),a
3164                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3166  0315 7b03          	ld	a,(OFST+0,sp)
3167  0317 aa01          	or	a,#1
3168  0319 6b03          	ld	(OFST+0,sp),a
3170                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3172  031b 9f            	ld	a,xl
3173  031c 4a            	dec	a
3174  031d 2606          	jrne	L7351
3175                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3177  031f 7212528a      	bset	21130,#1
3179  0323 2004          	jra	L1451
3180  0325               L7351:
3181                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3183  0325 7213528a      	bres	21130,#1
3184  0329               L1451:
3185                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3187  0329 7b08          	ld	a,(OFST+5,sp)
3188  032b 4a            	dec	a
3189  032c 2606          	jrne	L3451
3190                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3192  032e 721a528a      	bset	21130,#5
3194  0332 2004          	jra	L5451
3195  0334               L3451:
3196                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3198  0334 721b528a      	bres	21130,#5
3199  0338               L5451:
3200                     ; 996   TIM3->SMCR = tmpsmcr;
3202  0338 7b01          	ld	a,(OFST-2,sp)
3203  033a c75282        	ld	21122,a
3204                     ; 997   TIM3->CCMR1 = tmpccmr1;
3206  033d 7b02          	ld	a,(OFST-1,sp)
3207  033f c75288        	ld	21128,a
3208                     ; 998   TIM3->CCMR2 = tmpccmr2;
3210  0342 7b03          	ld	a,(OFST+0,sp)
3211  0344 c75289        	ld	21129,a
3212                     ; 999 }
3215  0347 5b05          	addw	sp,#5
3216  0349 81            	ret	
3284                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3284                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3284                     ; 1021 {
3285                     	switch	.text
3286  034a               _TIM3_PrescalerConfig:
3290                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3292                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3294                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3296  034a 9e            	ld	a,xh
3297  034b c7528d        	ld	21133,a
3298                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3300  034e 9f            	ld	a,xl
3301  034f 4a            	dec	a
3302  0350 2605          	jrne	L1061
3303                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3305  0352 72105287      	bset	21127,#0
3308  0356 81            	ret	
3309  0357               L1061:
3310                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3312  0357 72115287      	bres	21127,#0
3313                     ; 1039 }
3316  035b 81            	ret	
3361                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3361                     ; 1053 {
3362                     	switch	.text
3363  035c               _TIM3_CounterModeConfig:
3365  035c 88            	push	a
3366  035d 88            	push	a
3367       00000001      OFST:	set	1
3370                     ; 1054   uint8_t tmpcr1 = 0;
3372                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3374                     ; 1059   tmpcr1 = TIM3->CR1;
3376  035e c65280        	ld	a,21120
3378                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3380  0361 a48f          	and	a,#143
3382                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3384  0363 1a02          	or	a,(OFST+1,sp)
3386                     ; 1067   TIM3->CR1 = tmpcr1;
3388  0365 c75280        	ld	21120,a
3389                     ; 1068 }
3392  0368 85            	popw	x
3393  0369 81            	ret	
3460                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3460                     ; 1079 {
3461                     	switch	.text
3462  036a               _TIM3_ForcedOC1Config:
3464  036a 88            	push	a
3465  036b 88            	push	a
3466       00000001      OFST:	set	1
3469                     ; 1080   uint8_t tmpccmr1 = 0;
3471                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3473                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3475  036c c65288        	ld	a,21128
3477                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3479  036f a48f          	and	a,#143
3481                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3483  0371 1a02          	or	a,(OFST+1,sp)
3485                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3487  0373 c75288        	ld	21128,a
3488                     ; 1094 }
3491  0376 85            	popw	x
3492  0377 81            	ret	
3537                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3537                     ; 1105 {
3538                     	switch	.text
3539  0378               _TIM3_ForcedOC2Config:
3541  0378 88            	push	a
3542  0379 88            	push	a
3543       00000001      OFST:	set	1
3546                     ; 1106   uint8_t tmpccmr2 = 0;
3548                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3550                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3552  037a c65289        	ld	a,21129
3554                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3556  037d a48f          	and	a,#143
3558                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3560  037f 1a02          	or	a,(OFST+1,sp)
3562                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3564  0381 c75289        	ld	21129,a
3565                     ; 1120 }
3568  0384 85            	popw	x
3569  0385 81            	ret	
3605                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3605                     ; 1129 {
3606                     	switch	.text
3607  0386               _TIM3_ARRPreloadConfig:
3611                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3613                     ; 1134   if (NewState != DISABLE)
3615  0386 4d            	tnz	a
3616  0387 2705          	jreq	L1271
3617                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3619  0389 721e5280      	bset	21120,#7
3622  038d 81            	ret	
3623  038e               L1271:
3624                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3626  038e 721f5280      	bres	21120,#7
3627                     ; 1142 }
3630  0392 81            	ret	
3666                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3666                     ; 1151 {
3667                     	switch	.text
3668  0393               _TIM3_OC1PreloadConfig:
3672                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3674                     ; 1156   if (NewState != DISABLE)
3676  0393 4d            	tnz	a
3677  0394 2705          	jreq	L3471
3678                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3680  0396 72165288      	bset	21128,#3
3683  039a 81            	ret	
3684  039b               L3471:
3685                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3687  039b 72175288      	bres	21128,#3
3688                     ; 1164 }
3691  039f 81            	ret	
3727                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3727                     ; 1173 {
3728                     	switch	.text
3729  03a0               _TIM3_OC2PreloadConfig:
3733                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3735                     ; 1178   if (NewState != DISABLE)
3737  03a0 4d            	tnz	a
3738  03a1 2705          	jreq	L5671
3739                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3741  03a3 72165289      	bset	21129,#3
3744  03a7 81            	ret	
3745  03a8               L5671:
3746                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3748  03a8 72175289      	bres	21129,#3
3749                     ; 1186 }
3752  03ac 81            	ret	
3787                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3787                     ; 1195 {
3788                     	switch	.text
3789  03ad               _TIM3_OC1FastCmd:
3793                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3795                     ; 1200   if (NewState != DISABLE)
3797  03ad 4d            	tnz	a
3798  03ae 2705          	jreq	L7002
3799                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3801  03b0 72145288      	bset	21128,#2
3804  03b4 81            	ret	
3805  03b5               L7002:
3806                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3808  03b5 72155288      	bres	21128,#2
3809                     ; 1208 }
3812  03b9 81            	ret	
3847                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3847                     ; 1217 {
3848                     	switch	.text
3849  03ba               _TIM3_OC2FastCmd:
3853                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3855                     ; 1222   if (NewState != DISABLE)
3857  03ba 4d            	tnz	a
3858  03bb 2705          	jreq	L1302
3859                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3861  03bd 72145289      	bset	21129,#2
3864  03c1 81            	ret	
3865  03c2               L1302:
3866                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3868  03c2 72155289      	bres	21129,#2
3869                     ; 1230 }
3872  03c6 81            	ret	
3953                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3953                     ; 1244 {
3954                     	switch	.text
3955  03c7               _TIM3_GenerateEvent:
3959                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3961                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3963  03c7 ca5287        	or	a,21127
3964  03ca c75287        	ld	21127,a
3965                     ; 1250 }
3968  03cd 81            	ret	
4004                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4004                     ; 1261 {
4005                     	switch	.text
4006  03ce               _TIM3_OC1PolarityConfig:
4010                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4012                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4014  03ce 4a            	dec	a
4015  03cf 2605          	jrne	L7012
4016                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
4018  03d1 7212528a      	bset	21130,#1
4021  03d5 81            	ret	
4022  03d6               L7012:
4023                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4025  03d6 7213528a      	bres	21130,#1
4026                     ; 1274 }
4029  03da 81            	ret	
4065                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4065                     ; 1285 {
4066                     	switch	.text
4067  03db               _TIM3_OC2PolarityConfig:
4071                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4073                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4075  03db 4a            	dec	a
4076  03dc 2605          	jrne	L1312
4077                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4079  03de 721a528a      	bset	21130,#5
4082  03e2 81            	ret	
4083  03e3               L1312:
4084                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4086  03e3 721b528a      	bres	21130,#5
4087                     ; 1298 }
4090  03e7 81            	ret	
4135                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4135                     ; 1311                  FunctionalState NewState)
4135                     ; 1312 {
4136                     	switch	.text
4137  03e8               _TIM3_CCxCmd:
4139  03e8 89            	pushw	x
4140       00000000      OFST:	set	0
4143                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4145                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4147                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4149  03e9 9e            	ld	a,xh
4150  03ea 4d            	tnz	a
4151  03eb 2610          	jrne	L7512
4152                     ; 1320     if (NewState != DISABLE)
4154  03ed 9f            	ld	a,xl
4155  03ee 4d            	tnz	a
4156  03ef 2706          	jreq	L1612
4157                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4159  03f1 7210528a      	bset	21130,#0
4161  03f5 2014          	jra	L5612
4162  03f7               L1612:
4163                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4165  03f7 7211528a      	bres	21130,#0
4166  03fb 200e          	jra	L5612
4167  03fd               L7512:
4168                     ; 1333     if (NewState != DISABLE)
4170  03fd 7b02          	ld	a,(OFST+2,sp)
4171  03ff 2706          	jreq	L7612
4172                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4174  0401 7218528a      	bset	21130,#4
4176  0405 2004          	jra	L5612
4177  0407               L7612:
4178                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4180  0407 7219528a      	bres	21130,#4
4181  040b               L5612:
4182                     ; 1343 }
4185  040b 85            	popw	x
4186  040c 81            	ret	
4231                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4231                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4231                     ; 1364 {
4232                     	switch	.text
4233  040d               _TIM3_SelectOCxM:
4235  040d 89            	pushw	x
4236       00000000      OFST:	set	0
4239                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4241                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4243                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4245  040e 9e            	ld	a,xh
4246  040f 4d            	tnz	a
4247  0410 2615          	jrne	L5122
4248                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4250  0412 7211528a      	bres	21130,#0
4251                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4253  0416 c65288        	ld	a,21128
4254  0419 a48f          	and	a,#143
4255  041b c75288        	ld	21128,a
4256                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4258  041e 9f            	ld	a,xl
4259  041f ca5288        	or	a,21128
4260  0422 c75288        	ld	21128,a
4262  0425 2014          	jra	L7122
4263  0427               L5122:
4264                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4266  0427 7219528a      	bres	21130,#4
4267                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4269  042b c65289        	ld	a,21129
4270  042e a48f          	and	a,#143
4271  0430 c75289        	ld	21129,a
4272                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4274  0433 c65289        	ld	a,21129
4275  0436 1a02          	or	a,(OFST+2,sp)
4276  0438 c75289        	ld	21129,a
4277  043b               L7122:
4278                     ; 1391 }
4281  043b 85            	popw	x
4282  043c 81            	ret	
4316                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4316                     ; 1400 {
4317                     	switch	.text
4318  043d               _TIM3_SetCounter:
4322                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4324  043d 9e            	ld	a,xh
4325  043e c7528b        	ld	21131,a
4326                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4328  0441 9f            	ld	a,xl
4329  0442 c7528c        	ld	21132,a
4330                     ; 1405 }
4333  0445 81            	ret	
4367                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4367                     ; 1414 {
4368                     	switch	.text
4369  0446               _TIM3_SetAutoreload:
4373                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4375  0446 9e            	ld	a,xh
4376  0447 c7528e        	ld	21134,a
4377                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4379  044a 9f            	ld	a,xl
4380  044b c7528f        	ld	21135,a
4381                     ; 1418 }
4384  044e 81            	ret	
4418                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4418                     ; 1427 {
4419                     	switch	.text
4420  044f               _TIM3_SetCompare1:
4424                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4426  044f 9e            	ld	a,xh
4427  0450 c75290        	ld	21136,a
4428                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4430  0453 9f            	ld	a,xl
4431  0454 c75291        	ld	21137,a
4432                     ; 1431 }
4435  0457 81            	ret	
4469                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4469                     ; 1440 {
4470                     	switch	.text
4471  0458               _TIM3_SetCompare2:
4475                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4477  0458 9e            	ld	a,xh
4478  0459 c75292        	ld	21138,a
4479                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4481  045c 9f            	ld	a,xl
4482  045d c75293        	ld	21139,a
4483                     ; 1444 }
4486  0460 81            	ret	
4531                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4531                     ; 1457 {
4532                     	switch	.text
4533  0461               _TIM3_SetIC1Prescaler:
4535  0461 88            	push	a
4536  0462 88            	push	a
4537       00000001      OFST:	set	1
4540                     ; 1458   uint8_t tmpccmr1 = 0;
4542                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4544                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4546  0463 c65288        	ld	a,21128
4548                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4550  0466 a4f3          	and	a,#243
4552                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4554  0468 1a02          	or	a,(OFST+1,sp)
4556                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4558  046a c75288        	ld	21128,a
4559                     ; 1472 }
4562  046d 85            	popw	x
4563  046e 81            	ret	
4608                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4608                     ; 1485 {
4609                     	switch	.text
4610  046f               _TIM3_SetIC2Prescaler:
4612  046f 88            	push	a
4613  0470 88            	push	a
4614       00000001      OFST:	set	1
4617                     ; 1486   uint8_t tmpccmr2 = 0;
4619                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4621                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4623  0471 c65289        	ld	a,21129
4625                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4627  0474 a4f3          	and	a,#243
4629                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4631  0476 1a02          	or	a,(OFST+1,sp)
4633                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4635  0478 c75289        	ld	21129,a
4636                     ; 1500 }
4639  047b 85            	popw	x
4640  047c 81            	ret	
4692                     ; 1507 uint16_t TIM3_GetCapture1(void)
4692                     ; 1508 {
4693                     	switch	.text
4694  047d               _TIM3_GetCapture1:
4696  047d 5204          	subw	sp,#4
4697       00000004      OFST:	set	4
4700                     ; 1509   uint16_t tmpccr1 = 0;
4702                     ; 1512   tmpccr1h = TIM3->CCR1H;
4704  047f c65290        	ld	a,21136
4705  0482 6b02          	ld	(OFST-2,sp),a
4707                     ; 1513   tmpccr1l = TIM3->CCR1L;
4709  0484 c65291        	ld	a,21137
4710  0487 6b01          	ld	(OFST-3,sp),a
4712                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4714  0489 5f            	clrw	x
4715  048a 97            	ld	xl,a
4716  048b 1f03          	ldw	(OFST-1,sp),x
4718                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4720  048d 5f            	clrw	x
4721  048e 7b02          	ld	a,(OFST-2,sp)
4722  0490 97            	ld	xl,a
4723  0491 7b04          	ld	a,(OFST+0,sp)
4724  0493 01            	rrwa	x,a
4725  0494 1a03          	or	a,(OFST-1,sp)
4726  0496 01            	rrwa	x,a
4728                     ; 1518   return ((uint16_t)tmpccr1);
4732  0497 5b04          	addw	sp,#4
4733  0499 81            	ret	
4785                     ; 1526 uint16_t TIM3_GetCapture2(void)
4785                     ; 1527 {
4786                     	switch	.text
4787  049a               _TIM3_GetCapture2:
4789  049a 5204          	subw	sp,#4
4790       00000004      OFST:	set	4
4793                     ; 1528   uint16_t tmpccr2 = 0;
4795                     ; 1531   tmpccr2h = TIM3->CCR2H;
4797  049c c65292        	ld	a,21138
4798  049f 6b02          	ld	(OFST-2,sp),a
4800                     ; 1532   tmpccr2l = TIM3->CCR2L;
4802  04a1 c65293        	ld	a,21139
4803  04a4 6b01          	ld	(OFST-3,sp),a
4805                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4807  04a6 5f            	clrw	x
4808  04a7 97            	ld	xl,a
4809  04a8 1f03          	ldw	(OFST-1,sp),x
4811                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4813  04aa 5f            	clrw	x
4814  04ab 7b02          	ld	a,(OFST-2,sp)
4815  04ad 97            	ld	xl,a
4816  04ae 7b04          	ld	a,(OFST+0,sp)
4817  04b0 01            	rrwa	x,a
4818  04b1 1a03          	or	a,(OFST-1,sp)
4819  04b3 01            	rrwa	x,a
4821                     ; 1537   return ((uint16_t)tmpccr2);
4825  04b4 5b04          	addw	sp,#4
4826  04b6 81            	ret	
4878                     ; 1545 uint16_t TIM3_GetCounter(void)
4878                     ; 1546 {
4879                     	switch	.text
4880  04b7               _TIM3_GetCounter:
4882  04b7 5204          	subw	sp,#4
4883       00000004      OFST:	set	4
4886                     ; 1547   uint16_t tmpcnt = 0;
4888                     ; 1550   tmpcntrh = TIM3->CNTRH;
4890  04b9 c6528b        	ld	a,21131
4891  04bc 6b02          	ld	(OFST-2,sp),a
4893                     ; 1551   tmpcntrl = TIM3->CNTRL;
4895  04be c6528c        	ld	a,21132
4896  04c1 6b01          	ld	(OFST-3,sp),a
4898                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4900  04c3 5f            	clrw	x
4901  04c4 97            	ld	xl,a
4902  04c5 1f03          	ldw	(OFST-1,sp),x
4904                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4906  04c7 5f            	clrw	x
4907  04c8 7b02          	ld	a,(OFST-2,sp)
4908  04ca 97            	ld	xl,a
4909  04cb 7b04          	ld	a,(OFST+0,sp)
4910  04cd 01            	rrwa	x,a
4911  04ce 1a03          	or	a,(OFST-1,sp)
4912  04d0 01            	rrwa	x,a
4914                     ; 1556   return ((uint16_t)tmpcnt);
4918  04d1 5b04          	addw	sp,#4
4919  04d3 81            	ret	
4943                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4943                     ; 1573 {
4944                     	switch	.text
4945  04d4               _TIM3_GetPrescaler:
4949                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4951  04d4 c6528d        	ld	a,21133
4954  04d7 81            	ret	
5093                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5093                     ; 1592 {
5094                     	switch	.text
5095  04d8               _TIM3_GetFlagStatus:
5097  04d8 89            	pushw	x
5098  04d9 89            	pushw	x
5099       00000002      OFST:	set	2
5102                     ; 1593   FlagStatus bitstatus = RESET;
5104                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5106                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5108  04da 9f            	ld	a,xl
5109  04db c45285        	and	a,21125
5110  04de 6b01          	ld	(OFST-1,sp),a
5112                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5114  04e0 c65286        	ld	a,21126
5115  04e3 1403          	and	a,(OFST+1,sp)
5116  04e5 6b02          	ld	(OFST+0,sp),a
5118                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5120  04e7 1a01          	or	a,(OFST-1,sp)
5121  04e9 2702          	jreq	L3552
5122                     ; 1604     bitstatus = SET;
5124  04eb a601          	ld	a,#1
5127  04ed               L3552:
5128                     ; 1608     bitstatus = RESET;
5131                     ; 1610   return ((FlagStatus)bitstatus);
5135  04ed 5b04          	addw	sp,#4
5136  04ef 81            	ret	
5171                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5171                     ; 1625 {
5172                     	switch	.text
5173  04f0               _TIM3_ClearFlag:
5175  04f0 89            	pushw	x
5176       00000000      OFST:	set	0
5179                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5181                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5183  04f1 9f            	ld	a,xl
5184  04f2 43            	cpl	a
5185  04f3 c75285        	ld	21125,a
5186                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5188  04f6 7b01          	ld	a,(OFST+1,sp)
5189  04f8 43            	cpl	a
5190  04f9 c75286        	ld	21126,a
5191                     ; 1631 }
5194  04fc 85            	popw	x
5195  04fd 81            	ret	
5259                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5259                     ; 1645 {
5260                     	switch	.text
5261  04fe               _TIM3_GetITStatus:
5263  04fe 88            	push	a
5264  04ff 5203          	subw	sp,#3
5265       00000003      OFST:	set	3
5268                     ; 1646   __IO ITStatus bitstatus = RESET;
5270  0501 0f03          	clr	(OFST+0,sp)
5272                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5274  0503 0f01          	clr	(OFST-2,sp)
5278  0505 0f02          	clr	(OFST-1,sp)
5280                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5282                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5284  0507 c45285        	and	a,21125
5285  050a 6b01          	ld	(OFST-2,sp),a
5287                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5289  050c c65284        	ld	a,21124
5290  050f 1404          	and	a,(OFST+1,sp)
5291  0511 6b02          	ld	(OFST-1,sp),a
5293                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5295  0513 0d01          	tnz	(OFST-2,sp)
5296  0515 270a          	jreq	L7262
5298  0517 0d02          	tnz	(OFST-1,sp)
5299  0519 2706          	jreq	L7262
5300                     ; 1659     bitstatus = (ITStatus)SET;
5302  051b a601          	ld	a,#1
5303  051d 6b03          	ld	(OFST+0,sp),a
5306  051f 2002          	jra	L1362
5307  0521               L7262:
5308                     ; 1663     bitstatus = (ITStatus)RESET;
5310  0521 0f03          	clr	(OFST+0,sp)
5312  0523               L1362:
5313                     ; 1665   return ((ITStatus)bitstatus);
5315  0523 7b03          	ld	a,(OFST+0,sp)
5318  0525 5b04          	addw	sp,#4
5319  0527 81            	ret	
5355                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5355                     ; 1680 {
5356                     	switch	.text
5357  0528               _TIM3_ClearITPendingBit:
5361                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5363                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5365  0528 43            	cpl	a
5366  0529 c75285        	ld	21125,a
5367                     ; 1686 }
5370  052c 81            	ret	
5442                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5442                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5442                     ; 1705                        uint8_t TIM3_ICFilter)
5442                     ; 1706 {
5443                     	switch	.text
5444  052d               L3_TI1_Config:
5446  052d 89            	pushw	x
5447  052e 89            	pushw	x
5448       00000002      OFST:	set	2
5451                     ; 1707   uint8_t tmpccmr1 = 0;
5453                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5455  052f 9e            	ld	a,xh
5456  0530 6b01          	ld	(OFST-1,sp),a
5458                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5460  0532 c65288        	ld	a,21128
5461  0535 6b02          	ld	(OFST+0,sp),a
5463                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5465                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5467                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5469                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5471  0537 7211528a      	bres	21130,#0
5472                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5474  053b a40c          	and	a,#12
5475  053d 6b02          	ld	(OFST+0,sp),a
5477                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5479  053f 7b07          	ld	a,(OFST+5,sp)
5480  0541 97            	ld	xl,a
5481  0542 a610          	ld	a,#16
5482  0544 42            	mul	x,a
5483  0545 9f            	ld	a,xl
5484  0546 1a04          	or	a,(OFST+2,sp)
5485  0548 1a02          	or	a,(OFST+0,sp)
5486  054a 6b02          	ld	(OFST+0,sp),a
5488                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5490  054c c75288        	ld	21128,a
5491                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5493  054f 7b01          	ld	a,(OFST-1,sp)
5494  0551 4a            	dec	a
5495  0552 2606          	jrne	L7072
5496                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5498  0554 7212528a      	bset	21130,#1
5500  0558 2004          	jra	L1172
5501  055a               L7072:
5502                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5504  055a 7213528a      	bres	21130,#1
5505  055e               L1172:
5506                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5508  055e 7210528a      	bset	21130,#0
5509                     ; 1737 }
5512  0562 5b04          	addw	sp,#4
5513  0564 81            	ret	
5585                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5585                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5585                     ; 1756                        uint8_t TIM3_ICFilter)
5585                     ; 1757 {
5586                     	switch	.text
5587  0565               L5_TI2_Config:
5589  0565 89            	pushw	x
5590  0566 89            	pushw	x
5591       00000002      OFST:	set	2
5594                     ; 1758   uint8_t tmpccmr2 = 0;
5596                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5598  0567 9e            	ld	a,xh
5599  0568 6b01          	ld	(OFST-1,sp),a
5601                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5603                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5605                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5607                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5609  056a c65289        	ld	a,21129
5610  056d 6b02          	ld	(OFST+0,sp),a
5612                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5614  056f 7219528a      	bres	21130,#4
5615                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5617  0573 a40c          	and	a,#12
5618  0575 6b02          	ld	(OFST+0,sp),a
5620                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5622  0577 7b07          	ld	a,(OFST+5,sp)
5623  0579 97            	ld	xl,a
5624  057a a610          	ld	a,#16
5625  057c 42            	mul	x,a
5626  057d 9f            	ld	a,xl
5627  057e 1a04          	or	a,(OFST+2,sp)
5628  0580 1a02          	or	a,(OFST+0,sp)
5629  0582 6b02          	ld	(OFST+0,sp),a
5631                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5633  0584 c75289        	ld	21129,a
5634                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5636  0587 7b01          	ld	a,(OFST-1,sp)
5637  0589 4a            	dec	a
5638  058a 2606          	jrne	L1572
5639                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5641  058c 721a528a      	bset	21130,#5
5643  0590 2004          	jra	L3572
5644  0592               L1572:
5645                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5647  0592 721b528a      	bres	21130,#5
5648  0596               L3572:
5649                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5651  0596 7218528a      	bset	21130,#4
5652                     ; 1789 }
5655  059a 5b04          	addw	sp,#4
5656  059c 81            	ret	
5680                     ; 1797 FunctionalState TIM3_GetStatus(void)
5680                     ; 1798 {
5681                     	switch	.text
5682  059d               _TIM3_GetStatus:
5686                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5688  059d c65280        	ld	a,21120
5689  05a0 a401          	and	a,#1
5692  05a2 81            	ret	
5705                     	xdef	_TIM3_ClearITPendingBit
5706                     	xdef	_TIM3_GetITStatus
5707                     	xdef	_TIM3_ClearFlag
5708                     	xdef	_TIM3_GetFlagStatus
5709                     	xdef	_TIM3_GetPrescaler
5710                     	xdef	_TIM3_GetCounter
5711                     	xdef	_TIM3_GetCapture2
5712                     	xdef	_TIM3_GetCapture1
5713                     	xdef	_TIM3_SetIC2Prescaler
5714                     	xdef	_TIM3_SetIC1Prescaler
5715                     	xdef	_TIM3_SetCompare2
5716                     	xdef	_TIM3_SetCompare1
5717                     	xdef	_TIM3_SetAutoreload
5718                     	xdef	_TIM3_SetCounter
5719                     	xdef	_TIM3_SelectOCxM
5720                     	xdef	_TIM3_CCxCmd
5721                     	xdef	_TIM3_OC2PolarityConfig
5722                     	xdef	_TIM3_OC1PolarityConfig
5723                     	xdef	_TIM3_GenerateEvent
5724                     	xdef	_TIM3_OC2FastCmd
5725                     	xdef	_TIM3_OC1FastCmd
5726                     	xdef	_TIM3_OC2PreloadConfig
5727                     	xdef	_TIM3_OC1PreloadConfig
5728                     	xdef	_TIM3_ARRPreloadConfig
5729                     	xdef	_TIM3_ForcedOC2Config
5730                     	xdef	_TIM3_ForcedOC1Config
5731                     	xdef	_TIM3_CounterModeConfig
5732                     	xdef	_TIM3_PrescalerConfig
5733                     	xdef	_TIM3_EncoderInterfaceConfig
5734                     	xdef	_TIM3_SelectMasterSlaveMode
5735                     	xdef	_TIM3_SelectSlaveMode
5736                     	xdef	_TIM3_SelectOutputTrigger
5737                     	xdef	_TIM3_SelectOnePulseMode
5738                     	xdef	_TIM3_SelectHallSensor
5739                     	xdef	_TIM3_UpdateRequestConfig
5740                     	xdef	_TIM3_UpdateDisableConfig
5741                     	xdef	_TIM3_SelectInputTrigger
5742                     	xdef	_TIM3_TIxExternalClockConfig
5743                     	xdef	_TIM3_ETRConfig
5744                     	xdef	_TIM3_ETRClockMode2Config
5745                     	xdef	_TIM3_ETRClockMode1Config
5746                     	xdef	_TIM3_InternalClockConfig
5747                     	xdef	_TIM3_ITConfig
5748                     	xdef	_TIM3_CtrlPWMOutputs
5749                     	xdef	_TIM3_GetStatus
5750                     	xdef	_TIM3_Cmd
5751                     	xdef	_TIM3_PWMIConfig
5752                     	xdef	_TIM3_ICInit
5753                     	xdef	_TIM3_BKRConfig
5754                     	xdef	_TIM3_OC2Init
5755                     	xdef	_TIM3_OC1Init
5756                     	xdef	_TIM3_TimeBaseInit
5757                     	xdef	_TIM3_DeInit
5776                     	end
