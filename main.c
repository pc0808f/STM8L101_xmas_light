/**
  ******************************************************************************
  * @file     Project/STM8L10x_StdPeriph_Templates/main.c
  * @author   MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief    This file contains the firmware main function.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l10x.h"
#include "main.h"

/** @addtogroup STM8L10x_StdPeriph_Templates
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define LED_GPIO_PORT  GPIOC
#define LED_GPIO_PINS  GPIO_Pin_0
#define RTC_MAX	(86399)	//one day
/**
  * @addtogroup TIM2_SinewaveGeneration
  * @{
  */

/* This shows the value of the samples for the different no of samples in half
sine wave. The last value corresponds to the amplitude of the sine wave.*/

#if  nbr_of_samples_half == 16
CONST uint8_t sample[9]={0,20,38,56,71,83,92,98,100};

#elif  nbr_of_samples_half == 18
CONST uint8_t sample[10]={0,17,34,50,64,76,86,93,97,99};

#elif  nbr_of_samples_half == 22
CONST uint8_t sample[12]={0,14,28,42,54,65,76,84,91,96,99,100};

#elif  nbr_of_samples_half == 24
CONST uint8_t sample[13]={0,13,25,38,49,60,69,78,85,91,95,97,98};

#elif  nbr_of_samples_half == 26
CONST uint8_t sample[14]={0,12,24,35,46,56,66,74,81,88,93,96,98,99};

#elif  nbr_of_samples_half == 28
CONST uint8_t sample[15]={0,11,22,33,43,53,62,71,78,85,90,94,97,99,100};

#elif   nbr_of_samples_half == 30 
CONST uint8_t sample[16]={0,10,21,31,41,50,59,67,74,81,87,91,95,98,99,100};

#elif  nbr_of_samples_half == 46
CONST uint8_t sample[24]={0,7,13,20,26,33,39,45,51,57,62,67,72,76,80,84,87,90,92, \
                     94,96,97,98,98};
#endif
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO u32 tim4Tick=0;
__IO u32 RTCcounter=0;	
__IO	u16 secTick=0;
__IO MySin_Typedef sin ;/* Stores the sin structure */
__IO uint16_t counter = 0;   /* The counter variable for counting the Update cycles in TIM2 */
__IO uint16_t COUNTER = 1600;
/* Private function prototypes -----------------------------------------------*/
static void AWU_Config(void);
static void CLK_Config(void);
void LoadValueIntoSinStruct(void);
void LoadValueIntoOnOffStruct(void);
uint32_t LSIMeasurment(void);
void Delay(uint16_t nCount);
/* Private functions ---------------------------------------------------------*/

