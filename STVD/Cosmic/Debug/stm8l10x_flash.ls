   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  80                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  80                     ; 158 {
  82                     	switch	.text
  83  0000               _FLASH_SetProgrammingTime:
  87                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  89                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  91  0000 72115050      	bres	20560,#0
  92                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  94  0004 ca5050        	or	a,20560
  95  0007 c75050        	ld	20560,a
  96                     ; 164 }
  99  000a 81            	ret	
 124                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 124                     ; 172 {
 125                     	switch	.text
 126  000b               _FLASH_GetProgrammingTime:
 130                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 132  000b c65050        	ld	a,20560
 133  000e a401          	and	a,#1
 136  0010 81            	ret	
 159                     ; 215 void FLASH_DeInit(void)
 159                     ; 216 {
 160                     	switch	.text
 161  0011               _FLASH_DeInit:
 165                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 167  0011 725f5050      	clr	20560
 168                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 170  0015 725f5051      	clr	20561
 171                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 173  0019 35405054      	mov	20564,#64
 174                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 176  001d c65054        	ld	a,20564
 177                     ; 221 }
 180  0020 81            	ret	
 236                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 236                     ; 232 {
 237                     	switch	.text
 238  0021               _FLASH_Unlock:
 240       00000000      OFST:	set	0
 243                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 245                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 247  0021 a1fd          	cp	a,#253
 248  0023 2608          	jrne	L501
 249                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 251  0025 35565052      	mov	20562,#86
 252                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 254  0029 35ae5052      	mov	20562,#174
 255  002d               L501:
 256                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 258  002d a1f7          	cp	a,#247
 259  002f 2608          	jrne	L701
 260                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 262  0031 35ae5053      	mov	20563,#174
 263                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 265  0035 35565053      	mov	20563,#86
 266  0039               L701:
 267                     ; 248 }
 270  0039 81            	ret	
 305                     ; 258 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 259 {
 306                     	switch	.text
 307  003a               _FLASH_Lock:
 311                     ; 261   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 313                     ; 263   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 315  003a c45054        	and	a,20564
 316  003d c75054        	ld	20564,a
 317                     ; 264 }
 320  0040 81            	ret	
 363                     ; 272 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 363                     ; 273 {
 364                     	switch	.text
 365  0041               _FLASH_ProgramByte:
 367       fffffffe      OFST: set -2
 370                     ; 275   assert_param(IS_FLASH_ADDRESS(Address));
 372                     ; 277   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 374  0041 7b03          	ld	a,(OFST+5,sp)
 375  0043 f7            	ld	(x),a
 376                     ; 278 }
 379  0044 81            	ret	
 413                     ; 285 void FLASH_EraseByte(uint16_t Address)
 413                     ; 286 {
 414                     	switch	.text
 415  0045               _FLASH_EraseByte:
 419                     ; 288   assert_param(IS_FLASH_ADDRESS(Address));
 421                     ; 290   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 423  0045 7f            	clr	(x)
 424                     ; 291 }
 428  0046 81            	ret	
 471                     ; 299 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 471                     ; 300 {
 472                     	switch	.text
 473  0047               _FLASH_ProgramWord:
 475       fffffffe      OFST: set -2
 478                     ; 302   assert_param(IS_FLASH_ADDRESS(Address));
 480                     ; 305   FLASH->CR2 |= FLASH_CR2_WPRG;
 482  0047 721c5051      	bset	20561,#6
 483                     ; 308   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 485  004b 7b03          	ld	a,(OFST+5,sp)
 486  004d f7            	ld	(x),a
 487                     ; 310   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 489  004e 7b04          	ld	a,(OFST+6,sp)
 490  0050 e701          	ld	(1,x),a
 491                     ; 312   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 493  0052 7b05          	ld	a,(OFST+7,sp)
 494  0054 e702          	ld	(2,x),a
 495                     ; 314   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 497  0056 7b06          	ld	a,(OFST+8,sp)
 498  0058 e703          	ld	(3,x),a
 499                     ; 315 }
 502  005a 81            	ret	
 536                     ; 322 uint8_t FLASH_ReadByte(uint16_t Address)
 536                     ; 323 {
 537                     	switch	.text
 538  005b               _FLASH_ReadByte:
 542                     ; 325   assert_param(IS_FLASH_ADDRESS(Address));
 544                     ; 328   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 546  005b f6            	ld	a,(x)
 549  005c 81            	ret	
 606                     ; 358 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 606                     ; 359 {
 607                     	switch	.text
 608  005d               _FLASH_GetReadOutProtectionStatus:
 610       00000001      OFST:	set	1
 613                     ; 360   FunctionalState state = DISABLE;
 615                     ; 362   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 617  005d c64800        	ld	a,18432
 618  0060 a1aa          	cp	a,#170
 619  0062 2603          	jrne	L552
 620                     ; 365     state = ENABLE;
 622  0064 a601          	ld	a,#1
 626  0066 81            	ret	
 627  0067               L552:
 628                     ; 370     state = DISABLE;
 630  0067 4f            	clr	a
 632                     ; 373     return state;
 636  0068 81            	ret	
 670                     ; 381 uint16_t FLASH_GetBootSize(void)
 670                     ; 382 {
 671                     	switch	.text
 672  0069               _FLASH_GetBootSize:
 674       00000002      OFST:	set	2
 677                     ; 383   uint16_t temp = 0;
 679                     ; 386   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 681  0069 c64802        	ld	a,18434
 682  006c 97            	ld	xl,a
 683  006d a640          	ld	a,#64
 684  006f 42            	mul	x,a
 686                     ; 389   if (OPT->OPT2_BOOTSIZE > 0x7F)
 688  0070 c64802        	ld	a,18434
 689  0073 a180          	cp	a,#128
 690  0075 2503          	jrult	L772
 691                     ; 391     temp = 8192;
 693  0077 ae2000        	ldw	x,#8192
 695  007a               L772:
 696                     ; 395   return(temp);
 700  007a 81            	ret	
 734                     ; 403 uint16_t FLASH_GetDataSize(void)
 734                     ; 404 {
 735                     	switch	.text
 736  007b               _FLASH_GetDataSize:
 738       00000002      OFST:	set	2
 741                     ; 405   uint16_t temp = 0;
 743                     ; 408   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 745  007b c64803        	ld	a,18435
 746  007e 5f            	clrw	x
 747  007f 97            	ld	xl,a
 748  0080 58            	sllw	x
 749  0081 58            	sllw	x
 750  0082 58            	sllw	x
 751  0083 58            	sllw	x
 752  0084 58            	sllw	x
 753  0085 58            	sllw	x
 755                     ; 411   if (OPT->OPT3_DATASIZE > 0x20)
 757  0086 c64803        	ld	a,18435
 758  0089 a121          	cp	a,#33
 759  008b 2503          	jrult	L713
 760                     ; 413     temp = 2048;
 762  008d ae0800        	ldw	x,#2048
 764  0090               L713:
 765                     ; 417   return(temp);
 769  0090 81            	ret	
 804                     ; 441 void FLASH_ITConfig(FunctionalState NewState)
 804                     ; 442 {
 805                     	switch	.text
 806  0091               _FLASH_ITConfig:
 810                     ; 444   assert_param(IS_FUNCTIONAL_STATE(NewState));
 812                     ; 446   if (NewState != DISABLE)
 814  0091 4d            	tnz	a
 815  0092 2705          	jreq	L733
 816                     ; 448     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 818  0094 72125050      	bset	20560,#1
 821  0098 81            	ret	
 822  0099               L733:
 823                     ; 452     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 825  0099 72135050      	bres	20560,#1
 826                     ; 454 }
 829  009d 81            	ret	
 931                     ; 467 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 931                     ; 468 {
 932                     	switch	.text
 933  009e               _FLASH_GetFlagStatus:
 935       00000001      OFST:	set	1
 938                     ; 469   FlagStatus status = RESET;
 940                     ; 471   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 942                     ; 474   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 944  009e c45054        	and	a,20564
 945  00a1 2702          	jreq	L114
 946                     ; 476     status = SET; /* FLASH_FLAG is set*/
 948  00a3 a601          	ld	a,#1
 951  00a5               L114:
 952                     ; 480     status = RESET; /* FLASH_FLAG is reset*/
 955                     ; 484   return status;
 959  00a5 81            	ret	
1053                     ; 602 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1053                     ; 603 {
1054                     	switch	.text
1055  00a6               _FLASH_ProgramBlock:
1057  00a6 89            	pushw	x
1058  00a7 5204          	subw	sp,#4
1059       00000004      OFST:	set	4
1062                     ; 604   uint16_t Count = 0;
1064                     ; 605   uint16_t StartAddress = 0;
1066                     ; 608   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1068                     ; 609   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1070                     ; 612   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1072  00a9 9f            	ld	a,xl
1073  00aa 4d            	tnz	a
1074  00ab 2606          	jrne	L364
1075                     ; 615     FLASH->CR2 |= FLASH_CR2_PRG;
1077  00ad 72105051      	bset	20561,#0
1079  00b1 2004          	jra	L564
1080  00b3               L364:
1081                     ; 620     FLASH->CR2 |= FLASH_CR2_FPRG;
1083  00b3 72185051      	bset	20561,#4
1084  00b7               L564:
1085                     ; 622   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1087                     ; 624   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1089  00b7 7b05          	ld	a,(OFST+1,sp)
1090  00b9 5f            	clrw	x
1091  00ba 97            	ld	xl,a
1092  00bb 58            	sllw	x
1093  00bc 58            	sllw	x
1094  00bd 58            	sllw	x
1095  00be 58            	sllw	x
1096  00bf 58            	sllw	x
1097  00c0 58            	sllw	x
1098  00c1 1c8000        	addw	x,#32768
1099  00c4 1f01          	ldw	(OFST-3,sp),x
1101                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1103  00c6 5f            	clrw	x
1104  00c7 1f03          	ldw	(OFST-1,sp),x
1106  00c9               L764:
1107                     ; 629     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1109  00c9 1e09          	ldw	x,(OFST+5,sp)
1110  00cb 72fb03        	addw	x,(OFST-1,sp)
1111  00ce f6            	ld	a,(x)
1112  00cf 1e01          	ldw	x,(OFST-3,sp)
1113  00d1 72fb03        	addw	x,(OFST-1,sp)
1114  00d4 f7            	ld	(x),a
1115                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1117  00d5 1e03          	ldw	x,(OFST-1,sp)
1118  00d7 5c            	incw	x
1119  00d8 1f03          	ldw	(OFST-1,sp),x
1123  00da a30040        	cpw	x,#64
1124  00dd 25ea          	jrult	L764
1125                     ; 631 }
1128  00df 5b06          	addw	sp,#6
1129  00e1 81            	ret	
1182                     ; 643 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1182                     ; 644 {
1183                     	switch	.text
1184  00e2               _FLASH_EraseBlock:
1186       00000004      OFST:	set	4
1189                     ; 646   uint16_t StartAddress = 0;
1191                     ; 648   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1193                     ; 650   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1195                     ; 652   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1197  00e2 5f            	clrw	x
1198  00e3 97            	ld	xl,a
1199  00e4 58            	sllw	x
1200  00e5 58            	sllw	x
1201  00e6 58            	sllw	x
1202  00e7 58            	sllw	x
1203  00e8 58            	sllw	x
1204  00e9 58            	sllw	x
1205  00ea 1c8000        	addw	x,#32768
1207                     ; 655   FLASH->CR2 |= FLASH_CR2_ERASE;
1209  00ed 721a5051      	bset	20561,#5
1210                     ; 657   *pwFlash = (uint32_t)0;
1212  00f1 4f            	clr	a
1213  00f2 e703          	ld	(3,x),a
1214  00f4 e702          	ld	(2,x),a
1215  00f6 e701          	ld	(1,x),a
1216  00f8 f7            	ld	(x),a
1217                     ; 658 }
1220  00f9 81            	ret	
1295                     ; 670 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1295                     ; 671 {
1296                     	switch	.text
1297  00fa               _FLASH_WaitForLastOperation:
1299  00fa 5203          	subw	sp,#3
1300       00000003      OFST:	set	3
1303                     ; 672   uint16_t timeout = OPERATION_TIMEOUT;
1305  00fc ae1000        	ldw	x,#4096
1306  00ff 1f01          	ldw	(OFST-2,sp),x
1308                     ; 673   uint8_t My_FlagStatus = 0x00;
1310  0101 0f03          	clr	(OFST+0,sp)
1313  0103 200a          	jra	L365
1314  0105               L755:
1315                     ; 678     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1317  0105 c65054        	ld	a,20564
1318  0108 a405          	and	a,#5
1319  010a 6b03          	ld	(OFST+0,sp),a
1321                     ; 679     timeout--;
1323  010c 5a            	decw	x
1324  010d 1f01          	ldw	(OFST-2,sp),x
1326  010f               L365:
1327                     ; 676   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1329  010f 7b03          	ld	a,(OFST+0,sp)
1330  0111 2604          	jrne	L765
1332  0113 1e01          	ldw	x,(OFST-2,sp)
1333  0115 26ee          	jrne	L755
1334  0117               L765:
1335                     ; 682   if (timeout == 0x00)
1337  0117 1e01          	ldw	x,(OFST-2,sp)
1338  0119 2602          	jrne	L175
1339                     ; 684     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1341  011b a602          	ld	a,#2
1343  011d               L175:
1344                     ; 687   return((FLASH_Status_TypeDef)My_FlagStatus);
1348  011d 5b03          	addw	sp,#3
1349  011f 81            	ret	
1362                     	xdef	_FLASH_WaitForLastOperation
1363                     	xdef	_FLASH_EraseBlock
1364                     	xdef	_FLASH_ProgramBlock
1365                     	xdef	_FLASH_GetFlagStatus
1366                     	xdef	_FLASH_ITConfig
1367                     	xdef	_FLASH_GetReadOutProtectionStatus
1368                     	xdef	_FLASH_GetDataSize
1369                     	xdef	_FLASH_GetBootSize
1370                     	xdef	_FLASH_ReadByte
1371                     	xdef	_FLASH_ProgramWord
1372                     	xdef	_FLASH_EraseByte
1373                     	xdef	_FLASH_ProgramByte
1374                     	xdef	_FLASH_Lock
1375                     	xdef	_FLASH_Unlock
1376                     	xdef	_FLASH_DeInit
1377                     	xdef	_FLASH_SetProgrammingTime
1378                     	xdef	_FLASH_GetProgrammingTime
1397                     	end
