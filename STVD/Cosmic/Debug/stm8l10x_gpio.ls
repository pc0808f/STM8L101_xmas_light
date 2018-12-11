   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
 111                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 111                     ; 58 {
 113                     	switch	.text
 114  0000               _GPIO_DeInit:
 118                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0000 7f            	clr	(x)
 121                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0001 6f02          	clr	(2,x)
 124                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0003 6f03          	clr	(3,x)
 127                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 129  0005 6f04          	clr	(4,x)
 130                     ; 63 }
 133  0007 81            	ret	
 289                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 289                     ; 99                uint8_t GPIO_Pin,
 289                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 289                     ; 101 {
 290                     	switch	.text
 291  0008               _GPIO_Init:
 293  0008 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 299                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 301                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 303  0009 7b06          	ld	a,(OFST+6,sp)
 304  000b 2a16          	jrpl	L541
 305                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 307  000d a510          	bcp	a,#16
 308  000f 2705          	jreq	L741
 309                     ; 117       GPIOx->ODR |= GPIO_Pin;
 311  0011 f6            	ld	a,(x)
 312  0012 1a05          	or	a,(OFST+5,sp)
 314  0014 2004          	jra	L151
 315  0016               L741:
 316                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 318  0016 7b05          	ld	a,(OFST+5,sp)
 319  0018 43            	cpl	a
 320  0019 f4            	and	a,(x)
 321  001a               L151:
 322  001a f7            	ld	(x),a
 323                     ; 123     GPIOx->DDR |= GPIO_Pin;
 325  001b 1e01          	ldw	x,(OFST+1,sp)
 326  001d e602          	ld	a,(2,x)
 327  001f 1a05          	or	a,(OFST+5,sp)
 329  0021 2005          	jra	L351
 330  0023               L541:
 331                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 333  0023 7b05          	ld	a,(OFST+5,sp)
 334  0025 43            	cpl	a
 335  0026 e402          	and	a,(2,x)
 336  0028               L351:
 337  0028 e702          	ld	(2,x),a
 338                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 340  002a 7b06          	ld	a,(OFST+6,sp)
 341  002c a540          	bcp	a,#64
 342  002e 2706          	jreq	L551
 343                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 345  0030 e603          	ld	a,(3,x)
 346  0032 1a05          	or	a,(OFST+5,sp)
 348  0034 2005          	jra	L751
 349  0036               L551:
 350                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 352  0036 7b05          	ld	a,(OFST+5,sp)
 353  0038 43            	cpl	a
 354  0039 e403          	and	a,(3,x)
 355  003b               L751:
 356  003b e703          	ld	(3,x),a
 357                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 359  003d 7b06          	ld	a,(OFST+6,sp)
 360  003f a520          	bcp	a,#32
 361  0041 2706          	jreq	L161
 362                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 364  0043 e604          	ld	a,(4,x)
 365  0045 1a05          	or	a,(OFST+5,sp)
 367  0047 2005          	jra	L361
 368  0049               L161:
 369                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 371  0049 7b05          	ld	a,(OFST+5,sp)
 372  004b 43            	cpl	a
 373  004c e404          	and	a,(4,x)
 374  004e               L361:
 375  004e e704          	ld	(4,x),a
 376                     ; 154 }
 379  0050 85            	popw	x
 380  0051 81            	ret	
 426                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 426                     ; 164 {
 427                     	switch	.text
 428  0052               _GPIO_Write:
 430       fffffffe      OFST: set -2
 433                     ; 165   GPIOx->ODR = GPIO_PortVal;
 435  0052 7b03          	ld	a,(OFST+5,sp)
 436  0054 f7            	ld	(x),a
 437                     ; 166 }
 440  0055 81            	ret	
 600                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 600                     ; 186 {
 601                     	switch	.text
 602  0056               _GPIO_WriteBit:
 604       fffffffe      OFST: set -2
 607                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 609                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 611                     ; 191   if (GPIO_BitVal != RESET)
 613  0056 7b04          	ld	a,(OFST+6,sp)
 614  0058 2714          	jreq	L303
 615                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 617  005a 7b03          	ld	a,(OFST+5,sp)
 618  005c 905f          	clrw	y
 619  005e 9097          	ld	yl,a
 620  0060 a601          	ld	a,#1
 621  0062 905d          	tnzw	y
 622  0064 2705          	jreq	L41
 623  0066               L61:
 624  0066 48            	sll	a
 625  0067 905a          	decw	y
 626  0069 26fb          	jrne	L61
 627  006b               L41:
 628  006b fa            	or	a,(x)
 630  006c 2013          	jra	L503
 631  006e               L303:
 632                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 634  006e 7b03          	ld	a,(OFST+5,sp)
 635  0070 905f          	clrw	y
 636  0072 9097          	ld	yl,a
 637  0074 a601          	ld	a,#1
 638  0076 905d          	tnzw	y
 639  0078 2705          	jreq	L02
 640  007a               L22:
 641  007a 48            	sll	a
 642  007b 905a          	decw	y
 643  007d 26fb          	jrne	L22
 644  007f               L02:
 645  007f 43            	cpl	a
 646  0080 f4            	and	a,(x)
 647  0081               L503:
 648  0081 f7            	ld	(x),a
 649                     ; 200 }
 652  0082 81            	ret	
 698                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 698                     ; 219 {
 699                     	switch	.text
 700  0083               _GPIO_SetBits:
 702       fffffffe      OFST: set -2
 705                     ; 220   GPIOx->ODR |= GPIO_Pin;
 707  0083 f6            	ld	a,(x)
 708  0084 1a03          	or	a,(OFST+5,sp)
 709  0086 f7            	ld	(x),a
 710                     ; 221 }
 713  0087 81            	ret	
 759                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 759                     ; 240 {
 760                     	switch	.text
 761  0088               _GPIO_ResetBits:
 763       fffffffe      OFST: set -2
 766                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 768  0088 7b03          	ld	a,(OFST+5,sp)
 769  008a 43            	cpl	a
 770  008b f4            	and	a,(x)
 771  008c f7            	ld	(x),a
 772                     ; 242 }
 775  008d 81            	ret	
 821                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 821                     ; 252 {
 822                     	switch	.text
 823  008e               _GPIO_ToggleBits:
 825       fffffffe      OFST: set -2
 828                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 830  008e f6            	ld	a,(x)
 831  008f 1803          	xor	a,(OFST+5,sp)
 832  0091 f7            	ld	(x),a
 833                     ; 254 }
 836  0092 81            	ret	
 873                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 873                     ; 263 {
 874                     	switch	.text
 875  0093               _GPIO_ReadInputData:
 879                     ; 264   return ((uint8_t)GPIOx->IDR);
 881  0093 e601          	ld	a,(1,x)
 884  0095 81            	ret	
 922                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 922                     ; 274 {
 923                     	switch	.text
 924  0096               _GPIO_ReadOutputData:
 928                     ; 275   return ((uint8_t)GPIOx->ODR);
 930  0096 f6            	ld	a,(x)
 933  0097 81            	ret	
 982                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 982                     ; 295 {
 983                     	switch	.text
 984  0098               _GPIO_ReadInputDataBit:
 986       fffffffe      OFST: set -2
 989                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 991  0098 e601          	ld	a,(1,x)
 992  009a 1403          	and	a,(OFST+5,sp)
 995  009c 81            	ret	
1044                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1044                     ; 316 {
1045                     	switch	.text
1046  009d               _GPIO_ReadOutputDataBit:
1048       fffffffe      OFST: set -2
1051                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1053  009d f6            	ld	a,(x)
1054  009e 1403          	and	a,(OFST+5,sp)
1057  00a0 81            	ret	
1134                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1134                     ; 338 {
1135                     	switch	.text
1136  00a1               _GPIO_ExternalPullUpConfig:
1138       fffffffe      OFST: set -2
1141                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1143                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1145                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1147  00a1 7b04          	ld	a,(OFST+6,sp)
1148  00a3 2706          	jreq	L355
1149                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1151  00a5 e603          	ld	a,(3,x)
1152  00a7 1a03          	or	a,(OFST+5,sp)
1154  00a9 2005          	jra	L555
1155  00ab               L355:
1156                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1158  00ab 7b03          	ld	a,(OFST+5,sp)
1159  00ad 43            	cpl	a
1160  00ae e403          	and	a,(3,x)
1161  00b0               L555:
1162  00b0 e703          	ld	(3,x),a
1163                     ; 350 }
1166  00b2 81            	ret	
1179                     	xdef	_GPIO_ExternalPullUpConfig
1180                     	xdef	_GPIO_ReadOutputDataBit
1181                     	xdef	_GPIO_ReadInputDataBit
1182                     	xdef	_GPIO_ReadOutputData
1183                     	xdef	_GPIO_ReadInputData
1184                     	xdef	_GPIO_ToggleBits
1185                     	xdef	_GPIO_ResetBits
1186                     	xdef	_GPIO_SetBits
1187                     	xdef	_GPIO_WriteBit
1188                     	xdef	_GPIO_Write
1189                     	xdef	_GPIO_Init
1190                     	xdef	_GPIO_DeInit
1209                     	end