void main(void)
{
	u32		delayCount;
  u8    LED1State=0;
	u8    modeCount=0;
  u16   j;
  u8    i;
  u32   temp;

  /* Clock configuration -----------------------------------------*/
  CLK_Config();
 
  /*AWU configuration --------------------------------------------*/
  AWU_Config();

  CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);

	GPIO_Init(GPIOA,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(GPIOB,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(GPIOC,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(GPIOD,GPIO_Pin_All,GPIO_Mode_Out_PP_High_Slow);
	


  GPIO_Init(GPIOC, GPIO_Pin_0 | GPIO_Pin_1 , GPIO_Mode_Out_PP_High_Slow);

	GPIO_Init(GPIOB, GPIO_Pin_0 ,GPIO_Mode_Out_PP_High_Slow);


  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4,ENABLE);
  TIM4_DeInit();
  TIM4_TimeBaseInit(TIM4_Prescaler_128,0x7C);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ITConfig(TIM4_IT_Update,ENABLE);
  TIM4_Cmd(ENABLE);
  tim4Tick=0;
	
  /* Call LoadValueIntoSinStruct() & TIM_Config()*/
  LoadValueIntoOnOffStruct();  	
	
  
  enableInterrupts();
  
  delayCount=tim4Tick;
	//if(RTCcounter==0)
	//{
	//	CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
	//	TIM4_TimeBaseInit(TIM4_Prescaler_128,0x7C);
	//}	
	
  /* Enable TIM2 clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  
  /* Config TIM2 Channel 1 and channel 2 pins */
  GPIO_Init(GPIOB, GPIO_Pin_0, GPIO_Mode_Out_PP_High_Fast);
  
  TIM2_DeInit();
  
  /* Time base configuration */
  TIM2_TimeBaseInit(TIM2_Prescaler_4, TIM2_CounterMode_Up, INIT_TIM2_ARR);
  
  /* PWM configuration */
  TIM2_OC1Init(TIM2_OCMode_PWM1, TIM2_OutputState_Enable,INIT_TIM2_CCR1, TIM2_OCPolarity_Low, TIM2_OCIdleState_Reset);
  
  /* Update Interrupt Enable */
  TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  
  /* ARRPreload Enable */
  TIM2_ARRPreloadConfig(ENABLE);
  
  /* Enable TIM2 */
  TIM2_Cmd(ENABLE);
  
  /* Enable CC1 output*/
  TIM2_CtrlPWMOutputs(ENABLE);
	
	
	RTCcounter=60*60*21.5 - 5;
  while (1)
  {
		//IWDG_ReloadCounter ();


		if(( RTCcounter > 60*60*16.5 ) && (RTCcounter < 60*60*21.5 ))  // lighting
		{
			if(secTick>=1000)
			{
				secTick=secTick-1000;
				RTCcounter=RTCcounter+1;
				modeCount++;
				if(modeCount==60)
					modeCount=0;
				if(modeCount==0)
				{
					LoadValueIntoOnOffStruct();
				}
				if(modeCount==20)
				{
					LoadValueIntoSinStruct();
				}
				if(modeCount==40)
				{
					COUNTER=400;
				}
			}
			

			
			/*
			if(modeCount<10)
			{
				disableInterrupts();
				if(LED1State==0)
				{
					if((tim4Tick-delayCount)>500)
					{
						delayCount=tim4Tick;
						LED1State=1;
						GPIO_ResetBits   	( GPIOB,  GPIO_Pin_0 );
					}
				}
				else
				{
					if((tim4Tick-delayCount)>500)
					{
						delayCount=tim4Tick;
						LED1State=0;
						GPIO_SetBits   	( GPIOB,  GPIO_Pin_0  ) ;
					}
				}
				enableInterrupts();
			}
			*/
			/*
			else if(modeCount<20)
			{
				if(PMWcount < ((modeCount-10)*10))
					GPIO_SetBits   	( GPIOC,  GPIO_Pin_0 | GPIO_Pin_2 );
				else
					GPIO_ResetBits   	( GPIOC,  GPIO_Pin_0 | GPIO_Pin_2 ) ;
			}
			else if(modeCount<30)
			{
				if(PMWcount < (100-((modeCount-10)*20)) )
					GPIO_SetBits   	( GPIOC,  GPIO_Pin_0 | GPIO_Pin_2 );
				else
					GPIO_ResetBits   	( GPIOC,  GPIO_Pin_0 | GPIO_Pin_2 ) ;
			}
			*/			
		}
		else //sleep
		{
			  /* Enable CC1 output*/
			TIM2_CtrlPWMOutputs(DISABLE);
			TIM2_Cmd(DISABLE);
			GPIO_ResetBits   	( GPIOB,  GPIO_Pin_0  ) ;
			Delay(100);
			
		
			
			
			halt();
			RTCcounter=RTCcounter+30;
			if(secTick>=1000)
			{
				secTick=secTick-1000;
				RTCcounter=RTCcounter+1;
			}
			if(RTCcounter >= RTC_MAX)
				RTCcounter=RTCcounter-RTC_MAX;			
			//GPIO_ToggleBits( GPIOC,  GPIO_Pin_0 | GPIO_Pin_1) ;
			TIM2_Cmd(ENABLE);
			TIM2_CtrlPWMOutputs(ENABLE);
		}

     //if(LED1State==0)
		 /*
     {
       
       while((tim4Tick-delayCount)<5000);
       {
         //temp=(tim4Tick-delayCount);
         delayCount=tim4Tick;
				 LED1State=1;
				 GPIO_ResetBits   	( GPIOC,  GPIO_Pin_0 | GPIO_Pin_1 ) ;
				 
       }
     }
     //else
     {
       while((tim4Tick-delayCount)<5000);
       {
         //temp=(tim4Tick-delayCount);
         delayCount=tim4Tick;
         LED1State=0;
				 GPIO_SetBits  		( GPIOC,  GPIO_Pin_0 | GPIO_Pin_1) ;
       }       
     }
		*/
		//GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_In_FL_No_IT);

		//halt(); /* Program halted */

  }

}

static void CLK_Config(void)
{
  /* Initialization of the clock */
  /* Clock divider to HSI/1 */
  CLK_MasterPrescalerConfig(CLK_MasterPrescaler_HSIDiv1);
    
  /* Enable SPI clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_AWU, ENABLE);
}



static void AWU_Config(void)
{
  /* Initialization of AWU */
   /* LSI calibration for accurate auto wake up time base*/
  AWU_LSICalibrationConfig(LSIMeasurment());

  /* The delay corresponds to the time we will stay in Halt mode */
  AWU_Init(AWU_Timebase_30s);
	
	AWU_Cmd(ENABLE);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
}



/**
  * @brief  Fill Sin Struncture with the correct values
  * @param  None
  * @retval None
  */
void LoadValueIntoOnOffStruct(void)
{
  uint8_t  offset=0,diff=0;
  
  while(offset <= (nbr_of_samples_half/2))
  {
      /*First half of upper half samples of sine wave is loaded into "value" of sin structure.*/
      sin.Value[offset] = 98; 
      offset++;                      
  }
  diff = (uint8_t)(offset - 1);
  while(offset < nbr_of_samples_half)
  {                                    
      diff--;  
      /* Second half of upper half samples of sine wave is loaded into "value" of sin structure.*/
      sin.Value[offset] = 98;    
      offset++;                         
  }
  /*Index is initialized to 0.Sin wave upper half is generated at start*/
  sin.Index = 0;                      
  sin.Up = TRUE; 

	COUNTER=200;
}


/**
  * @brief  Fill Sin Struncture with the correct values
  * @param  None
  * @retval None
  */
void LoadValueIntoSinStruct(void)
{
  uint8_t  offset=0,diff=0;
  
  while(offset <= (nbr_of_samples_half/2))
  {
      /*First half of upper half samples of sine wave is loaded into "value" of sin structure.*/
      sin.Value[offset] = sample[offset]; 
      offset++;                      
  }
  diff = (uint8_t)(offset - 1);
  while(offset < nbr_of_samples_half)
  {                                    
      diff--;  
      /* Second half of upper half samples of sine wave is loaded into "value" of sin structure.*/
      sin.Value[offset] = sample[diff];    
      offset++;                         
  }
  /*Index is initialized to 0.Sin wave upper half is generated at start*/
  sin.Index = 0;                      
  sin.Up = TRUE;    

	COUNTER=1000;
}


/**
  * @brief Measure the LSI frequency using timer IC1 and update the calibration registers.
  * @note   It is recommended to use a timer clock frequency of at least 10MHz in order 
  *         to obtain a better in the LSI frequency measurement.
  * @param  None
  * @retval None
  */
uint32_t LSIMeasurment(void)
{

  uint32_t lsi_freq_hz = 0x0;
  uint32_t fmaster = 0x0;
  uint16_t ICValue1 = 0x0;
  uint16_t ICValue2 = 0x0;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

  /* Capture only every 8 events!!! */
  TIM2_ICInit(  TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);

  /* Enable TIM2 */
  TIM2_Cmd(ENABLE);

  /* wait a capture on cc1 */
  while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM2_GetCapture1();
  TIM2_ClearFlag(TIM2_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != TIM2_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue2 = TIM2_GetCapture1();
  TIM2_ClearFlag(TIM2_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
  /* Disable TIM2 */
  TIM2_Cmd(DISABLE);

  /* Compute LSI clock frequency */
  lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);

  /* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
  AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
  
  return (lsi_freq_hz);

}


void Delay(uint16_t nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}


#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
       ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

    /* Infinite loop */
    while (1)
    {
    }
}
#endif

/**
  * @}
  */
  
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/