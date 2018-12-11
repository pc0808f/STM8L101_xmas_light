   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
 112                     ; 64 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 112                     ; 65 {
 114                     	switch	.text
 115  0000               _RST_GetFlagStatus:
 119                     ; 67   assert_param(IS_RST_FLAG(RST_Flag));
 121                     ; 71   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 123  0000 c450b1        	and	a,20657
 124  0003 2702          	jreq	L01
 125  0005 a601          	ld	a,#1
 126  0007               L01:
 129  0007 81            	ret	
 164                     ; 85 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 164                     ; 86 {
 165                     	switch	.text
 166  0008               _RST_ClearFlag:
 170                     ; 88   assert_param(IS_RST_FLAG(RST_Flag));
 172                     ; 90   RST->SR = (uint8_t)RST_Flag;
 174  0008 c750b1        	ld	20657,a
 175                     ; 91 }
 178  000b 81            	ret	
 201                     ; 98 void RST_GPOutputEnable(void)
 201                     ; 99 {
 202                     	switch	.text
 203  000c               _RST_GPOutputEnable:
 207                     ; 101   RST->CR = RST_CR_MASK;
 209  000c 35d050b0      	mov	20656,#208
 210                     ; 102 }
 213  0010 81            	ret	
 226                     	xdef	_RST_GPOutputEnable
 227                     	xdef	_RST_ClearFlag
 228                     	xdef	_RST_GetFlagStatus
 247                     	end
