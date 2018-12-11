   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
   4                     ; Optimizer V4.4.8 - 20 Jun 2018
  80                     ; 58 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  80                     ; 59 {
  82                     	switch	.text
  83  0000               _IWDG_WriteAccessCmd:
  87                     ; 61   assert_param(IS_IWDG_WRITEACCESS_MODE(IWDG_WriteAccess));
  89                     ; 62   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  91  0000 c750e0        	ld	20704,a
  92                     ; 63 }
  95  0003 81            	ret	
 185                     ; 79 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 185                     ; 80 {
 186                     	switch	.text
 187  0004               _IWDG_SetPrescaler:
 191                     ; 82   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 193                     ; 83   IWDG->PR = (uint8_t)IWDG_Prescaler;
 195  0004 c750e1        	ld	20705,a
 196                     ; 84 }
 199  0007 81            	ret	
 233                     ; 93 void IWDG_SetReload(uint8_t IWDG_Reload)
 233                     ; 94 {
 234                     	switch	.text
 235  0008               _IWDG_SetReload:
 239                     ; 95   IWDG->RLR = IWDG_Reload;
 241  0008 c750e2        	ld	20706,a
 242                     ; 96 }
 245  000b 81            	ret	
 268                     ; 104 void IWDG_ReloadCounter(void)
 268                     ; 105 {
 269                     	switch	.text
 270  000c               _IWDG_ReloadCounter:
 274                     ; 106   IWDG->KR = IWDG_KEY_REFRESH;
 276  000c 35aa50e0      	mov	20704,#170
 277                     ; 107 }
 280  0010 81            	ret	
 303                     ; 114 void IWDG_Enable(void)
 303                     ; 115 {
 304                     	switch	.text
 305  0011               _IWDG_Enable:
 309                     ; 116   IWDG->KR = IWDG_KEY_ENABLE;
 311  0011 35cc50e0      	mov	20704,#204
 312                     ; 117 }
 315  0015 81            	ret	
 328                     	xdef	_IWDG_Enable
 329                     	xdef	_IWDG_ReloadCounter
 330                     	xdef	_IWDG_SetReload
 331                     	xdef	_IWDG_SetPrescaler
 332                     	xdef	_IWDG_WriteAccessCmd
 351                     	end
