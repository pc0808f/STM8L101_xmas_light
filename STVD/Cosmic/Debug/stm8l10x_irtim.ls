   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  45                     ; 55 void IRTIM_DeInit(void)
  45                     ; 56 {
  47                     	switch	.text
  48  0000               _IRTIM_DeInit:
  52                     ; 57   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  54  0000 725f52ff      	clr	21247
  55                     ; 58 }
  58  0004 81            	ret	
 113                     ; 66 void IRTIM_Cmd(FunctionalState NewState)
 113                     ; 67 {
 114                     	switch	.text
 115  0005               _IRTIM_Cmd:
 119                     ; 69   assert_param(IS_FUNCTIONAL_STATE(NewState));
 121                     ; 72   if (NewState ==  DISABLE)
 123  0005 4d            	tnz	a
 124  0006 2605          	jrne	L74
 125                     ; 74     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN);
 127  0008 721152ff      	bres	21247,#0
 130  000c 81            	ret	
 131  000d               L74:
 132                     ; 78     IRTIM->CR |= IRTIM_CR_EN;
 134  000d 721052ff      	bset	21247,#0
 135                     ; 80 }
 138  0011 81            	ret	
 174                     ; 87 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 174                     ; 88 {
 175                     	switch	.text
 176  0012               _IRTIM_HighSinkODCmd:
 180                     ; 90   assert_param(IS_FUNCTIONAL_STATE(NewState));
 182                     ; 93   if (NewState == DISABLE)
 184  0012 4d            	tnz	a
 185  0013 2605          	jrne	L17
 186                     ; 95     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN);
 188  0015 721352ff      	bres	21247,#1
 191  0019 81            	ret	
 192  001a               L17:
 193                     ; 99     IRTIM->CR |= IRTIM_CR_HSEN;
 195  001a 721252ff      	bset	21247,#1
 196                     ; 101 }
 199  001e 81            	ret	
 223                     ; 108 FunctionalState IRTIM_GetStatus(void)
 223                     ; 109 {
 224                     	switch	.text
 225  001f               _IRTIM_GetStatus:
 229                     ; 110   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_EN));
 231  001f c652ff        	ld	a,21247
 232  0022 a401          	and	a,#1
 235  0024 81            	ret	
 260                     ; 118 FunctionalState IRTIM_GetHighSinkODStatus(void)
 260                     ; 119 {
 261                     	switch	.text
 262  0025               _IRTIM_GetHighSinkODStatus:
 266                     ; 120   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 268  0025 c652ff        	ld	a,21247
 269  0028 a402          	and	a,#2
 272  002a 81            	ret	
 285                     	xdef	_IRTIM_GetHighSinkODStatus
 286                     	xdef	_IRTIM_HighSinkODCmd
 287                     	xdef	_IRTIM_GetStatus
 288                     	xdef	_IRTIM_Cmd
 289                     	xdef	_IRTIM_DeInit
 308                     	end
