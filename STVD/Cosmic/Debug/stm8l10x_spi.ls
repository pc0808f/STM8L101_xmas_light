   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 55 void SPI_DeInit(void)
  45                     ; 56 {
  47                     	switch	.text
  48  0000               _SPI_DeInit:
  52                     ; 57   SPI->CR1 = SPI_CR1_RESET_VALUE;
  54  0000 725f5200      	clr	20992
  55                     ; 58   SPI->CR2 = SPI_CR2_RESET_VALUE;
  57  0004 725f5201      	clr	20993
  58                     ; 59   SPI->ICR = SPI_ICR_RESET_VALUE;
  60  0008 725f5202      	clr	20994
  61                     ; 60   SPI->SR = SPI_SR_RESET_VALUE;
  63  000c 35025203      	mov	20995,#2
  64                     ; 61 }
  67  0010 81            	ret	
 371                     ; 103 void SPI_Init(SPI_FirstBit_TypeDef SPI_FirstBit, SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 371                     ; 104               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL, SPI_CPHA_TypeDef SPI_CPHA,
 371                     ; 105               SPI_DirectionMode_TypeDef SPI_DirectionMode, SPI_NSS_TypeDef SPI_NSS)
 371                     ; 106 {
 372                     	switch	.text
 373  0011               _SPI_Init:
 375  0011 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 109   assert_param(IS_SPI_FIRST_BIT(SPI_FirstBit));
 381                     ; 110   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 383                     ; 111   assert_param(IS_SPI_MODE(SPI_Mode));
 385                     ; 112   assert_param(IS_SPI_CPOL(SPI_CPOL));
 387                     ; 113   assert_param(IS_SPI_CPHA(SPI_CPHA));
 389                     ; 114   assert_param(IS_SPI_DIRECTION_MODE(SPI_DirectionMode));
 391                     ; 115   assert_param(IS_SPI_NSS(SPI_NSS));
 393                     ; 118   SPI->CR1 = (uint8_t)((uint8_t)(SPI_FirstBit) |
 393                     ; 119                        (uint8_t)(SPI_BaudRatePrescaler) |
 393                     ; 120                        (uint8_t)(SPI_CPOL) |
 393                     ; 121                        (uint8_t)(SPI_CPHA));
 395  0012 9f            	ld	a,xl
 396  0013 1a01          	or	a,(OFST+1,sp)
 397  0015 1a06          	or	a,(OFST+6,sp)
 398  0017 1a07          	or	a,(OFST+7,sp)
 399  0019 c75200        	ld	20992,a
 400                     ; 124   SPI->CR2 = (uint8_t)((uint8_t)(SPI_DirectionMode) | (uint8_t)(SPI_NSS));
 402  001c 7b08          	ld	a,(OFST+8,sp)
 403  001e 1a09          	or	a,(OFST+9,sp)
 404  0020 c75201        	ld	20993,a
 405                     ; 126   if (SPI_Mode == SPI_Mode_Master)
 407  0023 7b05          	ld	a,(OFST+5,sp)
 408  0025 a104          	cp	a,#4
 409  0027 2606          	jrne	L771
 410                     ; 128     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 412  0029 72105201      	bset	20993,#0
 414  002d 2004          	jra	L102
 415  002f               L771:
 416                     ; 132     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 418  002f 72115201      	bres	20993,#0
 419  0033               L102:
 420                     ; 136   SPI->CR1 |= (uint8_t)(SPI_Mode);
 422  0033 c65200        	ld	a,20992
 423  0036 1a05          	or	a,(OFST+5,sp)
 424  0038 c75200        	ld	20992,a
 425                     ; 137 }
 428  003b 85            	popw	x
 429  003c 81            	ret	
 484                     ; 145 void SPI_Cmd(FunctionalState NewState)
 484                     ; 146 {
 485                     	switch	.text
 486  003d               _SPI_Cmd:
 490                     ; 149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 492                     ; 151   if (NewState != DISABLE)
 494  003d 4d            	tnz	a
 495  003e 2705          	jreq	L132
 496                     ; 153     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral */
 498  0040 721c5200      	bset	20992,#6
 501  0044 81            	ret	
 502  0045               L132:
 503                     ; 157     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral */
 505  0045 721d5200      	bres	20992,#6
 506                     ; 160 }
 509  0049 81            	ret	
 611                     ; 174 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 611                     ; 175 {
 612                     	switch	.text
 613  004a               _SPI_ITConfig:
 615  004a 89            	pushw	x
 616  004b 88            	push	a
 617       00000001      OFST:	set	1
 620                     ; 176   uint8_t itpos = 0;
 622                     ; 178   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 624                     ; 179   assert_param(IS_FUNCTIONAL_STATE(NewState));
 626                     ; 182   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 628  004c 9e            	ld	a,xh
 629  004d a40f          	and	a,#15
 630  004f 5f            	clrw	x
 631  0050 97            	ld	xl,a
 632  0051 a601          	ld	a,#1
 633  0053 5d            	tnzw	x
 634  0054 2704          	jreq	L41
 635  0056               L61:
 636  0056 48            	sll	a
 637  0057 5a            	decw	x
 638  0058 26fc          	jrne	L61
 639  005a               L41:
 640  005a 6b01          	ld	(OFST+0,sp),a
 642                     ; 184   if (NewState != DISABLE)
 644  005c 0d03          	tnz	(OFST+2,sp)
 645  005e 2707          	jreq	L303
 646                     ; 186     SPI->ICR |= itpos; /* Enable interrupt*/
 648  0060 c65202        	ld	a,20994
 649  0063 1a01          	or	a,(OFST+0,sp)
 651  0065 2004          	jra	L503
 652  0067               L303:
 653                     ; 190     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 655  0067 43            	cpl	a
 656  0068 c45202        	and	a,20994
 657  006b               L503:
 658  006b c75202        	ld	20994,a
 659                     ; 192 }
 662  006e 5b03          	addw	sp,#3
 663  0070 81            	ret	
 697                     ; 199 void SPI_SendData(uint8_t Data)
 697                     ; 200 {
 698                     	switch	.text
 699  0071               _SPI_SendData:
 703                     ; 201   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 705  0071 c75204        	ld	20996,a
 706                     ; 202 }
 709  0074 81            	ret	
 732                     ; 209 uint8_t SPI_ReceiveData(void)
 732                     ; 210 {
 733                     	switch	.text
 734  0075               _SPI_ReceiveData:
 738                     ; 211   return ((uint8_t)SPI->DR); /* Return the data in the DR register */
 740  0075 c65204        	ld	a,20996
 743  0078 81            	ret	
 779                     ; 221 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 779                     ; 222 {
 780                     	switch	.text
 781  0079               _SPI_NSSInternalSoftwareCmd:
 785                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 787                     ; 227   if (NewState != DISABLE)
 789  0079 4d            	tnz	a
 790  007a 2705          	jreq	L353
 791                     ; 229     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software */
 793  007c 72105201      	bset	20993,#0
 796  0080 81            	ret	
 797  0081               L353:
 798                     ; 233     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software */
 800  0081 72115201      	bres	20993,#0
 801                     ; 236 }
 804  0085 81            	ret	
 860                     ; 246 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 860                     ; 247 {
 861                     	switch	.text
 862  0086               _SPI_BiDirectionalLineConfig:
 866                     ; 250   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 868                     ; 251   if (SPI_Direction != SPI_Direction_Rx)
 870  0086 4d            	tnz	a
 871  0087 2705          	jreq	L504
 872                     ; 253     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 874  0089 721c5201      	bset	20993,#6
 877  008d 81            	ret	
 878  008e               L504:
 879                     ; 257     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 881  008e 721d5201      	bres	20993,#6
 882                     ; 259 }
 885  0092 81            	ret	
 999                     ; 275 FlagStatus SPI_GetFlagStatus(SPI_FLAG_TypeDef SPI_FLAG)
 999                     ; 276 {
1000                     	switch	.text
1001  0093               _SPI_GetFlagStatus:
1003       00000001      OFST:	set	1
1006                     ; 277   FlagStatus status = RESET;
1008                     ; 279   assert_param(IS_SPI_FLAG(SPI_FLAG));
1010                     ; 282   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1012  0093 c45203        	and	a,20995
1013  0096 2702          	jreq	L364
1014                     ; 284     status = SET; /* SPI_FLAG is set */
1016  0098 a601          	ld	a,#1
1019  009a               L364:
1020                     ; 288     status = RESET; /* SPI_FLAG is reset*/
1023                     ; 292   return status;
1027  009a 81            	ret	
1050                     ; 306 void SPI_ClearFlag(void)
1050                     ; 307 {
1051                     	switch	.text
1052  009b               _SPI_ClearFlag:
1056                     ; 309   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1058  009b 35f75203      	mov	20995,#247
1059                     ; 310 }
1062  009f 81            	ret	
1144                     ; 323 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1144                     ; 324 {
1145                     	switch	.text
1146  00a0               _SPI_GetITStatus:
1148  00a0 88            	push	a
1149  00a1 89            	pushw	x
1150       00000002      OFST:	set	2
1153                     ; 325   ITStatus pendingbitstatus = RESET;
1155                     ; 326   uint8_t itpos = 0;
1157                     ; 327   uint8_t itmask1 = 0;
1159                     ; 328   uint8_t itmask2 = 0;
1161                     ; 329   uint8_t enablestatus = 0;
1163                     ; 330   assert_param(IS_SPI_GET_IT(SPI_IT));
1165                     ; 332   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1167  00a2 a40f          	and	a,#15
1168  00a4 5f            	clrw	x
1169  00a5 97            	ld	xl,a
1170  00a6 a601          	ld	a,#1
1171  00a8 5d            	tnzw	x
1172  00a9 2704          	jreq	L63
1173  00ab               L04:
1174  00ab 48            	sll	a
1175  00ac 5a            	decw	x
1176  00ad 26fc          	jrne	L04
1177  00af               L63:
1178  00af 6b01          	ld	(OFST-1,sp),a
1180                     ; 335   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1182  00b1 7b03          	ld	a,(OFST+1,sp)
1183  00b3 4e            	swap	a
1184  00b4 a40f          	and	a,#15
1185  00b6 6b02          	ld	(OFST+0,sp),a
1187                     ; 337   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1189  00b8 5f            	clrw	x
1190  00b9 97            	ld	xl,a
1191  00ba a601          	ld	a,#1
1192  00bc 5d            	tnzw	x
1193  00bd 2704          	jreq	L24
1194  00bf               L44:
1195  00bf 48            	sll	a
1196  00c0 5a            	decw	x
1197  00c1 26fc          	jrne	L44
1198  00c3               L24:
1200                     ; 339   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1202  00c3 c45203        	and	a,20995
1203  00c6 6b02          	ld	(OFST+0,sp),a
1205                     ; 341   if (((SPI->ICR & itpos) != (uint8_t)RESET) && enablestatus)
1207  00c8 c65202        	ld	a,20994
1208  00cb 1501          	bcp	a,(OFST-1,sp)
1209  00cd 2708          	jreq	L145
1211  00cf 7b02          	ld	a,(OFST+0,sp)
1212  00d1 2704          	jreq	L145
1213                     ; 344     pendingbitstatus = SET;
1215  00d3 a601          	ld	a,#1
1218  00d5 2001          	jra	L345
1219  00d7               L145:
1220                     ; 349     pendingbitstatus = RESET;
1222  00d7 4f            	clr	a
1224  00d8               L345:
1225                     ; 352   return  pendingbitstatus;
1229  00d8 5b03          	addw	sp,#3
1230  00da 81            	ret	
1254                     ; 367 void SPI_ClearITPendingBit(void)
1254                     ; 368 {
1255                     	switch	.text
1256  00db               _SPI_ClearITPendingBit:
1260                     ; 370   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1262  00db 35f75203      	mov	20995,#247
1263                     ; 371 }
1266  00df 81            	ret	
1279                     	xdef	_SPI_ClearITPendingBit
1280                     	xdef	_SPI_ClearFlag
1281                     	xdef	_SPI_GetITStatus
1282                     	xdef	_SPI_GetFlagStatus
1283                     	xdef	_SPI_ReceiveData
1284                     	xdef	_SPI_SendData
1285                     	xdef	_SPI_BiDirectionalLineConfig
1286                     	xdef	_SPI_NSSInternalSoftwareCmd
1287                     	xdef	_SPI_ITConfig
1288                     	xdef	_SPI_Cmd
1289                     	xdef	_SPI_Init
1290                     	xdef	_SPI_DeInit
1309                     	end
