   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 56 void TIM4_DeInit(void)
  45                     ; 57 {
  47                     	switch	.text
  48  0000               _TIM4_DeInit:
  52                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  54  0000 725f52e0      	clr	21216
  55                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  57  0004 725f52e1      	clr	21217
  58                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  60  0008 725f52e2      	clr	21218
  61                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  63  000c 725f52e3      	clr	21219
  64                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  66  0010 725f52e6      	clr	21222
  67                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  69  0014 725f52e7      	clr	21223
  70                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  72  0018 35ff52e8      	mov	21224,#255
  73                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  75  001c 725f52e4      	clr	21220
  76                     ; 66 }
  79  0020 81            	ret	
 247                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 247                     ; 92                        uint8_t TIM4_Period)
 247                     ; 93 {
 248                     	switch	.text
 249  0021               _TIM4_TimeBaseInit:
 253                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 255                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 257  0021 9f            	ld	a,xl
 258  0022 c752e8        	ld	21224,a
 259                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 261  0025 9e            	ld	a,xh
 262  0026 c752e7        	ld	21223,a
 263                     ; 100 }
 266  0029 81            	ret	
 321                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 321                     ; 109 {
 322                     	switch	.text
 323  002a               _TIM4_Cmd:
 327                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 329                     ; 114   if (NewState != DISABLE)
 331  002a 4d            	tnz	a
 332  002b 2705          	jreq	L531
 333                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 335  002d 721052e0      	bset	21216,#0
 338  0031 81            	ret	
 339  0032               L531:
 340                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 342  0032 721152e0      	bres	21216,#0
 343                     ; 122 }
 346  0036 81            	ret	
 411                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 411                     ; 135 {
 412                     	switch	.text
 413  0037               _TIM4_ITConfig:
 415  0037 89            	pushw	x
 416       00000000      OFST:	set	0
 419                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 421                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 423                     ; 140   if (NewState != DISABLE)
 425  0038 9f            	ld	a,xl
 426  0039 4d            	tnz	a
 427  003a 2706          	jreq	L371
 428                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 430  003c 9e            	ld	a,xh
 431  003d ca52e3        	or	a,21219
 433  0040 2006          	jra	L571
 434  0042               L371:
 435                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 437  0042 7b01          	ld	a,(OFST+1,sp)
 438  0044 43            	cpl	a
 439  0045 c452e3        	and	a,21219
 440  0048               L571:
 441  0048 c752e3        	ld	21219,a
 442                     ; 150 }
 445  004b 85            	popw	x
 446  004c 81            	ret	
 470                     ; 157 void TIM4_InternalClockConfig(void)
 470                     ; 158 {
 471                     	switch	.text
 472  004d               _TIM4_InternalClockConfig:
 476                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 478  004d c652e2        	ld	a,21218
 479  0050 a4f8          	and	a,#248
 480  0052 c752e2        	ld	21218,a
 481                     ; 161 }
 484  0055 81            	ret	
 552                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 552                     ; 172 {
 553                     	switch	.text
 554  0056               _TIM4_SelectInputTrigger:
 556  0056 88            	push	a
 557  0057 88            	push	a
 558       00000001      OFST:	set	1
 561                     ; 173   uint8_t tmpsmcr = 0;
 563                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 565                     ; 178   tmpsmcr = TIM4->SMCR;
 567  0058 c652e2        	ld	a,21218
 569                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 571  005b a48f          	and	a,#143
 573                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 575  005d 1a02          	or	a,(OFST+1,sp)
 577                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 579  005f c752e2        	ld	21218,a
 580                     ; 185 }
 583  0062 85            	popw	x
 584  0063 81            	ret	
 620                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 620                     ; 194 {
 621                     	switch	.text
 622  0064               _TIM4_UpdateDisableConfig:
 626                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 628                     ; 199   if (NewState != DISABLE)
 630  0064 4d            	tnz	a
 631  0065 2705          	jreq	L752
 632                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 634  0067 721252e0      	bset	21216,#1
 637  006b 81            	ret	
 638  006c               L752:
 639                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 641  006c 721352e0      	bres	21216,#1
 642                     ; 207 }
 645  0070 81            	ret	
 703                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 703                     ; 218 {
 704                     	switch	.text
 705  0071               _TIM4_UpdateRequestConfig:
 709                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 711                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 713  0071 4a            	dec	a
 714  0072 2605          	jrne	L113
 715                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 717  0074 721452e0      	bset	21216,#2
 720  0078 81            	ret	
 721  0079               L113:
 722                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 724  0079 721552e0      	bres	21216,#2
 725                     ; 231 }
 728  007d 81            	ret	
 785                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 785                     ; 242 {
 786                     	switch	.text
 787  007e               _TIM4_SelectOnePulseMode:
 791                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 793                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 795  007e 4a            	dec	a
 796  007f 2605          	jrne	L343
 797                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 799  0081 721652e0      	bset	21216,#3
 802  0085 81            	ret	
 803  0086               L343:
 804                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 806  0086 721752e0      	bres	21216,#3
 807                     ; 256 }
 810  008a 81            	ret	
 885                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 885                     ; 268 {
 886                     	switch	.text
 887  008b               _TIM4_SelectOutputTrigger:
 889  008b 88            	push	a
 890  008c 88            	push	a
 891       00000001      OFST:	set	1
 894                     ; 269   uint8_t tmpcr2 = 0;
 896                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 898                     ; 274   tmpcr2 = TIM4->CR2;
 900  008d c652e1        	ld	a,21217
 902                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 904  0090 a48f          	and	a,#143
 906                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 908  0092 1a02          	or	a,(OFST+1,sp)
 910                     ; 282   TIM4->CR2 = tmpcr2;
 912  0094 c752e1        	ld	21217,a
 913                     ; 283 }
 916  0097 85            	popw	x
 917  0098 81            	ret	
