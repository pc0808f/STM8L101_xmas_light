   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 57 void COMP_DeInit(void)
  45                     ; 58 {
  47                     	switch	.text
  48  0000               _COMP_DeInit:
  52                     ; 59   COMP->CR   = COMP_CR_RESET_VALUE;
  54  0000 725f5300      	clr	21248
  55                     ; 60   COMP->CSR  = COMP_CSR_RESET_VALUE;
  57  0004 35505301      	mov	21249,#80
  58                     ; 61   COMP->CCS  = COMP_CCS_RESET_VALUE;
  60  0008 725f5302      	clr	21250
  61                     ; 62 }
  64  000c 81            	ret	
 198                     ; 85 void COMP_Init(COMP_Selection_TypeDef COMP_Selection,
 198                     ; 86                COMP_Reference_TypeDef COMP_Reference,
 198                     ; 87                COMP_Polarity_TypeDef COMP_Polarity)
 198                     ; 88 {
 199                     	switch	.text
 200  000d               _COMP_Init:
 202  000d 89            	pushw	x
 203       00000000      OFST:	set	0
 206                     ; 90   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 208                     ; 91   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 210                     ; 92   assert_param(IS_COMP_SELECTION(COMP_Selection));
 212                     ; 94   COMP->CR &= (uint8_t)(~((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection));
 214  000e 9f            	ld	a,xl
 215  000f 1a05          	or	a,(OFST+5,sp)
 216  0011 1a01          	or	a,(OFST+1,sp)
 217  0013 43            	cpl	a
 218  0014 c45300        	and	a,21248
 219  0017 c75300        	ld	21248,a
 220                     ; 96   COMP->CR |= (uint8_t)((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection);
 222  001a 7b05          	ld	a,(OFST+5,sp)
 223  001c 1a02          	or	a,(OFST+2,sp)
 224  001e 1a01          	or	a,(OFST+1,sp)
 225  0020 ca5300        	or	a,21248
 226  0023 c75300        	ld	21248,a
 227                     ; 98 }
 230  0026 85            	popw	x
 231  0027 81            	ret	
 286                     ; 106 void COMP_Cmd(FunctionalState NewState)
 286                     ; 107 {
 287                     	switch	.text
 288  0028               _COMP_Cmd:
 292                     ; 109   assert_param(IS_FUNCTIONAL_STATE(NewState));
 294                     ; 111   if (NewState != DISABLE)
 296  0028 4d            	tnz	a
 297  0029 2705          	jreq	L131
 298                     ; 114     COMP->CR |= COMP_CR_BIASEN;
 300  002b 72105300      	bset	21248,#0
 303  002f 81            	ret	
 304  0030               L131:
 305                     ; 118     COMP->CR &= (uint8_t)(~COMP_CR_BIASEN);
 307  0030 72115300      	bres	21248,#0
 308                     ; 120 }
 311  0034 81            	ret	
 357                     ; 134 void COMP_SelectionConfig(COMP_Selection_TypeDef COMP_Selection,
 357                     ; 135                           FunctionalState NewState)
 357                     ; 136 {
 358                     	switch	.text
 359  0035               _COMP_SelectionConfig:
 361  0035 89            	pushw	x
 362       00000000      OFST:	set	0
 365                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 367                     ; 139   assert_param(IS_COMP_SELECTION(COMP_Selection));
 369                     ; 141   if (NewState != DISABLE)
 371  0036 9f            	ld	a,xl
 372  0037 4d            	tnz	a
 373  0038 2706          	jreq	L751
 374                     ; 143     COMP->CR |= (uint8_t)COMP_Selection;
 376  003a 9e            	ld	a,xh
 377  003b ca5300        	or	a,21248
 379  003e 2006          	jra	L161
 380  0040               L751:
 381                     ; 147     COMP->CR &= (uint8_t)(~(uint8_t)COMP_Selection);
 383  0040 7b01          	ld	a,(OFST+1,sp)
 384  0042 43            	cpl	a
 385  0043 c45300        	and	a,21248
 386  0046               L161:
 387  0046 c75300        	ld	21248,a
 388                     ; 149 }
 391  0049 85            	popw	x
 392  004a 81            	ret	
 471                     ; 162 void COMP_ITConfig(COMP_IT_TypeDef COMP_IT,
 471                     ; 163                    FunctionalState NewState)
 471                     ; 164 {
 472                     	switch	.text
 473  004b               _COMP_ITConfig:
 475  004b 89            	pushw	x
 476       00000000      OFST:	set	0
 479                     ; 166   assert_param(IS_COMP_IT(COMP_IT));
 481                     ; 167   assert_param(IS_FUNCTIONAL_STATE(NewState));
 483                     ; 169   if (NewState != DISABLE)
 485  004c 9f            	ld	a,xl
 486  004d 4d            	tnz	a
 487  004e 2706          	jreq	L122
 488                     ; 172     COMP->CSR |= (uint8_t)COMP_IT;
 490  0050 9e            	ld	a,xh
 491  0051 ca5301        	or	a,21249
 493  0054 2006          	jra	L322
 494  0056               L122:
 495                     ; 177     COMP->CSR &= (uint8_t)(~(uint8_t)COMP_IT);
 497  0056 7b01          	ld	a,(OFST+1,sp)
 498  0058 43            	cpl	a
 499  0059 c45301        	and	a,21249
 500  005c               L322:
 501  005c c75301        	ld	21249,a
 502                     ; 179 }
 505  005f 85            	popw	x
 506  0060 81            	ret	
 562                     ; 189 void COMP_TIM2Config(COMP_TIM2Config_TypeDef COMP_TIM2Config)
 562                     ; 190 {
 563                     	switch	.text
 564  0061               _COMP_TIM2Config:
 568                     ; 192   assert_param(IS_COMP_TIM2CONFIG(COMP_TIM2Config));
 570                     ; 195   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_IC1BK);
 572  0061 721f5300      	bres	21248,#7
 573                     ; 198   COMP->CR |= (uint8_t)COMP_TIM2Config;
 575  0065 ca5300        	or	a,21248
 576  0068 c75300        	ld	21248,a
 577                     ; 199 }
 580  006b 81            	ret	
 695                     ; 216 void COMP_SwitchConfig(COMP_Switch_TypeDef COMP_Switch,
 695                     ; 217                        FunctionalState NewState)
 695                     ; 218 {
 696                     	switch	.text
 697  006c               _COMP_SwitchConfig:
 699  006c 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 220   assert_param(IS_COMP_SWITCH(COMP_Switch));
 705                     ; 221   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 223   if (NewState != DISABLE)
 709  006d 9f            	ld	a,xl
 710  006e 4d            	tnz	a
 711  006f 2706          	jreq	L123
 712                     ; 226     COMP->CCS |= (uint8_t)COMP_Switch;
 714  0071 9e            	ld	a,xh
 715  0072 ca5302        	or	a,21250
 717  0075 2006          	jra	L323
 718  0077               L123:
 719                     ; 231     COMP->CCS &= (uint8_t)(~(uint8_t)COMP_Switch);
 721  0077 7b01          	ld	a,(OFST+1,sp)
 722  0079 43            	cpl	a
 723  007a c45302        	and	a,21250
 724  007d               L323:
 725  007d c75302        	ld	21250,a
 726                     ; 233 }
 729  0080 85            	popw	x
 730  0081 81            	ret	
 806                     ; 245 void COMP_TIMConnect(COMP_TimersConnection_TypeDef COMP_TIMConnection)
 806                     ; 246 {
 807                     	switch	.text
 808  0082               _COMP_TIMConnect:
 810  0082 88            	push	a
 811       00000000      OFST:	set	0
 814                     ; 248   assert_param(IS_COMP_TIMCONNECTION(COMP_TIMConnection));
 816                     ; 251   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_CNFTIM);
 818  0083 c65300        	ld	a,21248
 819  0086 a49f          	and	a,#159
 820  0088 c75300        	ld	21248,a
 821                     ; 254   COMP->CR |= (uint8_t)COMP_TIMConnection;
 823  008b c65300        	ld	a,21248
 824  008e 1a01          	or	a,(OFST+1,sp)
 825  0090 c75300        	ld	21248,a
 826                     ; 255 }
 829  0093 84            	pop	a
 830  0094 81            	ret	
 866                     ; 265 void COMP_SelectPolarity(COMP_Polarity_TypeDef COMP_Polarity)
 866                     ; 266 {
 867                     	switch	.text
 868  0095               _COMP_SelectPolarity:
 872                     ; 268   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 874                     ; 271   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_POL);
 876  0095 72195300      	bres	21248,#4
 877                     ; 274   COMP->CR |= (uint8_t)COMP_Polarity;
 879  0099 ca5300        	or	a,21248
 880  009c c75300        	ld	21248,a
 881                     ; 275 }
 884  009f 81            	ret	
 919                     ; 285 void COMP_SetReference(COMP_Reference_TypeDef COMP_Reference)
 919                     ; 286 {
 920                     	switch	.text
 921  00a0               _COMP_SetReference:
 925                     ; 288   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 927                     ; 291   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_COMPREF);
 929  00a0 72175300      	bres	21248,#3
 930                     ; 294   COMP->CR |= (uint8_t)COMP_Reference;
 932  00a4 ca5300        	or	a,21248
 933  00a7 c75300        	ld	21248,a
 934                     ; 295 }
 937  00aa 81            	ret	
