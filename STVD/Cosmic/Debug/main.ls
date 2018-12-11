   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  17                     .const:	section	.text
  18  0000               _sample:
  19  0000 00            	dc.b	0
  20  0001 07            	dc.b	7
  21  0002 0d            	dc.b	13
  22  0003 14            	dc.b	20
  23  0004 1a            	dc.b	26
  24  0005 21            	dc.b	33
  25  0006 27            	dc.b	39
  26  0007 2d            	dc.b	45
  27  0008 33            	dc.b	51
  28  0009 39            	dc.b	57
  29  000a 3e            	dc.b	62
  30  000b 43            	dc.b	67
  31  000c 48            	dc.b	72
  32  000d 4c            	dc.b	76
  33  000e 50            	dc.b	80
  34  000f 54            	dc.b	84
  35  0010 57            	dc.b	87
  36  0011 5a            	dc.b	90
  37  0012 5c            	dc.b	92
  38  0013 5e            	dc.b	94
  39  0014 60            	dc.b	96
  40  0015 61            	dc.b	97
  41  0016 62            	dc.b	98
  42  0017 62            	dc.b	98
  43                     	bsct
  44  0000               _tim4Tick:
  45  0000 00000000      	dc.l	0
  46  0004               _RTCcounter:
  47  0004 00000000      	dc.l	0
  48  0008               _secTick:
  49  0008 0000          	dc.w	0
  50  000a               _counter:
  51  000a 0000          	dc.w	0
  52  000c               _COUNTER:
  53  000c 0640          	dc.w	1600
 138                     	switch	.const
 139  0018               L401:
 140  0018 0001517f      	dc.l	86399
 141                     ; 91 void main(void)
 141                     ; 92 {
 142                     	scross	off
 143                     	switch	.text
 144  0000               _main:
 146  0000 5206          	subw	sp,#6
 147       00000006      OFST:	set	6
 150                     ; 94   u8    LED1State=0;
 152                     ; 95 	u8    modeCount=0;
 154  0002 0f06          	clr	(OFST+0,sp)
 156                     ; 101   CLK_Config();
 158  0004 cd018c        	call	L5_CLK_Config
 160                     ; 104   AWU_Config();
 162  0007 cd019c        	call	L3_AWU_Config
 164                     ; 106   CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
 166  000a 4f            	clr	a
 167  000b cd0000        	call	_CLK_MasterPrescalerConfig
 169                     ; 108 	GPIO_Init(GPIOA,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
 171  000e 4bd0          	push	#208
 172  0010 4bff          	push	#255
 173  0012 ae5000        	ldw	x,#20480
 174  0015 cd0000        	call	_GPIO_Init
 176  0018 85            	popw	x
 177                     ; 109 	GPIO_Init(GPIOB,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
 179  0019 4bd0          	push	#208
 180  001b 4bff          	push	#255
 181  001d ae5005        	ldw	x,#20485
 182  0020 cd0000        	call	_GPIO_Init
 184  0023 85            	popw	x
 185                     ; 110 	GPIO_Init(GPIOC,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
 187  0024 4bd0          	push	#208
 188  0026 4bff          	push	#255
 189  0028 ae500a        	ldw	x,#20490
 190  002b cd0000        	call	_GPIO_Init
 192  002e 85            	popw	x
 193                     ; 111 	GPIO_Init(GPIOD,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
 195  002f 4bd0          	push	#208
 196  0031 4bff          	push	#255
 197  0033 ae500f        	ldw	x,#20495
 198  0036 cd0000        	call	_GPIO_Init
 200  0039 85            	popw	x
 201                     ; 115   GPIO_Init(GPIOC, GPIO_Pin_0 | GPIO_Pin_1 , GPIO_Mode_Out_PP_High_Slow);
 203  003a 4bd0          	push	#208
 204  003c 4b03          	push	#3
 205  003e ae500a        	ldw	x,#20490
 206  0041 cd0000        	call	_GPIO_Init
 208  0044 85            	popw	x
 209                     ; 117 	GPIO_Init(GPIOB, GPIO_Pin_0 ,GPIO_Mode_Out_PP_High_Slow);
 211  0045 4bd0          	push	#208
 212  0047 4b01          	push	#1
 213  0049 ae5005        	ldw	x,#20485
 214  004c cd0000        	call	_GPIO_Init
 216  004f 85            	popw	x
 217                     ; 120   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4,ENABLE);
 219  0050 ae0401        	ldw	x,#1025
 220  0053 cd0000        	call	_CLK_PeripheralClockConfig
 222                     ; 121   TIM4_DeInit();
 224  0056 cd0000        	call	_TIM4_DeInit
 226                     ; 122   TIM4_TimeBaseInit(TIM4_Prescaler_128,0x7C);
 228  0059 ae077c        	ldw	x,#1916
 229  005c cd0000        	call	_TIM4_TimeBaseInit
 231                     ; 123   TIM4_ClearFlag(TIM4_FLAG_Update);
 233  005f a601          	ld	a,#1
 234  0061 cd0000        	call	_TIM4_ClearFlag
 236                     ; 124   TIM4_ITConfig(TIM4_IT_Update,ENABLE);
 238  0064 ae0101        	ldw	x,#257
 239  0067 cd0000        	call	_TIM4_ITConfig
 241                     ; 125   TIM4_Cmd(ENABLE);
 243  006a a601          	ld	a,#1
 244  006c cd0000        	call	_TIM4_Cmd
 246                     ; 126   tim4Tick=0;
 248  006f 5f            	clrw	x
 249  0070 bf02          	ldw	_tim4Tick+2,x
 250  0072 bf00          	ldw	_tim4Tick,x
 251                     ; 129   LoadValueIntoOnOffStruct();  	
 253  0074 cd01ba        	call	_LoadValueIntoOnOffStruct
 255                     ; 132   enableInterrupts();
 258  0077 9a            	rim	
 260                     ; 134   delayCount=tim4Tick;
 263  0078 ae0000        	ldw	x,#_tim4Tick
 264  007b cd0000        	call	c_ltor
 266                     ; 142   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
 268  007e ae0101        	ldw	x,#257
 269  0081 cd0000        	call	_CLK_PeripheralClockConfig
 271                     ; 145   GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_Out_PP_High_Fast);
 273  0084 4bf0          	push	#240
 274  0086 4b01          	push	#1
 275  0088 ae5005        	ldw	x,#20485
 276  008b cd0000        	call	_GPIO_Init
 278  008e 85            	popw	x
 279                     ; 147   TIM2_DeInit();
 281  008f cd0000        	call	_TIM2_DeInit
 283                     ; 150   TIM2_TimeBaseInit(TIM2_Prescaler_4, TIM2_CounterMode_Up, INIT_TIM2_ARR);
 285  0092 ae0098        	ldw	x,#152
 286  0095 89            	pushw	x
 287  0096 ae0200        	ldw	x,#512
 288  0099 cd0000        	call	_TIM2_TimeBaseInit
 290  009c 85            	popw	x
 291                     ; 153   TIM2_OC1Init(TIM2_OCMode_PWM1, TIM2_OutputState_Enable,INIT_TIM2_CCR1, TIM2_OCPolarity_Low, TIM2_OCIdleState_Reset);
 293  009d 4b00          	push	#0
 294  009f 4b01          	push	#1
 295  00a1 ae0062        	ldw	x,#98
 296  00a4 89            	pushw	x
 297  00a5 ae6001        	ldw	x,#24577
 298  00a8 cd0000        	call	_TIM2_OC1Init
 300  00ab 5b04          	addw	sp,#4
 301                     ; 156   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 303  00ad ae0101        	ldw	x,#257
 304  00b0 cd0000        	call	_TIM2_ITConfig
 306                     ; 159   TIM2_ARRPreloadConfig(ENABLE);
 308  00b3 a601          	ld	a,#1
 309  00b5 cd0000        	call	_TIM2_ARRPreloadConfig
 311                     ; 162   TIM2_Cmd(ENABLE);
 313  00b8 a601          	ld	a,#1
 314  00ba cd0000        	call	_TIM2_Cmd
 316                     ; 165   TIM2_CtrlPWMOutputs(ENABLE);
 318  00bd a601          	ld	a,#1
 319  00bf cd0000        	call	_TIM2_CtrlPWMOutputs
 321                     ; 168 	RTCcounter=60*60*21.5 - 5;
 323  00c2 ae2e53        	ldw	x,#11859
 324  00c5 bf06          	ldw	_RTCcounter+2,x
 325  00c7 ae0001        	ldw	x,#1
 326  00ca bf04          	ldw	_RTCcounter,x
 327  00cc               L34:
 328                     ; 174 		if(( RTCcounter > 60*60*16.5 ) && (RTCcounter < 60*60*21.5 ))  // lighting
 330  00cc ae0004        	ldw	x,#_RTCcounter
 331  00cf cd0000        	call	c_ltor
 333  00d2 cd0000        	call	c_ultof
 335  00d5 ae001c        	ldw	x,#L55
 336  00d8 cd0000        	call	c_fcmp
 338  00db 2d4e          	jrsle	L74
 340  00dd ae0004        	ldw	x,#_RTCcounter
 341  00e0 cd0000        	call	c_ltor
 343  00e3 cd0000        	call	c_ultof
 345  00e6 ae0020        	ldw	x,#L56
 346  00e9 cd0000        	call	c_fcmp
 348  00ec 2e3d          	jrsge	L74
 349                     ; 176 			if(secTick>=1000)
 351  00ee be08          	ldw	x,_secTick
 352  00f0 a303e8        	cpw	x,#1000
 353  00f3 25d7          	jrult	L34
 354                     ; 178 				secTick=secTick-1000;
 356  00f5 be08          	ldw	x,_secTick
 357  00f7 1d03e8        	subw	x,#1000
 358  00fa bf08          	ldw	_secTick,x
 359                     ; 179 				RTCcounter=RTCcounter+1;
 361  00fc ae0004        	ldw	x,#_RTCcounter
 362  00ff a601          	ld	a,#1
 363  0101 cd0000        	call	c_lgadc
 365                     ; 180 				modeCount++;
 367  0104 0c06          	inc	(OFST+0,sp)
 369                     ; 181 				if(modeCount==60)
 371  0106 7b06          	ld	a,(OFST+0,sp)
 372  0108 a13c          	cp	a,#60
 373  010a 2602          	jrne	L37
 374                     ; 182 					modeCount=0;
 376  010c 0f06          	clr	(OFST+0,sp)
 378  010e               L37:
 379                     ; 183 				if(modeCount==0)
 381  010e 7b06          	ld	a,(OFST+0,sp)
 382  0110 2605          	jrne	L57
 383                     ; 185 					LoadValueIntoOnOffStruct();
 385  0112 cd01ba        	call	_LoadValueIntoOnOffStruct
 387  0115 7b06          	ld	a,(OFST+0,sp)
 388  0117               L57:
 389                     ; 187 				if(modeCount==20)
 391  0117 a114          	cp	a,#20
 392  0119 2605          	jrne	L77
 393                     ; 189 					LoadValueIntoSinStruct();
 395  011b cd01ef        	call	_LoadValueIntoSinStruct
 397  011e 7b06          	ld	a,(OFST+0,sp)
 398  0120               L77:
 399                     ; 191 				if(modeCount==40)
 401  0120 a128          	cp	a,#40
 402  0122 26a8          	jrne	L34
 403                     ; 193 					COUNTER=400;
 405  0124 ae0190        	ldw	x,#400
 406  0127 bf0c          	ldw	_COUNTER,x
 407  0129 20a1          	jra	L34
 408  012b               L74:
 409                     ; 244 			TIM2_CtrlPWMOutputs(DISABLE);
 411  012b 4f            	clr	a
 412  012c cd0000        	call	_TIM2_CtrlPWMOutputs
 414                     ; 245 			TIM2_Cmd(DISABLE);
 416  012f 4f            	clr	a
 417  0130 cd0000        	call	_TIM2_Cmd
 419                     ; 246 			GPIO_ResetBits   	( GPIOB,  GPIO_Pin_0  ) ;
 421  0133 4b01          	push	#1
 422  0135 ae5005        	ldw	x,#20485
 423  0138 cd0000        	call	_GPIO_ResetBits
 425  013b ae0064        	ldw	x,#100
 426  013e 84            	pop	a
 427                     ; 247 			Delay(100);
 429  013f cd02a9        	call	_Delay
 431                     ; 252 			halt();
 434  0142 8e            	halt	
 436                     ; 253 			RTCcounter=RTCcounter+30;
 439  0143 ae0004        	ldw	x,#_RTCcounter
 440  0146 a61e          	ld	a,#30
 441  0148 cd0000        	call	c_lgadc
 443                     ; 254 			if(secTick>=1000)
 445  014b be08          	ldw	x,_secTick
 446  014d a303e8        	cpw	x,#1000
 447  0150 250f          	jrult	L501
 448                     ; 256 				secTick=secTick-1000;
 450  0152 be08          	ldw	x,_secTick
 451  0154 1d03e8        	subw	x,#1000
 452  0157 bf08          	ldw	_secTick,x
 453                     ; 257 				RTCcounter=RTCcounter+1;
 455  0159 ae0004        	ldw	x,#_RTCcounter
 456  015c a601          	ld	a,#1
 457  015e cd0000        	call	c_lgadc
 459  0161               L501:
 460                     ; 259 			if(RTCcounter >= RTC_MAX)
 462  0161 ae0004        	ldw	x,#_RTCcounter
 463  0164 cd0000        	call	c_ltor
 465  0167 ae0018        	ldw	x,#L401
 466  016a cd0000        	call	c_lcmp
 468  016d 2510          	jrult	L701
 469                     ; 260 				RTCcounter=RTCcounter-RTC_MAX;			
 471  016f ae517f        	ldw	x,#20863
 472  0172 bf02          	ldw	c_lreg+2,x
 473  0174 ae0001        	ldw	x,#1
 474  0177 bf00          	ldw	c_lreg,x
 475  0179 ae0004        	ldw	x,#_RTCcounter
 476  017c cd0000        	call	c_lgsub
 478  017f               L701:
 479                     ; 262 			TIM2_Cmd(ENABLE);
 481  017f a601          	ld	a,#1
 482  0181 cd0000        	call	_TIM2_Cmd
 484                     ; 263 			TIM2_CtrlPWMOutputs(ENABLE);
 486  0184 a601          	ld	a,#1
 487  0186 cd0000        	call	_TIM2_CtrlPWMOutputs
 489  0189 cc00cc        	jra	L34
 514                     ; 298 static void CLK_Config(void)
 514                     ; 299 {
 515                     	switch	.text
 516  018c               L5_CLK_Config:
 520                     ; 302   CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
 522  018c 4f            	clr	a
 523  018d cd0000        	call	_CLK_MasterPrescalerConfig
 525                     ; 305   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
 527  0190 ae0101        	ldw	x,#257
 528  0193 cd0000        	call	_CLK_PeripheralClockConfig
 530                     ; 306   CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
 532  0196 ae4001        	ldw	x,#16385
 534                     ; 307 }
 537  0199 cc0000        	jp	_CLK_PeripheralClockConfig
 565                     ; 311 static void AWU_Config(void)
 565                     ; 312 {
 566                     	switch	.text
 567  019c               L3_AWU_Config:
 571                     ; 315   AWU_LSICalibrationConfig(LSIMeasurment());
 573  019c cd022d        	call	_LSIMeasurment
 575  019f be02          	ldw	x,c_lreg+2
 576  01a1 89            	pushw	x
 577  01a2 be00          	ldw	x,c_lreg
 578  01a4 89            	pushw	x
 579  01a5 cd0000        	call	_AWU_LSICalibrationConfig
 581  01a8 5b04          	addw	sp,#4
 582                     ; 318   AWU_Init(AWU_Timebase_30s);
 584  01aa a610          	ld	a,#16
 585  01ac cd0000        	call	_AWU_Init
 587                     ; 320 	AWU_Cmd(ENABLE);
 589  01af a601          	ld	a,#1
 590  01b1 cd0000        	call	_AWU_Cmd
 592                     ; 322 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
 594  01b4 ae0100        	ldw	x,#256
 596                     ; 323 }
 599  01b7 cc0000        	jp	_CLK_PeripheralClockConfig
 645                     ; 332 void LoadValueIntoOnOffStruct(void)
 645                     ; 333 {
 646                     	switch	.text
 647  01ba               _LoadValueIntoOnOffStruct:
 649  01ba 89            	pushw	x
 650       00000002      OFST:	set	2
 653                     ; 334   uint8_t  offset=0,diff=0;
 655  01bb 0f02          	clr	(OFST+0,sp)
 660  01bd 2008          	jra	L551
 661  01bf               L351:
 662                     ; 339       sin.Value[offset] = 98; 
 664  01bf 5f            	clrw	x
 665  01c0 97            	ld	xl,a
 666  01c1 a662          	ld	a,#98
 667  01c3 e700          	ld	(_sin,x),a
 668                     ; 340       offset++;                      
 670  01c5 0c02          	inc	(OFST+0,sp)
 672  01c7               L551:
 673                     ; 336   while(offset <= (nbr_of_samples_half/2))
 675  01c7 7b02          	ld	a,(OFST+0,sp)
 676  01c9 a118          	cp	a,#24
 677  01cb 25f2          	jrult	L351
 678                     ; 342   diff = (uint8_t)(offset - 1);
 680  01cd 4a            	dec	a
 681  01ce 6b01          	ld	(OFST-1,sp),a
 684  01d0 200a          	jra	L561
 685  01d2               L161:
 686                     ; 345       diff--;  
 688  01d2 0a01          	dec	(OFST-1,sp)
 690                     ; 347       sin.Value[offset] = 98;    
 692  01d4 5f            	clrw	x
 693  01d5 97            	ld	xl,a
 694  01d6 a662          	ld	a,#98
 695  01d8 e700          	ld	(_sin,x),a
 696                     ; 348       offset++;                         
 698  01da 0c02          	inc	(OFST+0,sp)
 700  01dc               L561:
 701                     ; 343   while(offset < nbr_of_samples_half)
 703  01dc 7b02          	ld	a,(OFST+0,sp)
 704  01de a12e          	cp	a,#46
 705  01e0 25f0          	jrult	L161
 706                     ; 351   sin.Index = 0;                      
 708  01e2 3f2e          	clr	_sin+46
 709                     ; 352   sin.Up = TRUE; 
 711  01e4 3501002f      	mov	_sin+47,#1
 712                     ; 354 	COUNTER=200;
 714  01e8 ae00c8        	ldw	x,#200
 715  01eb bf0c          	ldw	_COUNTER,x
 716                     ; 355 }
 719  01ed 85            	popw	x
 720  01ee 81            	ret	
 767                     ; 363 void LoadValueIntoSinStruct(void)
 767                     ; 364 {
 768                     	switch	.text
 769  01ef               _LoadValueIntoSinStruct:
 771  01ef 89            	pushw	x
 772       00000002      OFST:	set	2
 775                     ; 365   uint8_t  offset=0,diff=0;
 777  01f0 0f02          	clr	(OFST+0,sp)
 782  01f2 2009          	jra	L512
 783  01f4               L312:
 784                     ; 370       sin.Value[offset] = sample[offset]; 
 786  01f4 5f            	clrw	x
 787  01f5 97            	ld	xl,a
 788  01f6 d60000        	ld	a,(_sample,x)
 789  01f9 e700          	ld	(_sin,x),a
 790                     ; 371       offset++;                      
 792  01fb 0c02          	inc	(OFST+0,sp)
 794  01fd               L512:
 795                     ; 367   while(offset <= (nbr_of_samples_half/2))
 797  01fd 7b02          	ld	a,(OFST+0,sp)
 798  01ff a118          	cp	a,#24
 799  0201 25f1          	jrult	L312
 800                     ; 373   diff = (uint8_t)(offset - 1);
 802  0203 4a            	dec	a
 803  0204 6b01          	ld	(OFST-1,sp),a
 806  0206 2012          	jra	L522
 807  0208               L122:
 808                     ; 376       diff--;  
 810  0208 0a01          	dec	(OFST-1,sp)
 812                     ; 378       sin.Value[offset] = sample[diff];    
 814  020a 5f            	clrw	x
 815  020b 97            	ld	xl,a
 816  020c 7b01          	ld	a,(OFST-1,sp)
 817  020e 905f          	clrw	y
 818  0210 9097          	ld	yl,a
 819  0212 90d60000      	ld	a,(_sample,y)
 820  0216 e700          	ld	(_sin,x),a
 821                     ; 379       offset++;                         
 823  0218 0c02          	inc	(OFST+0,sp)
 825  021a               L522:
 826                     ; 374   while(offset < nbr_of_samples_half)
 828  021a 7b02          	ld	a,(OFST+0,sp)
 829  021c a12e          	cp	a,#46
 830  021e 25e8          	jrult	L122
 831                     ; 382   sin.Index = 0;                      
 833  0220 3f2e          	clr	_sin+46
 834                     ; 383   sin.Up = TRUE;    
 836  0222 3501002f      	mov	_sin+47,#1
 837                     ; 385 	COUNTER=1000;
 839  0226 ae03e8        	ldw	x,#1000
 840  0229 bf0c          	ldw	_COUNTER,x
 841                     ; 386 }
 844  022b 85            	popw	x
 845  022c 81            	ret	
 911                     ; 396 uint32_t LSIMeasurment(void)
 911                     ; 397 {
 912                     	switch	.text
 913  022d               _LSIMeasurment:
 915  022d 520c          	subw	sp,#12
 916       0000000c      OFST:	set	12
 919                     ; 399   uint32_t lsi_freq_hz = 0x0;
 921                     ; 400   uint32_t fmaster = 0x0;
 923                     ; 401   uint16_t ICValue1 = 0x0;
 925                     ; 402   uint16_t ICValue2 = 0x0;
 927                     ; 405   fmaster = CLK_GetClockFreq();
 929  022f cd0000        	call	_CLK_GetClockFreq
 931  0232 96            	ldw	x,sp
 932  0233 1c0009        	addw	x,#OFST-3
 933  0236 cd0000        	call	c_rtol
 936                     ; 408   AWU->CSR |= AWU_CSR_MSR;
 938  0239 721050f0      	bset	20720,#0
 939                     ; 411   TIM2_ICInit(  TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
 941  023d 4b00          	push	#0
 942  023f 4b0c          	push	#12
 943  0241 4b01          	push	#1
 944  0243 5f            	clrw	x
 945  0244 cd0000        	call	_TIM2_ICInit
 947  0247 5b03          	addw	sp,#3
 948                     ; 414   TIM2_Cmd(ENABLE);
 950  0249 a601          	ld	a,#1
 951  024b cd0000        	call	_TIM2_Cmd
 954  024e               L562:
 955                     ; 417   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1);
 957  024e 72035255fb    	btjf	21077,#1,L562
 958                     ; 419   ICValue1 = TIM2_GetCapture1();
 960  0253 cd0000        	call	_TIM2_GetCapture1
 962  0256 1f05          	ldw	(OFST-7,sp),x
 964                     ; 420   TIM2_ClearFlag(TIM2_FLAG_CC1);
 966  0258 ae0002        	ldw	x,#2
 967  025b cd0000        	call	_TIM2_ClearFlag
 970  025e               L372:
 971                     ; 423   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1);
 973  025e 72035255fb    	btjf	21077,#1,L372
 974                     ; 425   ICValue2 = TIM2_GetCapture1();
 976  0263 cd0000        	call	_TIM2_GetCapture1
 978  0266 1f07          	ldw	(OFST-5,sp),x
 980                     ; 426   TIM2_ClearFlag(TIM2_FLAG_CC1);
 982  0268 ae0002        	ldw	x,#2
 983  026b cd0000        	call	_TIM2_ClearFlag
 985                     ; 429   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 987  026e 7211525a      	bres	21082,#0
 988                     ; 431   TIM2_Cmd(DISABLE);
 990  0272 4f            	clr	a
 991  0273 cd0000        	call	_TIM2_Cmd
 993                     ; 434   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 995  0276 1e07          	ldw	x,(OFST-5,sp)
 996  0278 72f005        	subw	x,(OFST-7,sp)
 997  027b cd0000        	call	c_uitolx
 999  027e 96            	ldw	x,sp
1000  027f 5c            	incw	x
1001  0280 cd0000        	call	c_rtol
1004  0283 96            	ldw	x,sp
1005  0284 1c0009        	addw	x,#OFST-3
1006  0287 cd0000        	call	c_ltor
1008  028a a603          	ld	a,#3
1009  028c cd0000        	call	c_llsh
1011  028f 96            	ldw	x,sp
1012  0290 5c            	incw	x
1013  0291 cd0000        	call	c_ludv
1015  0294 96            	ldw	x,sp
1016  0295 1c0009        	addw	x,#OFST-3
1017  0298 cd0000        	call	c_rtol
1020                     ; 437   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
1022  029b 721150f0      	bres	20720,#0
1023                     ; 439   return (lsi_freq_hz);
1025  029f 96            	ldw	x,sp
1026  02a0 1c0009        	addw	x,#OFST-3
1027  02a3 cd0000        	call	c_ltor
1031  02a6 5b0c          	addw	sp,#12
1032  02a8 81            	ret	
1066                     ; 444 void Delay(uint16_t nCount)
1066                     ; 445 {
1067                     	switch	.text
1068  02a9               _Delay:
1070  02a9 89            	pushw	x
1071       00000000      OFST:	set	0
1074  02aa 2003          	jra	L713
1075  02ac               L513:
1076                     ; 449         nCount--;
1078  02ac 5a            	decw	x
1079  02ad 1f01          	ldw	(OFST+1,sp),x
1080  02af               L713:
1081                     ; 447     while (nCount != 0)
1083  02af 1e01          	ldw	x,(OFST+1,sp)
1084  02b1 26f9          	jrne	L513
1085                     ; 451 }
1088  02b3 85            	popw	x
1089  02b4 81            	ret	
1223                     	xdef	_main
1224                     	xdef	_Delay
1225                     	xdef	_LSIMeasurment
1226                     	xdef	_LoadValueIntoOnOffStruct
1227                     	xdef	_LoadValueIntoSinStruct
1228                     	xdef	_COUNTER
1229                     	xdef	_counter
1230                     	switch	.ubsct
1231  0000               _sin:
1232  0000 000000000000  	ds.b	48
1233                     	xdef	_sin
1234                     	xdef	_secTick
1235                     	xdef	_RTCcounter
1236                     	xdef	_tim4Tick
1237                     	xdef	_sample
1238                     	xref	_TIM4_ClearFlag
1239                     	xref	_TIM4_ITConfig
1240                     	xref	_TIM4_Cmd
1241                     	xref	_TIM4_TimeBaseInit
1242                     	xref	_TIM4_DeInit
1243                     	xref	_TIM2_ClearFlag
1244                     	xref	_TIM2_GetCapture1
1245                     	xref	_TIM2_ARRPreloadConfig
1246                     	xref	_TIM2_ITConfig
1247                     	xref	_TIM2_CtrlPWMOutputs
1248                     	xref	_TIM2_Cmd
1249                     	xref	_TIM2_ICInit
1250                     	xref	_TIM2_OC1Init
1251                     	xref	_TIM2_TimeBaseInit
1252                     	xref	_TIM2_DeInit
1253                     	xref	_GPIO_ResetBits
1254                     	xref	_GPIO_Init
1255                     	xref	_CLK_GetClockFreq
1256                     	xref	_CLK_MasterPrescalerConfig
1257                     	xref	_CLK_PeripheralClockConfig
1258                     	xref	_AWU_LSICalibrationConfig
1259                     	xref	_AWU_Cmd
1260                     	xref	_AWU_Init
1261                     	switch	.const
1262  001c               L55:
1263  001c 47680800      	dc.w	18280,2048
1264  0020               L56:
1265  0020 47972c00      	dc.w	18327,11264
1266                     	xref.b	c_lreg
1267                     	xref.b	c_x
1287                     	xref	c_ludv
1288                     	xref	c_uitolx
1289                     	xref	c_llsh
1290                     	xref	c_rtol
1291                     	xref	c_lgsub
1292                     	xref	c_lcmp
1293                     	xref	c_lgadc
1294                     	xref	c_fcmp
1295                     	xref	c_ultof
1296                     	xref	c_ltor
1297                     	end
