# ST Visual Debugger Generated MAKE File, based on stm8l10x.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\PROGRA~2\COSMIC\FSE_CO~1\CXSTM8
ToolsetBin=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8
ToolsetInc=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8
ToolsetLib=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib
ToolsetIncOpts=-i"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8" 
ToolsetLibOpts=-l"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=stm8l10x
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp +compact +split -pp -l -i..\..\\ -i..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc -i..\..\..\..\utilities\stm8l101_eval -i..\..\..\..\utilities\stm8l101_eval\common $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\main.$(ObjectExt) : ..\..\main.c c:\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x.h ..\..\stm8l10x_conf.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_awu.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_beep.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_clk.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_comp.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_exti.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_flash.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_gpio.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_i2c.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_irtim.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_itc.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_iwdg.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_rst.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_spi.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_tim2.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_tim3.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_tim4.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_usart.h ..\..\..\..\libraries\stm8l10x_stdperiph_driver\inc\stm8l10x_wfe.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_it.$(ObjectExt) : ..\..\stm8l10x_it.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_awu.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_awu.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_beep.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_beep.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_clk.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_comp.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_comp.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_exti.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_exti.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_flash.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_flash.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_gpio.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_i2c.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_i2c.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_irtim.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_irtim.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_itc.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_itc.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_iwdg.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_iwdg.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_rst.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_rst.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_spi.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_tim2.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_tim2.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_tim3.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_tim3.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_tim4.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_usart.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_usart.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8l10x_wfe.$(ObjectExt) : ..\..\..\..\libraries\stm8l10x_stdperiph_driver\src\stm8l10x_wfe.c c:\PROGRA~2\cosmic\CXSTM8~1\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\main.o $(OutputPath)\stm8l10x_it.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8l10x_awu.o $(OutputPath)\stm8l10x_beep.o $(OutputPath)\stm8l10x_clk.o $(OutputPath)\stm8l10x_comp.o $(OutputPath)\stm8l10x_exti.o $(OutputPath)\stm8l10x_flash.o $(OutputPath)\stm8l10x_gpio.o $(OutputPath)\stm8l10x_i2c.o $(OutputPath)\stm8l10x_irtim.o $(OutputPath)\stm8l10x_itc.o $(OutputPath)\stm8l10x_iwdg.o $(OutputPath)\stm8l10x_rst.o $(OutputPath)\stm8l10x_spi.o $(OutputPath)\stm8l10x_tim2.o $(OutputPath)\stm8l10x_tim3.o $(OutputPath)\stm8l10x_tim4.o $(OutputPath)\stm8l10x_usart.o $(OutputPath)\stm8l10x_wfe.o $(OutputPath)\stm8l10x.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8l10x_it.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8l10x_awu.o
	-@erase $(OutputPath)\stm8l10x_beep.o
	-@erase $(OutputPath)\stm8l10x_clk.o
	-@erase $(OutputPath)\stm8l10x_comp.o
	-@erase $(OutputPath)\stm8l10x_exti.o
	-@erase $(OutputPath)\stm8l10x_flash.o
	-@erase $(OutputPath)\stm8l10x_gpio.o
	-@erase $(OutputPath)\stm8l10x_i2c.o
	-@erase $(OutputPath)\stm8l10x_irtim.o
	-@erase $(OutputPath)\stm8l10x_itc.o
	-@erase $(OutputPath)\stm8l10x_iwdg.o
	-@erase $(OutputPath)\stm8l10x_rst.o
	-@erase $(OutputPath)\stm8l10x_spi.o
	-@erase $(OutputPath)\stm8l10x_tim2.o
	-@erase $(OutputPath)\stm8l10x_tim3.o
	-@erase $(OutputPath)\stm8l10x_tim4.o
	-@erase $(OutputPath)\stm8l10x_usart.o
	-@erase $(OutputPath)\stm8l10x_wfe.o
	-@erase $(OutputPath)\stm8l10x.elf
	-@erase $(OutputPath)\stm8l10x.elf
	-@erase $(OutputPath)\stm8l10x.map
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8l10x_it.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8l10x_awu.ls
	-@erase $(OutputPath)\stm8l10x_beep.ls
	-@erase $(OutputPath)\stm8l10x_clk.ls
	-@erase $(OutputPath)\stm8l10x_comp.ls
	-@erase $(OutputPath)\stm8l10x_exti.ls
	-@erase $(OutputPath)\stm8l10x_flash.ls
	-@erase $(OutputPath)\stm8l10x_gpio.ls
	-@erase $(OutputPath)\stm8l10x_i2c.ls
	-@erase $(OutputPath)\stm8l10x_irtim.ls
	-@erase $(OutputPath)\stm8l10x_itc.ls
	-@erase $(OutputPath)\stm8l10x_iwdg.ls
	-@erase $(OutputPath)\stm8l10x_rst.ls
	-@erase $(OutputPath)\stm8l10x_spi.ls
	-@erase $(OutputPath)\stm8l10x_tim2.ls
	-@erase $(OutputPath)\stm8l10x_tim3.ls
	-@erase $(OutputPath)\stm8l10x_tim4.ls
	-@erase $(OutputPath)\stm8l10x_usart.ls
	-@erase $(OutputPath)\stm8l10x_wfe.ls
endif
