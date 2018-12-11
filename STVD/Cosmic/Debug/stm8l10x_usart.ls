   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 59 void USART_DeInit(void)
  45                     ; 60 {
  47                     	switch	.text
  48  0000               _USART_DeInit:
  52                     ; 63   (void)USART->SR;
  54  0000 c65230        	ld	a,21040
  55                     ; 64   (void)USART->DR;
  57  0003 c65231        	ld	a,21041
  58                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  60  0006 725f5233      	clr	21043
  61                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  63  000a 725f5232      	clr	21042
  64                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  66  000e 725f5234      	clr	21044
  67                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  69  0012 725f5235      	clr	21045
  70                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  72  0016 725f5236      	clr	21046
  73                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  75  001a 725f5237      	clr	21047
  76                     ; 73 }
  79  001e 81            	ret	
 252                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 252                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 252                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 252                     ; 103 {
 253                     	switch	.text
 254  001f               _USART_Init:
 256  001f 5204          	subw	sp,#4
 257       00000004      OFST:	set	4
 260                     ; 104   uint32_t BaudRate_Mantissa = 0;
 262                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 264                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 266                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 268                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 270                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 272                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 274  0021 c65234        	ld	a,21044
 275  0024 a4e9          	and	a,#233
 276  0026 c75234        	ld	21044,a
 277                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 279  0029 7b0b          	ld	a,(OFST+7,sp)
 280  002b 1a0d          	or	a,(OFST+9,sp)
 281  002d ca5234        	or	a,21044
 282  0030 c75234        	ld	21044,a
 283                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 285  0033 c65236        	ld	a,21046
 286  0036 a4cf          	and	a,#207
 287  0038 c75236        	ld	21046,a
 288                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 290  003b c65236        	ld	a,21046
 291  003e 1a0c          	or	a,(OFST+8,sp)
 292  0040 c75236        	ld	21046,a
 293                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 295  0043 725f5232      	clr	21042
 296                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 298  0047 c65233        	ld	a,21043
 299  004a a40f          	and	a,#15
 300  004c c75233        	ld	21043,a
 301                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 303  004f c65233        	ld	a,21043
 304  0052 a4f0          	and	a,#240
 305  0054 c75233        	ld	21043,a
 306                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 308  0057 cd0000        	call	_CLK_GetClockFreq
 310  005a 96            	ldw	x,sp
 311  005b 1c0007        	addw	x,#OFST+3
 312  005e cd0000        	call	c_ludv
 314  0061 96            	ldw	x,sp
 315  0062 5c            	incw	x
 316  0063 cd0000        	call	c_rtol
 319                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 321  0066 7b03          	ld	a,(OFST-1,sp)
 322  0068 a4f0          	and	a,#240
 323  006a c75233        	ld	21043,a
 324                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 326  006d 7b04          	ld	a,(OFST+0,sp)
 327  006f a40f          	and	a,#15
 328  0071 ca5233        	or	a,21043
 329  0074 c75233        	ld	21043,a
 330                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 332  0077 96            	ldw	x,sp
 333  0078 5c            	incw	x
 334  0079 cd0000        	call	c_ltor
 336  007c a604          	ld	a,#4
 337  007e cd0000        	call	c_lursh
 339  0081 5500035232    	mov	21042,c_lreg+3
 340                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 342  0086 c65235        	ld	a,21045
 343  0089 a4f3          	and	a,#243
 344  008b c75235        	ld	21045,a
 345                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 347  008e c65235        	ld	a,21045
 348  0091 1a0e          	or	a,(OFST+10,sp)
 349  0093 c75235        	ld	21045,a
 350                     ; 147 }
 353  0096 5b04          	addw	sp,#4
 354  0098 81            	ret	
 502                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 502                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 502                     ; 173 {
 503                     	switch	.text
 504  0099               _USART_ClockInit:
 506  0099 89            	pushw	x
 507       00000000      OFST:	set	0
 510                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 512                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 514                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 516                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 518                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 520  009a c65236        	ld	a,21046
 521  009d a4f8          	and	a,#248
 522  009f c75236        	ld	21046,a
 523                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 525  00a2 9f            	ld	a,xl
 526  00a3 1a05          	or	a,(OFST+5,sp)
 527  00a5 1a06          	or	a,(OFST+6,sp)
 528  00a7 ca5236        	or	a,21046
 529  00aa c75236        	ld	21046,a
 530                     ; 185   if (USART_Clock != USART_Clock_Disable)
 532  00ad 7b01          	ld	a,(OFST+1,sp)
 533  00af 2706          	jreq	L712
 534                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 536  00b1 72165236      	bset	21046,#3
 538  00b5 2004          	jra	L122
 539  00b7               L712:
 540                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 542  00b7 72175236      	bres	21046,#3
 543  00bb               L122:
 544                     ; 193 }
 547  00bb 85            	popw	x
 548  00bc 81            	ret	
 603                     ; 201 void USART_Cmd(FunctionalState NewState)
 603                     ; 202 {
 604                     	switch	.text
 605  00bd               _USART_Cmd:
 609                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 611                     ; 205   if (NewState != DISABLE)
 613  00bd 4d            	tnz	a
 614  00be 2705          	jreq	L152
 615                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 617  00c0 721b5234      	bres	21044,#5
 620  00c4 81            	ret	
 621  00c5               L152:
 622                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 624  00c5 721a5234      	bset	21044,#5
 625                     ; 213 }
 628  00c9 81            	ret	
 739                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 739                     ; 230 {
 740                     	switch	.text
 741  00ca               _USART_ITConfig:
 743  00ca 89            	pushw	x
 744  00cb 89            	pushw	x
 745       00000002      OFST:	set	2
 748                     ; 231   uint8_t uartreg, itpos = 0x00;
 750                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 752                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 754                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 756  00cc 9e            	ld	a,xh
 757  00cd 6b01          	ld	(OFST-1,sp),a
 759                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 761  00cf 9f            	ld	a,xl
 762  00d0 a40f          	and	a,#15
 763  00d2 5f            	clrw	x
 764  00d3 97            	ld	xl,a
 765  00d4 a601          	ld	a,#1
 766  00d6 5d            	tnzw	x
 767  00d7 2704          	jreq	L02
 768  00d9               L22:
 769  00d9 48            	sll	a
 770  00da 5a            	decw	x
 771  00db 26fc          	jrne	L22
 772  00dd               L02:
 773  00dd 6b02          	ld	(OFST+0,sp),a
 775                     ; 240   if (NewState != DISABLE)
 777  00df 7b07          	ld	a,(OFST+5,sp)
 778  00e1 2713          	jreq	L723
 779                     ; 243     if (uartreg == 0x01)
 781  00e3 7b01          	ld	a,(OFST-1,sp)
 782  00e5 4a            	dec	a
 783  00e6 2607          	jrne	L133
 784                     ; 245       USART->CR1 |= itpos;
 786  00e8 c65234        	ld	a,21044
 787  00eb 1a02          	or	a,(OFST+0,sp)
 789  00ed 2012          	jp	LC002
 790  00ef               L133:
 791                     ; 250       USART->CR2 |= itpos;
 793  00ef c65235        	ld	a,21045
 794  00f2 1a02          	or	a,(OFST+0,sp)
 795  00f4 2016          	jp	LC001
 796  00f6               L723:
 797                     ; 256     if (uartreg == 0x01)
 799  00f6 7b01          	ld	a,(OFST-1,sp)
 800  00f8 4a            	dec	a
 801  00f9 260b          	jrne	L733
 802                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 804  00fb 7b02          	ld	a,(OFST+0,sp)
 805  00fd 43            	cpl	a
 806  00fe c45234        	and	a,21044
 807  0101               LC002:
 808  0101 c75234        	ld	21044,a
 810  0104 2009          	jra	L533
 811  0106               L733:
 812                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 814  0106 7b02          	ld	a,(OFST+0,sp)
 815  0108 43            	cpl	a
 816  0109 c45235        	and	a,21045
 817  010c               LC001:
 818  010c c75235        	ld	21045,a
 819  010f               L533:
 820                     ; 267 }
 823  010f 5b04          	addw	sp,#4
 824  0111 81            	ret	
 847                     ; 275 uint8_t USART_ReceiveData8(void)
 847                     ; 276 {
 848                     	switch	.text
 849  0112               _USART_ReceiveData8:
 853                     ; 277   return USART->DR;
 855  0112 c65231        	ld	a,21041
 858  0115 81            	ret	
 892                     ; 287 uint16_t USART_ReceiveData9(void)
 892                     ; 288 {
 893                     	switch	.text
 894  0116               _USART_ReceiveData9:
 896  0116 89            	pushw	x
 897       00000002      OFST:	set	2
 900                     ; 289   uint16_t temp = 0;
 902                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 904  0117 c65234        	ld	a,21044
 905  011a a480          	and	a,#128
 906  011c 5f            	clrw	x
 907  011d 02            	rlwa	x,a
 908  011e 58            	sllw	x
 909  011f 1f01          	ldw	(OFST-1,sp),x
 911                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 913  0121 c65231        	ld	a,21041
 914  0124 5f            	clrw	x
 915  0125 97            	ld	xl,a
 916  0126 01            	rrwa	x,a
 917  0127 1a02          	or	a,(OFST+0,sp)
 918  0129 01            	rrwa	x,a
 919  012a 1a01          	or	a,(OFST-1,sp)
 920  012c a401          	and	a,#1
 921  012e 01            	rrwa	x,a
 924  012f 5b02          	addw	sp,#2
 925  0131 81            	ret	
 961                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 961                     ; 302 {
 962                     	switch	.text
 963  0132               _USART_ReceiverWakeUpCmd:
 967                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 969                     ; 305   if (NewState != DISABLE)
 971  0132 4d            	tnz	a
 972  0133 2705          	jreq	L704
 973                     ; 308     USART->CR2 |= USART_CR2_RWU;
 975  0135 72125235      	bset	21045,#1
 978  0139 81            	ret	
 979  013a               L704:
 980                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 982  013a 72135235      	bres	21045,#1
 983                     ; 315 }
 986  013e 81            	ret	
1009                     ; 322 void USART_SendBreak(void)
1009                     ; 323 {
1010                     	switch	.text
1011  013f               _USART_SendBreak:
1015                     ; 324   USART->CR2 |= USART_CR2_SBK;
1017  013f 72105235      	bset	21045,#0
1018                     ; 325 }
1021  0143 81            	ret	
1055                     ; 332 void USART_SendData8(uint8_t Data)
1055                     ; 333 {
1056                     	switch	.text
1057  0144               _USART_SendData8:
1061                     ; 335   USART->DR = Data;
1063  0144 c75231        	ld	21041,a
1064                     ; 336 }
1067  0147 81            	ret	
1101                     ; 344 void USART_SendData9(uint16_t Data)
1101                     ; 345 {
1102                     	switch	.text
1103  0148               _USART_SendData9:
1105  0148 89            	pushw	x
1106       00000000      OFST:	set	0
1109                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1111                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1113  0149 721d5234      	bres	21044,#6
1114                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1116  014d 54            	srlw	x
1117  014e 54            	srlw	x
1118  014f 9f            	ld	a,xl
1119  0150 a440          	and	a,#64
1120  0152 ca5234        	or	a,21044
1121  0155 c75234        	ld	21044,a
1122                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1124  0158 7b02          	ld	a,(OFST+2,sp)
1125  015a c75231        	ld	21041,a
1126                     ; 352 }
1129  015d 85            	popw	x
1130  015e 81            	ret	
1164                     ; 360 void USART_SetAddress(uint8_t Address)
1164                     ; 361 {
1165                     	switch	.text
1166  015f               _USART_SetAddress:
1168  015f 88            	push	a
1169       00000000      OFST:	set	0
1172                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1174                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1176  0160 c65237        	ld	a,21047
1177  0163 a4f0          	and	a,#240
1178  0165 c75237        	ld	21047,a
1179                     ; 368   USART->CR4 |= Address;
1181  0168 c65237        	ld	a,21047
1182  016b 1a01          	or	a,(OFST+1,sp)
1183  016d c75237        	ld	21047,a
1184                     ; 369 }
1187  0170 84            	pop	a
1188  0171 81            	ret	
1245                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1245                     ; 380 {
1246                     	switch	.text
1247  0172               _USART_WakeUpConfig:
1251                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1253                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1255  0172 72175234      	bres	21044,#3
1256                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1258  0176 ca5234        	or	a,21044
1259  0179 c75234        	ld	21044,a
1260                     ; 385 }
1263  017c 81            	ret	
1399                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1399                     ; 401 {
1400                     	switch	.text
1401  017d               _USART_GetFlagStatus:
1403  017d 89            	pushw	x
1404  017e 88            	push	a
1405       00000001      OFST:	set	1
1408                     ; 402   FlagStatus status = RESET;
1410                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1412                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1414  017f a30101        	cpw	x,#257
1415  0182 2608          	jrne	L306
1416                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1418  0184 9f            	ld	a,xl
1419  0185 c45235        	and	a,21045
1420  0188 270e          	jreq	L116
1421                     ; 412       status = SET;
1423  018a 2007          	jp	LC004
1424                     ; 417       status = RESET;
1425  018c               L306:
1426                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1428  018c c65230        	ld	a,21040
1429  018f 1503          	bcp	a,(OFST+2,sp)
1430  0191 2704          	jreq	L316
1431                     ; 425       status = SET;
1433  0193               LC004:
1435  0193 a601          	ld	a,#1
1439  0195 2001          	jra	L116
1440  0197               L316:
1441                     ; 430       status = RESET;
1443  0197 4f            	clr	a
1445  0198               L116:
1446                     ; 434   return status;
1450  0198 5b03          	addw	sp,#3
1451  019a 81            	ret	
1474                     ; 454 void USART_ClearFlag(void)
1474                     ; 455 {
1475                     	switch	.text
1476  019b               _USART_ClearFlag:
1480                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1482  019b 35df5230      	mov	21040,#223
1483                     ; 458 }
1486  019f 81            	ret	
1568                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1568                     ; 473 {
1569                     	switch	.text
1570  01a0               _USART_GetITStatus:
1572  01a0 89            	pushw	x
1573  01a1 89            	pushw	x
1574       00000002      OFST:	set	2
1577                     ; 474   ITStatus pendingbitstatus = RESET;
1579                     ; 475   uint8_t itpos = 0;
1581                     ; 476   uint8_t itmask1 = 0;
1583                     ; 477   uint8_t itmask2 = 0;
1585                     ; 478   uint8_t enablestatus = 0;
1587                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1589                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1591  01a2 9f            	ld	a,xl
1592  01a3 a40f          	and	a,#15
1593  01a5 5f            	clrw	x
1594  01a6 97            	ld	xl,a
1595  01a7 a601          	ld	a,#1
1596  01a9 5d            	tnzw	x
1597  01aa 2704          	jreq	L25
1598  01ac               L45:
1599  01ac 48            	sll	a
1600  01ad 5a            	decw	x
1601  01ae 26fc          	jrne	L45
1602  01b0               L25:
1603  01b0 6b01          	ld	(OFST-1,sp),a
1605                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1607  01b2 7b04          	ld	a,(OFST+2,sp)
1608  01b4 4e            	swap	a
1609  01b5 a40f          	and	a,#15
1610  01b7 6b02          	ld	(OFST+0,sp),a
1612                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1614  01b9 5f            	clrw	x
1615  01ba 97            	ld	xl,a
1616  01bb a601          	ld	a,#1
1617  01bd 5d            	tnzw	x
1618  01be 2704          	jreq	L65
1619  01c0               L06:
1620  01c0 48            	sll	a
1621  01c1 5a            	decw	x
1622  01c2 26fc          	jrne	L06
1623  01c4               L65:
1624  01c4 6b02          	ld	(OFST+0,sp),a
1626                     ; 492   if (USART_IT == USART_IT_PE)
1628  01c6 1e03          	ldw	x,(OFST+1,sp)
1629  01c8 a30100        	cpw	x,#256
1630  01cb 2614          	jrne	L176
1631                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1633  01cd c65234        	ld	a,21044
1634  01d0 1402          	and	a,(OFST+0,sp)
1635  01d2 6b02          	ld	(OFST+0,sp),a
1637                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1639  01d4 c65230        	ld	a,21040
1640  01d7 1501          	bcp	a,(OFST-1,sp)
1641  01d9 271c          	jreq	L107
1643  01db 7b02          	ld	a,(OFST+0,sp)
1644  01dd 2718          	jreq	L107
1645                     ; 501       pendingbitstatus = SET;
1647  01df 2012          	jp	LC006
1648                     ; 506       pendingbitstatus = RESET;
1649  01e1               L176:
1650                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1652  01e1 c65235        	ld	a,21045
1653  01e4 1402          	and	a,(OFST+0,sp)
1654  01e6 6b02          	ld	(OFST+0,sp),a
1656                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1658  01e8 c65230        	ld	a,21040
1659  01eb 1501          	bcp	a,(OFST-1,sp)
1660  01ed 2708          	jreq	L107
1662  01ef 7b02          	ld	a,(OFST+0,sp)
1663  01f1 2704          	jreq	L107
1664                     ; 517       pendingbitstatus = SET;
1666  01f3               LC006:
1668  01f3 a601          	ld	a,#1
1671  01f5 2001          	jra	L776
1672  01f7               L107:
1673                     ; 522       pendingbitstatus = RESET;
1676  01f7 4f            	clr	a
1678  01f8               L776:
1679                     ; 527   return  pendingbitstatus;
1683  01f8 5b04          	addw	sp,#4
1684  01fa 81            	ret	
1708                     ; 546 void USART_ClearITPendingBit(void)
1708                     ; 547 {
1709                     	switch	.text
1710  01fb               _USART_ClearITPendingBit:
1714                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1716  01fb 35df5230      	mov	21040,#223
1717                     ; 550 }
1720  01ff 81            	ret	
1733                     	xdef	_USART_ClearITPendingBit
1734                     	xdef	_USART_GetITStatus
1735                     	xdef	_USART_ClearFlag
1736                     	xdef	_USART_GetFlagStatus
1737                     	xdef	_USART_WakeUpConfig
1738                     	xdef	_USART_SetAddress
1739                     	xdef	_USART_SendData9
1740                     	xdef	_USART_SendData8
1741                     	xdef	_USART_SendBreak
1742                     	xdef	_USART_ReceiverWakeUpCmd
1743                     	xdef	_USART_ReceiveData9
1744                     	xdef	_USART_ReceiveData8
1745                     	xdef	_USART_ITConfig
1746                     	xdef	_USART_Cmd
1747                     	xdef	_USART_ClockInit
1748                     	xdef	_USART_Init
1749                     	xdef	_USART_DeInit
1750                     	xref	_CLK_GetClockFreq
1751                     	xref.b	c_lreg
1752                     	xref.b	c_x
1771                     	xref	c_lursh
1772                     	xref	c_ltor
1773                     	xref	c_rtol
1774                     	xref	c_ludv
1775                     	end
