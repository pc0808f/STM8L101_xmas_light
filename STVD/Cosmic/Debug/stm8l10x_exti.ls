   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 55 void EXTI_DeInit(void)
  45                     ; 56 {
  47                     	switch	.text
  48  0000               _EXTI_DeInit:
  52                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  60  0008 725f50a2      	clr	20642
  61                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  63  000c 725f50a3      	clr	20643
  64                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  66  0010 725f50a4      	clr	20644
  67                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  69  0014 725f50a5      	clr	20645
  70                     ; 63 }
  73  0018 81            	ret	
 177                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 177                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 177                     ; 86 {
 178                     	switch	.text
 179  0019               _EXTI_SetPortSensitivity:
 181  0019 89            	pushw	x
 182       00000000      OFST:	set	0
 185                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 187                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 189                     ; 93   if (EXTI_Port != EXTI_Port_B)
 191  001a 9e            	ld	a,xh
 192  001b 4d            	tnz	a
 193  001c 2707          	jreq	L76
 194                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 196  001e c650a2        	ld	a,20642
 197  0021 a4f3          	and	a,#243
 199  0023 2005          	jra	L17
 200  0025               L76:
 201                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 203  0025 c650a2        	ld	a,20642
 204  0028 a4fc          	and	a,#252
 205  002a               L17:
 206  002a c750a2        	ld	20642,a
 207                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 209  002d 7b01          	ld	a,(OFST+1,sp)
 210  002f 5f            	clrw	x
 211  0030 97            	ld	xl,a
 212  0031 7b02          	ld	a,(OFST+2,sp)
 213  0033 5d            	tnzw	x
 214  0034 2704          	jreq	L01
 215  0036               L21:
 216  0036 48            	sll	a
 217  0037 5a            	decw	x
 218  0038 26fc          	jrne	L21
 219  003a               L01:
 220  003a ca50a2        	or	a,20642
 221  003d c750a2        	ld	20642,a
 222                     ; 105 }
 225  0040 85            	popw	x
 226  0041 81            	ret	
 334                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 334                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 334                     ; 134 {
 335                     	switch	.text
 336  0042               _EXTI_SetPinSensitivity:
 338  0042 89            	pushw	x
 339       00000000      OFST:	set	0
 342                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 344                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 346                     ; 141   switch (EXTI_PinNum)
 348  0043 9e            	ld	a,xh
 350                     ; 175     default:
 350                     ; 176       break;
 351  0044 4d            	tnz	a
 352  0045 2728          	jreq	L37
 353  0047 a002          	sub	a,#2
 354  0049 273b          	jreq	L57
 355  004b a002          	sub	a,#2
 356  004d 274e          	jreq	L77
 357  004f a002          	sub	a,#2
 358  0051 2761          	jreq	L101
 359  0053 a00a          	sub	a,#10
 360  0055 277a          	jreq	L301
 361  0057 a002          	sub	a,#2
 362  0059 2603cc00ea    	jreq	L501
 363  005e a002          	sub	a,#2
 364  0060 2603cc0103    	jreq	L701
 365  0065 a002          	sub	a,#2
 366  0067 2603cc011c    	jreq	L111
 367  006c cc0139        	jra	L561
 368  006f               L37:
 369                     ; 143     case EXTI_Pin_0:
 369                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 371  006f c650a0        	ld	a,20640
 372  0072 a4fc          	and	a,#252
 373  0074 c750a0        	ld	20640,a
 374                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 376  0077 7b01          	ld	a,(OFST+1,sp)
 377  0079 5f            	clrw	x
 378  007a 97            	ld	xl,a
 379  007b 7b02          	ld	a,(OFST+2,sp)
 380  007d 5d            	tnzw	x
 381  007e 2749          	jreq	L23
 382  0080               L02:
 383  0080 48            	sll	a
 384  0081 5a            	decw	x
 385  0082 26fc          	jrne	L02
 386                     ; 146       break;
 388  0084 2043          	jp	L23
 389  0086               L57:
 390                     ; 147     case EXTI_Pin_1:
 390                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 392  0086 c650a0        	ld	a,20640
 393  0089 a4f3          	and	a,#243
 394  008b c750a0        	ld	20640,a
 395                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 397  008e 7b01          	ld	a,(OFST+1,sp)
 398  0090 5f            	clrw	x
 399  0091 97            	ld	xl,a
 400  0092 7b02          	ld	a,(OFST+2,sp)
 401  0094 5d            	tnzw	x
 402  0095 2732          	jreq	L23
 403  0097               L42:
 404  0097 48            	sll	a
 405  0098 5a            	decw	x
 406  0099 26fc          	jrne	L42
 407                     ; 150       break;
 409  009b 202c          	jp	L23
 410  009d               L77:
 411                     ; 151     case EXTI_Pin_2:
 411                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 413  009d c650a0        	ld	a,20640
 414  00a0 a4cf          	and	a,#207
 415  00a2 c750a0        	ld	20640,a
 416                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 418  00a5 7b01          	ld	a,(OFST+1,sp)
 419  00a7 5f            	clrw	x
 420  00a8 97            	ld	xl,a
 421  00a9 7b02          	ld	a,(OFST+2,sp)
 422  00ab 5d            	tnzw	x
 423  00ac 271b          	jreq	L23
 424  00ae               L03:
 425  00ae 48            	sll	a
 426  00af 5a            	decw	x
 427  00b0 26fc          	jrne	L03
 428                     ; 154       break;
 430  00b2 2015          	jp	L23
 431  00b4               L101:
 432                     ; 155     case EXTI_Pin_3:
 432                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 434  00b4 c650a0        	ld	a,20640
 435  00b7 a43f          	and	a,#63
 436  00b9 c750a0        	ld	20640,a
 437                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 439  00bc 7b01          	ld	a,(OFST+1,sp)
 440  00be 5f            	clrw	x
 441  00bf 97            	ld	xl,a
 442  00c0 7b02          	ld	a,(OFST+2,sp)
 443  00c2 5d            	tnzw	x
 444  00c3 2704          	jreq	L23
 445  00c5               L43:
 446  00c5 48            	sll	a
 447  00c6 5a            	decw	x
 448  00c7 26fc          	jrne	L43
 449  00c9               L23:
 450  00c9 ca50a0        	or	a,20640
 451  00cc c750a0        	ld	20640,a
 452                     ; 158       break;
 454  00cf 2068          	jra	L561
 455  00d1               L301:
 456                     ; 159     case EXTI_Pin_4:
 456                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 458  00d1 c650a1        	ld	a,20641
 459  00d4 a4fc          	and	a,#252
 460  00d6 c750a1        	ld	20641,a
 461                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 463  00d9 7b01          	ld	a,(OFST+1,sp)
 464  00db a4ef          	and	a,#239
 465  00dd 5f            	clrw	x
 466  00de 97            	ld	xl,a
 467  00df 7b02          	ld	a,(OFST+2,sp)
 468  00e1 5d            	tnzw	x
 469  00e2 274f          	jreq	L25
 470  00e4               L04:
 471  00e4 48            	sll	a
 472  00e5 5a            	decw	x
 473  00e6 26fc          	jrne	L04
 474                     ; 162       break;
 476  00e8 2049          	jp	L25
 477  00ea               L501:
 478                     ; 163     case EXTI_Pin_5:
 478                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 480  00ea c650a1        	ld	a,20641
 481  00ed a4f3          	and	a,#243
 482  00ef c750a1        	ld	20641,a
 483                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 485  00f2 7b01          	ld	a,(OFST+1,sp)
 486  00f4 a4ef          	and	a,#239
 487  00f6 5f            	clrw	x
 488  00f7 97            	ld	xl,a
 489  00f8 7b02          	ld	a,(OFST+2,sp)
 490  00fa 5d            	tnzw	x
 491  00fb 2736          	jreq	L25
 492  00fd               L44:
 493  00fd 48            	sll	a
 494  00fe 5a            	decw	x
 495  00ff 26fc          	jrne	L44
 496                     ; 166       break;
 498  0101 2030          	jp	L25
 499  0103               L701:
 500                     ; 167     case EXTI_Pin_6:
 500                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 502  0103 c650a1        	ld	a,20641
 503  0106 a4cf          	and	a,#207
 504  0108 c750a1        	ld	20641,a
 505                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 507  010b 7b01          	ld	a,(OFST+1,sp)
 508  010d a4ef          	and	a,#239
 509  010f 5f            	clrw	x
 510  0110 97            	ld	xl,a
 511  0111 7b02          	ld	a,(OFST+2,sp)
 512  0113 5d            	tnzw	x
 513  0114 271d          	jreq	L25
 514  0116               L05:
 515  0116 48            	sll	a
 516  0117 5a            	decw	x
 517  0118 26fc          	jrne	L05
 518                     ; 170       break;
 520  011a 2017          	jp	L25
 521  011c               L111:
 522                     ; 171     case EXTI_Pin_7:
 522                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 524  011c c650a1        	ld	a,20641
 525  011f a43f          	and	a,#63
 526  0121 c750a1        	ld	20641,a
 527                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 529  0124 7b01          	ld	a,(OFST+1,sp)
 530  0126 a4ef          	and	a,#239
 531  0128 5f            	clrw	x
 532  0129 97            	ld	xl,a
 533  012a 7b02          	ld	a,(OFST+2,sp)
 534  012c 5d            	tnzw	x
 535  012d 2704          	jreq	L25
 536  012f               L45:
 537  012f 48            	sll	a
 538  0130 5a            	decw	x
 539  0131 26fc          	jrne	L45
 540  0133               L25:
 541  0133 ca50a1        	or	a,20641
 542  0136 c750a1        	ld	20641,a
 543                     ; 174       break;
 545                     ; 175     default:
 545                     ; 176       break;
 547  0139               L561:
 548                     ; 178 }
 551  0139 85            	popw	x
 552  013a 81            	ret	
 656                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 656                     ; 194                                FunctionalState NewState)
 656                     ; 195 {
 657                     	switch	.text
 658  013b               _EXTI_SetHalfPortSelection:
 660  013b 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 666                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 668                     ; 200   if (NewState != DISABLE)
 670  013c 9f            	ld	a,xl
 671  013d 4d            	tnz	a
 672  013e 2706          	jreq	L532
 673                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 675  0140 9e            	ld	a,xh
 676  0141 ca50a5        	or	a,20645
 678  0144 2006          	jra	L732
 679  0146               L532:
 680                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 682  0146 7b01          	ld	a,(OFST+1,sp)
 683  0148 43            	cpl	a
 684  0149 c450a5        	and	a,20645
 685  014c               L732:
 686  014c c750a5        	ld	20645,a
 687                     ; 208 }
 690  014f 85            	popw	x
 691  0150 81            	ret	
 737                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 737                     ; 219 {
 738                     	switch	.text
 739  0151               _EXTI_GetPortSensitivity:
 741       00000001      OFST:	set	1
 744                     ; 220   uint8_t value = 0;
 746                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 748                     ; 225   if (EXTI_Port != EXTI_Port_B)
 750  0151 4d            	tnz	a
 751  0152 2707          	jreq	L362
 752                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 754  0154 c650a2        	ld	a,20642
 755  0157 44            	srl	a
 756  0158 44            	srl	a
 758  0159 2003          	jra	L562
 759  015b               L362:
 760                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 762  015b c650a2        	ld	a,20642
 763  015e               L562:
 764  015e a403          	and	a,#3
 766                     ; 233   return((EXTI_Trigger_TypeDef)value);
 770  0160 81            	ret	
 816                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 816                     ; 251 {
 817                     	switch	.text
 818  0161               _EXTI_GetPinSensitivity:
 820  0161 88            	push	a
 821       00000001      OFST:	set	1
 824                     ; 252   uint8_t value = 0;
 826  0162 0f01          	clr	(OFST+0,sp)
 828                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 830                     ; 257   switch (EXTI_PinNum)
 833                     ; 283     default:
 833                     ; 284       break;
 834  0164 4d            	tnz	a
 835  0165 2720          	jreq	L762
 836  0167 a002          	sub	a,#2
 837  0169 2721          	jreq	L172
 838  016b a002          	sub	a,#2
 839  016d 2722          	jreq	L372
 840  016f a002          	sub	a,#2
 841  0171 2724          	jreq	L572
 842  0173 a00a          	sub	a,#10
 843  0175 2725          	jreq	L772
 844  0177 a002          	sub	a,#2
 845  0179 2726          	jreq	L103
 846  017b a002          	sub	a,#2
 847  017d 2727          	jreq	L303
 848  017f a002          	sub	a,#2
 849  0181 2729          	jreq	L503
 850  0183 7b01          	ld	a,(OFST+0,sp)
 851  0185 202d          	jra	L533
 852  0187               L762:
 853                     ; 259     case EXTI_Pin_0:
 853                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 855  0187 c650a0        	ld	a,20640
 856                     ; 261       break;
 858  018a 2026          	jp	LC003
 859  018c               L172:
 860                     ; 262     case EXTI_Pin_1:
 860                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 862  018c c650a0        	ld	a,20640
 863                     ; 264       break;
 865  018f 201f          	jp	LC004
 866  0191               L372:
 867                     ; 265     case EXTI_Pin_2:
 867                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 869  0191 c650a0        	ld	a,20640
 870  0194 4e            	swap	a
 871                     ; 267       break;
 873  0195 201b          	jp	LC003
 874  0197               L572:
 875                     ; 268     case EXTI_Pin_3:
 875                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 877  0197 c650a0        	ld	a,20640
 878                     ; 270       break;
 880  019a 2013          	jp	LC005
 881  019c               L772:
 882                     ; 271     case EXTI_Pin_4:
 882                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 884  019c c650a1        	ld	a,20641
 885                     ; 273       break;
 887  019f 2011          	jp	LC003
 888  01a1               L103:
 889                     ; 274     case EXTI_Pin_5:
 889                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 891  01a1 c650a1        	ld	a,20641
 892                     ; 276       break;
 894  01a4 200a          	jp	LC004
 895  01a6               L303:
 896                     ; 277     case EXTI_Pin_6:
 896                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 898  01a6 c650a1        	ld	a,20641
 899  01a9 4e            	swap	a
 900                     ; 279       break;
 902  01aa 2006          	jp	LC003
 903  01ac               L503:
 904                     ; 280     case EXTI_Pin_7:
 904                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 906  01ac c650a1        	ld	a,20641
 907  01af               LC005:
 908  01af 4e            	swap	a
 909  01b0               LC004:
 910  01b0 44            	srl	a
 911  01b1 44            	srl	a
 912  01b2               LC003:
 913  01b2 a403          	and	a,#3
 915                     ; 282       break;
 917                     ; 283     default:
 917                     ; 284       break;
 919  01b4               L533:
 920                     ; 286   return((EXTI_Trigger_TypeDef)value);
 924  01b4 5b01          	addw	sp,#1
 925  01b6 81            	ret	
 972                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
 972                     ; 300 {
 973                     	switch	.text
 974  01b7               _EXTI_GetHalfPortSelection:
 976       00000001      OFST:	set	1
 979                     ; 301   FunctionalState value = DISABLE;
 981                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 983                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
 985  01b7 c450a5        	and	a,20645
 986  01ba 2702          	jreq	L163
 987                     ; 306     value = ENABLE;
 989  01bc a601          	ld	a,#1
 992  01be               L163:
 993                     ; 310     value = DISABLE;
 996                     ; 313   return(value);
1000  01be 81            	ret	
1142                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1142                     ; 333 {
1143                     	switch	.text
1144  01bf               _EXTI_GetITStatus:
1146  01bf 88            	push	a
1147  01c0 88            	push	a
1148       00000001      OFST:	set	1
1151                     ; 334   ITStatus status = RESET;
1153                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1155                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1157  01c1 a4f0          	and	a,#240
1158  01c3 a1f0          	cp	a,#240
1159  01c5 2609          	jrne	L744
1160                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1162  01c7 7b02          	ld	a,(OFST+1,sp)
1163  01c9 a40f          	and	a,#15
1164  01cb c450a4        	and	a,20644
1167  01ce 2005          	jra	L154
1168  01d0               L744:
1169                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1171  01d0 c650a3        	ld	a,20643
1172  01d3 1402          	and	a,(OFST+1,sp)
1174  01d5               L154:
1175                     ; 346   return((ITStatus)status);
1179  01d5 85            	popw	x
1180  01d6 81            	ret	
1216                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1216                     ; 366 {
1217                     	switch	.text
1218  01d7               _EXTI_ClearITPendingBit:
1220  01d7 88            	push	a
1221       00000000      OFST:	set	0
1224                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1226                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1228  01d8 a4f0          	and	a,#240
1229  01da a1f0          	cp	a,#240
1230  01dc 2609          	jrne	L174
1231                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1233  01de 7b01          	ld	a,(OFST+1,sp)
1234  01e0 a40f          	and	a,#15
1235  01e2 c750a4        	ld	20644,a
1237  01e5 2005          	jra	L374
1238  01e7               L174:
1239                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1241  01e7 7b01          	ld	a,(OFST+1,sp)
1242  01e9 c750a3        	ld	20643,a
1243  01ec               L374:
1244                     ; 378 }
1247  01ec 84            	pop	a
1248  01ed 81            	ret	
1261                     	xdef	_EXTI_ClearITPendingBit
1262                     	xdef	_EXTI_GetITStatus
1263                     	xdef	_EXTI_GetHalfPortSelection
1264                     	xdef	_EXTI_GetPinSensitivity
1265                     	xdef	_EXTI_GetPortSensitivity
1266                     	xdef	_EXTI_SetHalfPortSelection
1267                     	xdef	_EXTI_SetPinSensitivity
1268                     	xdef	_EXTI_SetPortSensitivity
1269                     	xdef	_EXTI_DeInit
1288                     	end