1008                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1008                     ; 298 {
1009                     	switch	.text
1010  0099               _TIM4_SelectSlaveMode:
1012  0099 88            	push	a
1013  009a 88            	push	a
1014       00000001      OFST:	set	1
1017                     ; 299   uint8_t tmpsmcr = 0;
1019                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1021                     ; 304   tmpsmcr = TIM4->SMCR;
1023  009b c652e2        	ld	a,21218
1025                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1027  009e a4f8          	and	a,#248
1029                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1031  00a0 1a02          	or	a,(OFST+1,sp)
1033                     ; 312   TIM4->SMCR = tmpsmcr;
1035  00a2 c752e2        	ld	21218,a
1036                     ; 313 }
1039  00a5 85            	popw	x
1040  00a6 81            	ret	
1076                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1076                     ; 322 {
1077                     	switch	.text
1078  00a7               _TIM4_SelectMasterSlaveMode:
1082                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1084                     ; 327   if (NewState != DISABLE)
1086  00a7 4d            	tnz	a
1087  00a8 2705          	jreq	L164
1088                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1090  00aa 721e52e2      	bset	21218,#7
1093  00ae 81            	ret	
1094  00af               L164:
1095                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1097  00af 721f52e2      	bres	21218,#7
1098                     ; 335 }
1101  00b3 81            	ret	
1169                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1169                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1169                     ; 365 {
1170                     	switch	.text
1171  00b4               _TIM4_PrescalerConfig:
1175                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1177                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1179                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1181  00b4 9e            	ld	a,xh
1182  00b5 c752e7        	ld	21223,a
1183                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1185  00b8 9f            	ld	a,xl
1186  00b9 4a            	dec	a
1187  00ba 2605          	jrne	L715
1188                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1190  00bc 721052e5      	bset	21221,#0
1193  00c0 81            	ret	
1194  00c1               L715:
1195                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1197  00c1 721152e5      	bres	21221,#0
1198                     ; 382 }
1201  00c5 81            	ret	
1237                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1237                     ; 391 {
1238                     	switch	.text
1239  00c6               _TIM4_ARRPreloadConfig:
1243                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1245                     ; 396   if (NewState != DISABLE)
1247  00c6 4d            	tnz	a
1248  00c7 2705          	jreq	L145
1249                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1251  00c9 721e52e0      	bset	21216,#7
1254  00cd 81            	ret	
1255  00ce               L145:
1256                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1258  00ce 721f52e0      	bres	21216,#7
1259                     ; 404 }
1262  00d2 81            	ret	
1319                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1319                     ; 415 {
1320                     	switch	.text
1321  00d3               _TIM4_GenerateEvent:
1325                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1327                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1329  00d3 ca52e5        	or	a,21221
1330  00d6 c752e5        	ld	21221,a
1331                     ; 421 }
1334  00d9 81            	ret	
1368                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1368                     ; 430 {
1369                     	switch	.text
1370  00da               _TIM4_SetCounter:
1374                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1376  00da c752e6        	ld	21222,a
1377                     ; 433 }
1380  00dd 81            	ret	
1414                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1414                     ; 442 {
1415                     	switch	.text
1416  00de               _TIM4_SetAutoreload:
1420                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1422  00de c752e8        	ld	21224,a
1423                     ; 446 }
1426  00e1 81            	ret	
1460                     ; 453 uint8_t TIM4_GetCounter(void)
1460                     ; 454 {
1461                     	switch	.text
1462  00e2               _TIM4_GetCounter:
1464       00000001      OFST:	set	1
1467                     ; 455   uint8_t tmpcntr = 0;
1469                     ; 456   tmpcntr = TIM4->CNTR;
1471  00e2 c652e6        	ld	a,21222
1473                     ; 458   return ((uint8_t)tmpcntr);
1477  00e5 81            	ret	
1501                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1501                     ; 483 {
1502                     	switch	.text
1503  00e6               _TIM4_GetPrescaler:
1507                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1509  00e6 c652e7        	ld	a,21223
1512  00e9 81            	ret	
1536                     ; 493 FunctionalState TIM4_GetStatus(void)
1536                     ; 494 {
1537                     	switch	.text
1538  00ea               _TIM4_GetStatus:
1542                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1544  00ea c652e0        	ld	a,21216
1545  00ed a401          	and	a,#1
1548  00ef 81            	ret	
1634                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1634                     ; 508 {
1635                     	switch	.text
1636  00f0               _TIM4_GetFlagStatus:
1638  00f0 88            	push	a
1639       00000001      OFST:	set	1
1642                     ; 509   __IO FlagStatus bitstatus = RESET;
1644  00f1 0f01          	clr	(OFST+0,sp)
1646                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1648                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1650  00f3 c452e4        	and	a,21220
1651  00f6 2702          	jreq	L727
1652                     ; 516     bitstatus = SET;
1654  00f8 a601          	ld	a,#1
1656  00fa               L727:
1657                     ; 520     bitstatus = RESET;
1659  00fa 6b01          	ld	(OFST+0,sp),a
1661                     ; 522   return ((FlagStatus)bitstatus);
1663  00fc 7b01          	ld	a,(OFST+0,sp)
1666  00fe 5b01          	addw	sp,#1
1667  0100 81            	ret	
1702                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1702                     ; 534 {
1703                     	switch	.text
1704  0101               _TIM4_ClearFlag:
1708                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1710                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1712  0101 43            	cpl	a
1713  0102 c752e4        	ld	21220,a
1714                     ; 539 }
1717  0105 81            	ret	
1781                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1781                     ; 551 {
1782                     	switch	.text
1783  0106               _TIM4_GetITStatus:
1785  0106 88            	push	a
1786  0107 5203          	subw	sp,#3
1787       00000003      OFST:	set	3
1790                     ; 552   __IO ITStatus bitstatus = RESET;
1792  0109 0f03          	clr	(OFST+0,sp)
1794                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1796  010b 0f01          	clr	(OFST-2,sp)
1800  010d 0f02          	clr	(OFST-1,sp)
1802                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1804                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1806  010f c452e4        	and	a,21220
1807  0112 6b01          	ld	(OFST-2,sp),a
1809                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1811  0114 c652e3        	ld	a,21219
1812  0117 1404          	and	a,(OFST+1,sp)
1813  0119 6b02          	ld	(OFST-1,sp),a
1815                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1817  011b 0d01          	tnz	(OFST-2,sp)
1818  011d 270a          	jreq	L3001
1820  011f 0d02          	tnz	(OFST-1,sp)
1821  0121 2706          	jreq	L3001
1822                     ; 565     bitstatus = (ITStatus)SET;
1824  0123 a601          	ld	a,#1
1825  0125 6b03          	ld	(OFST+0,sp),a
1828  0127 2002          	jra	L5001
1829  0129               L3001:
1830                     ; 569     bitstatus = (ITStatus)RESET;
1832  0129 0f03          	clr	(OFST+0,sp)
1834  012b               L5001:
1835                     ; 571   return ((ITStatus)bitstatus);
1837  012b 7b03          	ld	a,(OFST+0,sp)
1840  012d 5b04          	addw	sp,#4
1841  012f 81            	ret	
1877                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1877                     ; 583 {
1878                     	switch	.text
1879  0130               _TIM4_ClearITPendingBit:
1883                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1885                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1887  0130 43            	cpl	a
1888  0131 c752e4        	ld	21220,a
1889                     ; 589 }
1892  0134 81            	ret	
1905                     	xdef	_TIM4_ClearITPendingBit
1906                     	xdef	_TIM4_GetITStatus
1907                     	xdef	_TIM4_ClearFlag
1908                     	xdef	_TIM4_GetFlagStatus
1909                     	xdef	_TIM4_GetStatus
1910                     	xdef	_TIM4_GetPrescaler
1911                     	xdef	_TIM4_GetCounter
1912                     	xdef	_TIM4_SetAutoreload
1913                     	xdef	_TIM4_SetCounter
1914                     	xdef	_TIM4_GenerateEvent
1915                     	xdef	_TIM4_ARRPreloadConfig
1916                     	xdef	_TIM4_PrescalerConfig
1917                     	xdef	_TIM4_SelectMasterSlaveMode
1918                     	xdef	_TIM4_SelectSlaveMode
1919                     	xdef	_TIM4_SelectOutputTrigger
1920                     	xdef	_TIM4_SelectOnePulseMode
1921                     	xdef	_TIM4_UpdateRequestConfig
1922                     	xdef	_TIM4_UpdateDisableConfig
1923                     	xdef	_TIM4_SelectInputTrigger
1924                     	xdef	_TIM4_InternalClockConfig
1925                     	xdef	_TIM4_ITConfig
1926                     	xdef	_TIM4_Cmd
1927                     	xdef	_TIM4_TimeBaseInit
1928                     	xdef	_TIM4_DeInit
1947                     	end
