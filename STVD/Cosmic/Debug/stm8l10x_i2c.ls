   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 122 void I2C_DeInit(void)
  45                     ; 123 {
  47                     	switch	.text
  48  0000               _I2C_DeInit:
  52                     ; 124   I2C->CR1 = I2C_CR1_RESET_VALUE;
  54  0000 725f5210      	clr	21008
  55                     ; 125   I2C->CR2 = I2C_CR2_RESET_VALUE;
  57  0004 725f5211      	clr	21009
  58                     ; 126   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  60  0008 725f5212      	clr	21010
  61                     ; 127   I2C->OARL = I2C_OARL_RESET_VALUE;
  63  000c 725f5213      	clr	21011
  64                     ; 128   I2C->OARH = I2C_OARH_RESET_VALUE;
  66  0010 725f5214      	clr	21012
  67                     ; 129   I2C->ITR = I2C_ITR_RESET_VALUE;
  69  0014 725f521a      	clr	21018
  70                     ; 130   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  72  0018 725f521b      	clr	21019
  73                     ; 131   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  75  001c 725f521c      	clr	21020
  76                     ; 132   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  78  0020 3502521d      	mov	21021,#2
  79                     ; 133 }
  82  0024 81            	ret	
 256                     .const:	section	.text
 257  0000               L21:
 258  0000 000f4240      	dc.l	1000000
 259  0004               L41:
 260  0004 000186a1      	dc.l	100001
 261  0008               L61:
 262  0008 00000004      	dc.l	4
 263                     ; 157 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 263                     ; 158               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 263                     ; 159               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 263                     ; 160 {
 264                     	switch	.text
 265  0025               _I2C_Init:
 267  0025 5210          	subw	sp,#16
 268       00000010      OFST:	set	16
 271                     ; 161   uint32_t result = 0x0004;
 273                     ; 162   uint16_t tmpval = 0;
 275                     ; 163   uint8_t tmpccrh = 0;
 277  0027 0f0b          	clr	(OFST-5,sp)
 279                     ; 164   uint8_t input_clock = 0;
 281                     ; 167   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 283                     ; 168   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 285                     ; 169   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 287                     ; 170   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 289                     ; 171   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 291                     ; 174   input_clock = (uint8_t)(CLK_GetClockFreq() / 1000000);
 293  0029 cd0000        	call	_CLK_GetClockFreq
 295  002c ae0000        	ldw	x,#L21
 296  002f cd0000        	call	c_ludv
 298  0032 b603          	ld	a,c_lreg+3
 299  0034 6b0c          	ld	(OFST-4,sp),a
 301                     ; 178   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 303  0036 c65212        	ld	a,21010
 304  0039 a4c0          	and	a,#192
 305  003b c75212        	ld	21010,a
 306                     ; 180   I2C->FREQR |= input_clock;
 308  003e c65212        	ld	a,21010
 309  0041 1a0c          	or	a,(OFST-4,sp)
 310  0043 c75212        	ld	21010,a
 311                     ; 184   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 313  0046 72115210      	bres	21008,#0
 314                     ; 187   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 316  004a c6521c        	ld	a,21020
 317  004d a430          	and	a,#48
 318  004f c7521c        	ld	21020,a
 319                     ; 188   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 321  0052 725f521b      	clr	21019
 322                     ; 191   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 324  0056 96            	ldw	x,sp
 325  0057 1c0013        	addw	x,#OFST+3
 326  005a cd0000        	call	c_ltor
 328  005d ae0004        	ldw	x,#L41
 329  0060 cd0000        	call	c_lcmp
 331  0063 2403cc011a    	jrult	L721
 332                     ; 194     tmpccrh = I2C_CCRH_FS;
 334  0068 a680          	ld	a,#128
 335  006a 6b0b          	ld	(OFST-5,sp),a
 337                     ; 196     if (I2C_DutyCycle == I2C_DutyCycle_2)
 339  006c 96            	ldw	x,sp
 340  006d 0d19          	tnz	(OFST+9,sp)
 341  006f 2640          	jrne	L131
 342                     ; 199       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 344  0071 1c0013        	addw	x,#OFST+3
 345  0074 cd0000        	call	c_ltor
 347  0077 a603          	ld	a,#3
 348  0079 cd0000        	call	c_smul
 350  007c 96            	ldw	x,sp
 351  007d 1c0005        	addw	x,#OFST-11
 352  0080 cd0000        	call	c_rtol
 355  0083 7b0c          	ld	a,(OFST-4,sp)
 356  0085 b703          	ld	c_lreg+3,a
 357  0087 3f02          	clr	c_lreg+2
 358  0089 3f01          	clr	c_lreg+1
 359  008b 3f00          	clr	c_lreg
 360  008d 96            	ldw	x,sp
 361  008e 5c            	incw	x
 362  008f cd0000        	call	c_rtol
 365  0092 ae4240        	ldw	x,#16960
 366  0095 bf02          	ldw	c_lreg+2,x
 367  0097 ae000f        	ldw	x,#15
 368  009a bf00          	ldw	c_lreg,x
 369  009c 96            	ldw	x,sp
 370  009d 5c            	incw	x
 371  009e cd0000        	call	c_lmul
 373  00a1 96            	ldw	x,sp
 374  00a2 1c0005        	addw	x,#OFST-11
 375  00a5 cd0000        	call	c_ludv
 377  00a8 96            	ldw	x,sp
 378  00a9 1c000d        	addw	x,#OFST-3
 379  00ac cd0000        	call	c_rtol
 383  00af 2044          	jra	L331
 384  00b1               L131:
 385                     ; 204       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 387  00b1 1c0013        	addw	x,#OFST+3
 388  00b4 cd0000        	call	c_ltor
 390  00b7 a619          	ld	a,#25
 391  00b9 cd0000        	call	c_smul
 393  00bc 96            	ldw	x,sp
 394  00bd 1c0005        	addw	x,#OFST-11
 395  00c0 cd0000        	call	c_rtol
 398  00c3 7b0c          	ld	a,(OFST-4,sp)
 399  00c5 b703          	ld	c_lreg+3,a
 400  00c7 3f02          	clr	c_lreg+2
 401  00c9 3f01          	clr	c_lreg+1
 402  00cb 3f00          	clr	c_lreg
 403  00cd 96            	ldw	x,sp
 404  00ce 5c            	incw	x
 405  00cf cd0000        	call	c_rtol
 408  00d2 ae4240        	ldw	x,#16960
 409  00d5 bf02          	ldw	c_lreg+2,x
 410  00d7 ae000f        	ldw	x,#15
 411  00da bf00          	ldw	c_lreg,x
 412  00dc 96            	ldw	x,sp
 413  00dd 5c            	incw	x
 414  00de cd0000        	call	c_lmul
 416  00e1 96            	ldw	x,sp
 417  00e2 1c0005        	addw	x,#OFST-11
 418  00e5 cd0000        	call	c_ludv
 420  00e8 96            	ldw	x,sp
 421  00e9 1c000d        	addw	x,#OFST-3
 422  00ec cd0000        	call	c_rtol
 425                     ; 206       tmpccrh |= I2C_CCRH_DUTY;
 427  00ef 7b0b          	ld	a,(OFST-5,sp)
 428  00f1 aa40          	or	a,#64
 429  00f3 6b0b          	ld	(OFST-5,sp),a
 431  00f5               L331:
 432                     ; 210     if (result < (uint16_t)0x0001)
 434  00f5 96            	ldw	x,sp
 435  00f6 1c000d        	addw	x,#OFST-3
 436  00f9 cd0000        	call	c_lzmp
 438  00fc 2608          	jrne	L531
 439                     ; 213       result = (uint16_t)0x0001;
 441  00fe ae0001        	ldw	x,#1
 442  0101 1f0f          	ldw	(OFST-1,sp),x
 443  0103 5f            	clrw	x
 444  0104 1f0d          	ldw	(OFST-3,sp),x
 446  0106               L531:
 447                     ; 219     tmpval = ((input_clock * 3) / 10) + 1;
 449  0106 ae0003        	ldw	x,#3
 450  0109 7b0c          	ld	a,(OFST-4,sp)
 451  010b cd0000        	call	c_bmulx
 453  010e a60a          	ld	a,#10
 454  0110 cd0000        	call	c_sdivx
 456  0113 5c            	incw	x
 457  0114 1f09          	ldw	(OFST-7,sp),x
 459                     ; 220     I2C->TRISER = (uint8_t)tmpval;
 461  0116 7b0a          	ld	a,(OFST-6,sp)
 463  0118 2064          	jra	L731
 464  011a               L721:
 465                     ; 226     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 467  011a 96            	ldw	x,sp
 468  011b 1c0013        	addw	x,#OFST+3
 469  011e cd0000        	call	c_ltor
 471  0121 3803          	sll	c_lreg+3
 472  0123 3902          	rlc	c_lreg+2
 473  0125 3901          	rlc	c_lreg+1
 474  0127 96            	ldw	x,sp
 475  0128 3900          	rlc	c_lreg
 476  012a 1c0005        	addw	x,#OFST-11
 477  012d cd0000        	call	c_rtol
 480  0130 7b0c          	ld	a,(OFST-4,sp)
 481  0132 b703          	ld	c_lreg+3,a
 482  0134 3f02          	clr	c_lreg+2
 483  0136 3f01          	clr	c_lreg+1
 484  0138 3f00          	clr	c_lreg
 485  013a 96            	ldw	x,sp
 486  013b 5c            	incw	x
 487  013c cd0000        	call	c_rtol
 490  013f ae4240        	ldw	x,#16960
 491  0142 bf02          	ldw	c_lreg+2,x
 492  0144 ae000f        	ldw	x,#15
 493  0147 bf00          	ldw	c_lreg,x
 494  0149 96            	ldw	x,sp
 495  014a 5c            	incw	x
 496  014b cd0000        	call	c_lmul
 498  014e 96            	ldw	x,sp
 499  014f 1c0005        	addw	x,#OFST-11
 500  0152 cd0000        	call	c_ludv
 502  0155 b602          	ld	a,c_lreg+2
 503  0157 97            	ld	xl,a
 504  0158 b603          	ld	a,c_lreg+3
 505  015a cd0000        	call	c_uitol
 507  015d 96            	ldw	x,sp
 508  015e 1c000d        	addw	x,#OFST-3
 509  0161 cd0000        	call	c_rtol
 512                     ; 229     if (result < (uint16_t)0x0004)
 514  0164 96            	ldw	x,sp
 515  0165 1c000d        	addw	x,#OFST-3
 516  0168 cd0000        	call	c_ltor
 518  016b ae0008        	ldw	x,#L61
 519  016e cd0000        	call	c_lcmp
 521  0171 2408          	jruge	L141
 522                     ; 232       result = (uint16_t)0x0004;
 524  0173 ae0004        	ldw	x,#4
 525  0176 1f0f          	ldw	(OFST-1,sp),x
 526  0178 5f            	clrw	x
 527  0179 1f0d          	ldw	(OFST-3,sp),x
 529  017b               L141:
 530                     ; 238      I2C->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 532  017b 7b0c          	ld	a,(OFST-4,sp)
 533  017d 4c            	inc	a
 534  017e               L731:
 535  017e c7521d        	ld	21021,a
 536                     ; 242   I2C->CCRL = (uint8_t)result;
 538  0181 7b10          	ld	a,(OFST+0,sp)
 539  0183 c7521b        	ld	21019,a
 540                     ; 243   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 542  0186 7b0b          	ld	a,(OFST-5,sp)
 543  0188 c7521c        	ld	21020,a
 544                     ; 246     I2C->CR1 |= I2C_CR1_PE;
 546  018b 72105210      	bset	21008,#0
 547                     ; 249   I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 549  018f 72155211      	bres	21009,#2
 550                     ; 252   I2C->CR2 |= (uint8_t)I2C_Ack;
 552  0193 c65211        	ld	a,21009
 553  0196 1a1a          	or	a,(OFST+10,sp)
 554  0198 c75211        	ld	21009,a
 555                     ; 255     I2C->OARL = (uint8_t)(OwnAddress);
 557  019b 7b18          	ld	a,(OFST+8,sp)
 558  019d c75213        	ld	21011,a
 559                     ; 256     I2C->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF) |
 559                     ; 257                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 561  01a0 1e17          	ldw	x,(OFST+7,sp)
 562  01a2 4f            	clr	a
 563  01a3 01            	rrwa	x,a
 564  01a4 48            	sll	a
 565  01a5 01            	rrwa	x,a
 566  01a6 49            	rlc	a
 567  01a7 a406          	and	a,#6
 568  01a9 6b08          	ld	(OFST-8,sp),a
 570  01ab 7b1b          	ld	a,(OFST+11,sp)
 571  01ad aa40          	or	a,#64
 572  01af 1a08          	or	a,(OFST-8,sp)
 573  01b1 c75214        	ld	21012,a
 574                     ; 258 }
 577  01b4 5b10          	addw	sp,#16
 578  01b6 81            	ret	
 633                     ; 266 void I2C_Cmd(FunctionalState NewState)
 633                     ; 267 {
 634                     	switch	.text
 635  01b7               _I2C_Cmd:
 639                     ; 269   assert_param(IS_FUNCTIONAL_STATE(NewState));
 641                     ; 271   if (NewState != DISABLE)
 643  01b7 4d            	tnz	a
 644  01b8 2705          	jreq	L171
 645                     ; 274     I2C->CR1 |= I2C_CR1_PE;
 647  01ba 72105210      	bset	21008,#0
 650  01be 81            	ret	
 651  01bf               L171:
 652                     ; 279     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 654  01bf 72115210      	bres	21008,#0
 655                     ; 281 }
 658  01c3 81            	ret	
 693                     ; 289 void I2C_GeneralCallCmd(FunctionalState NewState)
 693                     ; 290 {
 694                     	switch	.text
 695  01c4               _I2C_GeneralCallCmd:
 699                     ; 292   assert_param(IS_FUNCTIONAL_STATE(NewState));
 701                     ; 294   if (NewState != DISABLE)
 703  01c4 4d            	tnz	a
 704  01c5 2705          	jreq	L312
 705                     ; 297     I2C->CR1 |= I2C_CR1_ENGC;
 707  01c7 721c5210      	bset	21008,#6
 710  01cb 81            	ret	
 711  01cc               L312:
 712                     ; 302     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 714  01cc 721d5210      	bres	21008,#6
 715                     ; 304 }
 718  01d0 81            	ret	
 753                     ; 314 void I2C_GenerateSTART(FunctionalState NewState)
 753                     ; 315 {
 754                     	switch	.text
 755  01d1               _I2C_GenerateSTART:
 759                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 761                     ; 319   if (NewState != DISABLE)
 763  01d1 4d            	tnz	a
 764  01d2 2705          	jreq	L532
 765                     ; 322     I2C->CR2 |= I2C_CR2_START;
 767  01d4 72105211      	bset	21009,#0
 770  01d8 81            	ret	
 771  01d9               L532:
 772                     ; 327     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 774  01d9 72115211      	bres	21009,#0
 775                     ; 329 }
 778  01dd 81            	ret	
 813                     ; 337 void I2C_GenerateSTOP(FunctionalState NewState)
 813                     ; 338 {
 814                     	switch	.text
 815  01de               _I2C_GenerateSTOP:
 819                     ; 340   assert_param(IS_FUNCTIONAL_STATE(NewState));
 821                     ; 342   if (NewState != DISABLE)
 823  01de 4d            	tnz	a
 824  01df 2705          	jreq	L752
 825                     ; 345     I2C->CR2 |= I2C_CR2_STOP;
 827  01e1 72125211      	bset	21009,#1
 830  01e5 81            	ret	
 831  01e6               L752:
 832                     ; 350     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 834  01e6 72135211      	bres	21009,#1
 835                     ; 352 }
 838  01ea 81            	ret	
 874                     ; 362 void I2C_SoftwareResetCmd(FunctionalState NewState)
 874                     ; 363 {
 875                     	switch	.text
 876  01eb               _I2C_SoftwareResetCmd:
 880                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 882                     ; 367   if (NewState != DISABLE)
 884  01eb 4d            	tnz	a
 885  01ec 2705          	jreq	L103
 886                     ; 370     I2C->CR2 |= I2C_CR2_SWRST;
 888  01ee 721e5211      	bset	21009,#7
 891  01f2 81            	ret	
 892  01f3               L103:
 893                     ; 375     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 895  01f3 721f5211      	bres	21009,#7
 896                     ; 377 }
 899  01f7 81            	ret	
 935                     ; 385 void I2C_StretchClockCmd(FunctionalState NewState)
 935                     ; 386 {
 936                     	switch	.text
 937  01f8               _I2C_StretchClockCmd:
 941                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 943                     ; 390   if (NewState != DISABLE)
 945  01f8 4d            	tnz	a
 946  01f9 2705          	jreq	L323
 947                     ; 393     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 949  01fb 721f5210      	bres	21008,#7
 952  01ff 81            	ret	
 953  0200               L323:
 954                     ; 398     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 956  0200 721e5210      	bset	21008,#7
 957                     ; 400 }
 960  0204 81            	ret	
 996                     ; 408 void I2C_AcknowledgeConfig(FunctionalState NewState)
 996                     ; 409 {
 997                     	switch	.text
 998  0205               _I2C_AcknowledgeConfig:
1002                     ; 411   assert_param(IS_FUNCTIONAL_STATE(NewState));
1004                     ; 413   if (NewState != DISABLE)
1006  0205 4d            	tnz	a
1007  0206 2705          	jreq	L543
1008                     ; 416     I2C->CR2 |= I2C_CR2_ACK;
1010  0208 72145211      	bset	21009,#2
1013  020c 81            	ret	
1014  020d               L543:
1015                     ; 421     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1017  020d 72155211      	bres	21009,#2
1018                     ; 423 }
1021  0211 81            	ret	
1079                     ; 434 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1079                     ; 435 {
1080                     	switch	.text
1081  0212               _I2C_AckPositionConfig:
1085                     ; 437   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1087                     ; 440   I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1089  0212 72175211      	bres	21009,#3
1090                     ; 443   I2C->CR2 |= (uint8_t)I2C_AckPosition;
1092  0216 ca5211        	or	a,21009
1093  0219 c75211        	ld	21009,a
1094                     ; 444 }
1097  021c 81            	ret	
1133                     ; 454 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1133                     ; 455 {
1134                     	switch	.text
1135  021d               _I2C_FastModeDutyCycleConfig:
1139                     ; 457   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1141                     ; 459   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1143  021d a140          	cp	a,#64
1144  021f 2605          	jrne	L514
1145                     ; 462     I2C->CCRH |= I2C_CCRH_DUTY;
1147  0221 721c521c      	bset	21020,#6
1150  0225 81            	ret	
1151  0226               L514:
1152                     ; 467     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1154  0226 721d521c      	bres	21020,#6
1155                     ; 469 }
1158  022a 81            	ret	
1225                     ; 481 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1225                     ; 482 {
1226                     	switch	.text
1227  022b               _I2C_Send7bitAddress:
1229  022b 89            	pushw	x
1230       00000000      OFST:	set	0
1233                     ; 484   assert_param(IS_I2C_ADDRESS(Address));
1235                     ; 485   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1237                     ; 488   if (I2C_Direction != I2C_Direction_Transmitter)
1239  022c 9f            	ld	a,xl
1240  022d 4d            	tnz	a
1241  022e 2706          	jreq	L354
1242                     ; 491     Address |= OAR1_ADD0_Set;
1244  0230 7b01          	ld	a,(OFST+1,sp)
1245  0232 aa01          	or	a,#1
1247  0234 2004          	jra	L554
1248  0236               L354:
1249                     ; 496     Address &= OAR1_ADD0_Reset;
1251  0236 7b01          	ld	a,(OFST+1,sp)
1252  0238 a4fe          	and	a,#254
1253  023a               L554:
1254                     ; 499   I2C->DR = Address;
1256  023a c75216        	ld	21014,a
1257                     ; 500 }
1260  023d 85            	popw	x
1261  023e 81            	ret	
1295                     ; 523 void I2C_SendData(uint8_t Data)
1295                     ; 524 {
1296                     	switch	.text
1297  023f               _I2C_SendData:
1301                     ; 526   I2C->DR = Data;
1303  023f c75216        	ld	21014,a
1304                     ; 527 }
1307  0242 81            	ret	
1330                     ; 534 uint8_t I2C_ReceiveData(void)
1330                     ; 535 {
1331                     	switch	.text
1332  0243               _I2C_ReceiveData:
1336                     ; 537   return ((uint8_t)I2C->DR);
1338  0243 c65216        	ld	a,21014
1341  0246 81            	ret	
1497                     ; 648 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1497                     ; 649 {
1498                     	switch	.text
1499  0247               _I2C_ITConfig:
1501  0247 89            	pushw	x
1502       00000000      OFST:	set	0
1505                     ; 651   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1507                     ; 652   assert_param(IS_FUNCTIONAL_STATE(NewState));
1509                     ; 654   if (NewState != DISABLE)
1511  0248 7b05          	ld	a,(OFST+5,sp)
1512  024a 2706          	jreq	L175
1513                     ; 657     I2C->ITR |= (uint8_t)I2C_IT;
1515  024c 9f            	ld	a,xl
1516  024d ca521a        	or	a,21018
1518  0250 2006          	jra	L375
1519  0252               L175:
1520                     ; 662     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1522  0252 7b02          	ld	a,(OFST+2,sp)
1523  0254 43            	cpl	a
1524  0255 c4521a        	and	a,21018
1525  0258               L375:
1526  0258 c7521a        	ld	21018,a
1527                     ; 664 }
1530  025b 85            	popw	x
1531  025c 81            	ret	
1755                     ; 700 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1755                     ; 701 {
1756                     	switch	.text
1757  025d               _I2C_CheckEvent:
1759  025d 89            	pushw	x
1760  025e 5206          	subw	sp,#6
1761       00000006      OFST:	set	6
1764                     ; 702   uint16_t lastevent = 0;
1766                     ; 703   uint8_t flag1= 0;
1768                     ; 704   uint8_t flag2= 0;
1770                     ; 705   ErrorStatus status = ERROR;
1772                     ; 708   assert_param(IS_I2C_EVENT(I2C_Event));
1774                     ; 710   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1776  0260 a30004        	cpw	x,#4
1777  0263 260e          	jrne	L507
1778                     ; 713       lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1780  0265 c65218        	ld	a,21016
1781  0268 a404          	and	a,#4
1782  026a 5f            	clrw	x
1783  026b 02            	rlwa	x,a
1784  026c 1f04          	ldw	(OFST-2,sp),x
1785  026e 01            	rrwa	x,a
1788  026f 1e04          	ldw	x,(OFST-2,sp)
1789  0271 201c          	jra	L707
1790  0273               L507:
1791                     ; 718     flag1 = I2C->SR1;
1793  0273 c65217        	ld	a,21015
1794  0276 6b03          	ld	(OFST-3,sp),a
1796                     ; 719     flag2 = I2C->SR3;
1798  0278 c65219        	ld	a,21017
1799  027b 6b06          	ld	(OFST+0,sp),a
1801                     ; 720     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1803  027d 5f            	clrw	x
1804  027e 7b03          	ld	a,(OFST-3,sp)
1805  0280 97            	ld	xl,a
1806  0281 1f01          	ldw	(OFST-5,sp),x
1808  0283 5f            	clrw	x
1809  0284 7b06          	ld	a,(OFST+0,sp)
1810  0286 97            	ld	xl,a
1811  0287 7b02          	ld	a,(OFST-4,sp)
1812  0289 01            	rrwa	x,a
1813  028a 1a01          	or	a,(OFST-5,sp)
1814  028c 01            	rrwa	x,a
1815  028d 1f04          	ldw	(OFST-2,sp),x
1817  028f               L707:
1818                     ; 724   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1820  028f 01            	rrwa	x,a
1821  0290 1408          	and	a,(OFST+2,sp)
1822  0292 01            	rrwa	x,a
1823  0293 1407          	and	a,(OFST+1,sp)
1824  0295 01            	rrwa	x,a
1825  0296 1307          	cpw	x,(OFST+1,sp)
1826  0298 2604          	jrne	L117
1827                     ; 727     status = SUCCESS;
1829  029a a601          	ld	a,#1
1832  029c 2001          	jra	L317
1833  029e               L117:
1834                     ; 732     status = ERROR;
1836  029e 4f            	clr	a
1838  029f               L317:
1839                     ; 736   return status;
1843  029f 5b08          	addw	sp,#8
1844  02a1 81            	ret	
1897                     ; 754 I2C_Event_TypeDef I2C_GetLastEvent(void)
1897                     ; 755 {
1898                     	switch	.text
1899  02a2               _I2C_GetLastEvent:
1901  02a2 5206          	subw	sp,#6
1902       00000006      OFST:	set	6
1905                     ; 756   __IO uint16_t lastevent = 0;
1907  02a4 5f            	clrw	x
1908  02a5 1f05          	ldw	(OFST-1,sp),x
1910                     ; 757   uint16_t flag1 = 0;
1912                     ; 758   uint16_t flag2 = 0;
1914                     ; 760   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1916  02a7 7205521805    	btjf	21016,#2,L347
1917                     ; 762     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1919  02ac ae0004        	ldw	x,#4
1921  02af 2013          	jra	L547
1922  02b1               L347:
1923                     ; 767     flag1 = I2C->SR1;
1925  02b1 c65217        	ld	a,21015
1926  02b4 97            	ld	xl,a
1927  02b5 1f01          	ldw	(OFST-5,sp),x
1929                     ; 768     flag2 = I2C->SR3;
1931  02b7 c65219        	ld	a,21017
1932  02ba 5f            	clrw	x
1933  02bb 97            	ld	xl,a
1934  02bc 1f03          	ldw	(OFST-3,sp),x
1936                     ; 771     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1938  02be 7b02          	ld	a,(OFST-4,sp)
1939  02c0 01            	rrwa	x,a
1940  02c1 1a01          	or	a,(OFST-5,sp)
1941  02c3 01            	rrwa	x,a
1942  02c4               L547:
1943  02c4 1f05          	ldw	(OFST-1,sp),x
1945                     ; 774   return (I2C_Event_TypeDef)lastevent;
1947  02c6 1e05          	ldw	x,(OFST-1,sp)
1950  02c8 5b06          	addw	sp,#6
1951  02ca 81            	ret	
2153                     ; 805 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2153                     ; 806 {
2154                     	switch	.text
2155  02cb               _I2C_GetFlagStatus:
2157  02cb 89            	pushw	x
2158  02cc 89            	pushw	x
2159       00000002      OFST:	set	2
2162                     ; 807   uint8_t tempreg = 0;
2164  02cd 0f02          	clr	(OFST+0,sp)
2166                     ; 808   uint8_t regindex = 0;
2168                     ; 809   FlagStatus bitstatus = RESET;
2170                     ; 812   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2172                     ; 815   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
2174  02cf 9e            	ld	a,xh
2175  02d0 6b01          	ld	(OFST-1,sp),a
2177                     ; 818   switch (regindex)
2180                     ; 834     default:
2180                     ; 835       break;
2181  02d2 4a            	dec	a
2182  02d3 2708          	jreq	L747
2183  02d5 4a            	dec	a
2184  02d6 270a          	jreq	L157
2185  02d8 4a            	dec	a
2186  02d9 270c          	jreq	L357
2187  02db 200f          	jra	L7601
2188  02dd               L747:
2189                     ; 821     case 0x01:
2189                     ; 822       tempreg = (uint8_t)I2C->SR1;
2191  02dd c65217        	ld	a,21015
2192                     ; 823       break;
2194  02e0 2008          	jp	LC001
2195  02e2               L157:
2196                     ; 826     case 0x02:
2196                     ; 827       tempreg = (uint8_t)I2C->SR2;
2198  02e2 c65218        	ld	a,21016
2199                     ; 828       break;
2201  02e5 2003          	jp	LC001
2202  02e7               L357:
2203                     ; 831     case 0x03:
2203                     ; 832       tempreg = (uint8_t)I2C->SR3;
2205  02e7 c65219        	ld	a,21017
2206  02ea               LC001:
2207  02ea 6b02          	ld	(OFST+0,sp),a
2209                     ; 833       break;
2211                     ; 834     default:
2211                     ; 835       break;
2213  02ec               L7601:
2214                     ; 839   if ((tempreg & (uint8_t)I2C_FLAG) != 0)
2216  02ec 7b04          	ld	a,(OFST+2,sp)
2217  02ee 1502          	bcp	a,(OFST+0,sp)
2218  02f0 2704          	jreq	L1701
2219                     ; 842     bitstatus = SET;
2221  02f2 a601          	ld	a,#1
2224  02f4 2001          	jra	L3701
2225  02f6               L1701:
2226                     ; 847     bitstatus = RESET;
2228  02f6 4f            	clr	a
2230  02f7               L3701:
2231                     ; 850   return bitstatus;
2235  02f7 5b04          	addw	sp,#4
2236  02f9 81            	ret	
2280                     ; 879 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2280                     ; 880 {
2281                     	switch	.text
2282  02fa               _I2C_ClearFlag:
2284  02fa 89            	pushw	x
2285       00000002      OFST:	set	2
2288                     ; 881   uint16_t flagpos = 0;
2290                     ; 883   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2292                     ; 886   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2294  02fb 01            	rrwa	x,a
2295  02fc 5f            	clrw	x
2296  02fd 02            	rlwa	x,a
2297  02fe 1f01          	ldw	(OFST-1,sp),x
2299                     ; 888   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2301  0300 7b02          	ld	a,(OFST+0,sp)
2302  0302 43            	cpl	a
2303  0303 c75218        	ld	21016,a
2304                     ; 889 }
2307  0306 85            	popw	x
2308  0307 81            	ret	
2372                     ; 910 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2372                     ; 911 {
2373                     	switch	.text
2374  0308               _I2C_GetITStatus:
2376  0308 89            	pushw	x
2377  0309 5204          	subw	sp,#4
2378       00000004      OFST:	set	4
2381                     ; 912   ITStatus bitstatus = RESET;
2383                     ; 913   __IO uint8_t enablestatus = 0;
2385  030b 0f03          	clr	(OFST-1,sp)
2387                     ; 914   uint16_t tempregister = 0;
2389                     ; 917   assert_param(IS_I2C_GET_IT(I2C_IT));
2391                     ; 919   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
2393  030d 9e            	ld	a,xh
2394  030e a407          	and	a,#7
2395  0310 5f            	clrw	x
2396  0311 97            	ld	xl,a
2397  0312 1f01          	ldw	(OFST-3,sp),x
2399                     ; 922   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2401  0314 c6521a        	ld	a,21018
2402  0317 1402          	and	a,(OFST-2,sp)
2403  0319 6b03          	ld	(OFST-1,sp),a
2405                     ; 924   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
2407  031b 7b05          	ld	a,(OFST+1,sp)
2408  031d a430          	and	a,#48
2409  031f 97            	ld	xl,a
2410  0320 4f            	clr	a
2411  0321 02            	rlwa	x,a
2412  0322 a30100        	cpw	x,#256
2413  0325 260d          	jrne	L1511
2414                     ; 927     if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2416  0327 c65217        	ld	a,21015
2417  032a 1506          	bcp	a,(OFST+2,sp)
2418  032c 2715          	jreq	L1611
2420  032e 0d03          	tnz	(OFST-1,sp)
2421  0330 2711          	jreq	L1611
2422                     ; 930       bitstatus = SET;
2424  0332 200b          	jp	LC003
2425                     ; 935       bitstatus = RESET;
2426  0334               L1511:
2427                     ; 941     if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2429  0334 c65218        	ld	a,21016
2430  0337 1506          	bcp	a,(OFST+2,sp)
2431  0339 2708          	jreq	L1611
2433  033b 0d03          	tnz	(OFST-1,sp)
2434  033d 2704          	jreq	L1611
2435                     ; 944       bitstatus = SET;
2437  033f               LC003:
2439  033f a601          	ld	a,#1
2442  0341 2001          	jra	L7511
2443  0343               L1611:
2444                     ; 949       bitstatus = RESET;
2447  0343 4f            	clr	a
2449  0344               L7511:
2450                     ; 953   return  bitstatus;
2454  0344 5b06          	addw	sp,#6
2455  0346 81            	ret	
2500                     ; 982 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2500                     ; 983 {
2501                     	switch	.text
2502  0347               _I2C_ClearITPendingBit:
2504  0347 89            	pushw	x
2505       00000002      OFST:	set	2
2508                     ; 984   uint16_t flagpos = 0;
2510                     ; 987   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2512                     ; 990   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
2514  0348 01            	rrwa	x,a
2515  0349 5f            	clrw	x
2516  034a 02            	rlwa	x,a
2517  034b 1f01          	ldw	(OFST-1,sp),x
2519                     ; 993   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2521  034d 7b02          	ld	a,(OFST+0,sp)
2522  034f 43            	cpl	a
2523  0350 c75218        	ld	21016,a
2524                     ; 994 }
2527  0353 85            	popw	x
2528  0354 81            	ret	
2541                     	xdef	_I2C_ClearITPendingBit
2542                     	xdef	_I2C_GetITStatus
2543                     	xdef	_I2C_ClearFlag
2544                     	xdef	_I2C_GetFlagStatus
2545                     	xdef	_I2C_GetLastEvent
2546                     	xdef	_I2C_CheckEvent
2547                     	xdef	_I2C_ITConfig
2548                     	xdef	_I2C_ReceiveData
2549                     	xdef	_I2C_SendData
2550                     	xdef	_I2C_Send7bitAddress
2551                     	xdef	_I2C_FastModeDutyCycleConfig
2552                     	xdef	_I2C_AckPositionConfig
2553                     	xdef	_I2C_AcknowledgeConfig
2554                     	xdef	_I2C_GenerateSTOP
2555                     	xdef	_I2C_GenerateSTART
2556                     	xdef	_I2C_StretchClockCmd
2557                     	xdef	_I2C_SoftwareResetCmd
2558                     	xdef	_I2C_GeneralCallCmd
2559                     	xdef	_I2C_Cmd
2560                     	xdef	_I2C_Init
2561                     	xdef	_I2C_DeInit
2562                     	xref	_CLK_GetClockFreq
2563                     	xref.b	c_lreg
2564                     	xref.b	c_x
2583                     	xref	c_uitol
2584                     	xref	c_sdivx
2585                     	xref	c_bmulx
2586                     	xref	c_lzmp
2587                     	xref	c_smul
2588                     	xref	c_lmul
2589                     	xref	c_rtol
2590                     	xref	c_lcmp
2591                     	xref	c_ltor
2592                     	xref	c_ludv
2593                     	end