1024                     ; 305 FlagStatus COMP_GetOutputStatus(COMP_Output_TypeDef COMP_Output)
1024                     ; 306 {
1025                     	switch	.text
1026  00ab               _COMP_GetOutputStatus:
1028       00000001      OFST:	set	1
1031                     ; 307   FlagStatus status = RESET;
1033                     ; 310   assert_param(IS_COMP_OUTPUT(COMP_Output));
1035                     ; 312   if ((COMP->CSR & (uint8_t)COMP_Output) != 0)
1037  00ab c45301        	and	a,21249
1038  00ae 2702          	jreq	L554
1039                     ; 314     status = SET;
1041  00b0 a601          	ld	a,#1
1044  00b2               L554:
1045                     ; 318     status = RESET;
1048                     ; 320   return status;
1052  00b2 81            	ret	
1118                     ; 331 FlagStatus COMP_GetFlagStatus(COMP_FLAG_TypeDef COMP_Flag)
1118                     ; 332 {
1119                     	switch	.text
1120  00b3               _COMP_GetFlagStatus:
1122       00000001      OFST:	set	1
1125                     ; 333   FlagStatus status = RESET;
1127                     ; 336   assert_param(IS_COMP_FLAG(COMP_Flag));
1129                     ; 338   if ((COMP->CSR & (uint8_t)COMP_Flag) != 0)
1131  00b3 c45301        	and	a,21249
1132  00b6 2702          	jreq	L315
1133                     ; 340     status = SET;
1135  00b8 a601          	ld	a,#1
1138  00ba               L315:
1139                     ; 344     status = RESET;
1142                     ; 346   return status;
1146  00ba 81            	ret	
1181                     ; 357 void COMP_ClearFlag(COMP_FLAG_TypeDef COMP_Flag)
1181                     ; 358 {
1182                     	switch	.text
1183  00bb               _COMP_ClearFlag:
1187                     ; 360   assert_param(IS_COMP_FLAG(COMP_Flag));
1189                     ; 363   COMP->CSR |= (uint8_t)COMP_Flag;
1191  00bb ca5301        	or	a,21249
1192  00be c75301        	ld	21249,a
1193                     ; 364 }
1196  00c1 81            	ret	
1242                     ; 374 ITStatus COMP_GetITStatus(COMP_IT_TypeDef COMP_ITPendingBit)
1242                     ; 375 {
1243                     	switch	.text
1244  00c2               _COMP_GetITStatus:
1246       00000001      OFST:	set	1
1249                     ; 376   ITStatus status = RESET;
1251                     ; 379   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1253                     ; 381   if (COMP->CSR & (uint8_t)COMP_ITPendingBit)
1255  00c2 c45301        	and	a,21249
1256  00c5 2702          	jreq	L755
1257                     ; 383     status = SET;
1259  00c7 a601          	ld	a,#1
1262  00c9               L755:
1263                     ; 387     status = RESET;
1266                     ; 389   return status;
1270  00c9 81            	ret	
1306                     ; 400 void COMP_ClearITPendingBit(COMP_IT_TypeDef COMP_ITPendingBit)
1306                     ; 401 {
1307                     	switch	.text
1308  00ca               _COMP_ClearITPendingBit:
1312                     ; 403   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1314                     ; 406   COMP->CSR |= (uint8_t)COMP_ITPendingBit;
1316  00ca ca5301        	or	a,21249
1317  00cd c75301        	ld	21249,a
1318                     ; 407 }
1321  00d0 81            	ret	
1334                     	xdef	_COMP_ClearITPendingBit
1335                     	xdef	_COMP_GetITStatus
1336                     	xdef	_COMP_ClearFlag
1337                     	xdef	_COMP_GetFlagStatus
1338                     	xdef	_COMP_GetOutputStatus
1339                     	xdef	_COMP_SetReference
1340                     	xdef	_COMP_SelectPolarity
1341                     	xdef	_COMP_TIMConnect
1342                     	xdef	_COMP_SwitchConfig
1343                     	xdef	_COMP_TIM2Config
1344                     	xdef	_COMP_ITConfig
1345                     	xdef	_COMP_SelectionConfig
1346                     	xdef	_COMP_Cmd
1347                     	xdef	_COMP_Init
1348                     	xdef	_COMP_DeInit
1367                     	end
