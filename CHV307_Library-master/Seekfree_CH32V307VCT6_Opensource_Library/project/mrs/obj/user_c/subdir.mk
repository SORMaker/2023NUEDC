################################################################################
# MRS Version: {"version":"1.8.5","date":"2023/05/22"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/project/user/src/isr.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/project/user/src/main.c 

OBJS += \
./user_c/isr.o \
./user_c/main.o 

C_DEPS += \
./user_c/isr.d \
./user_c/main.d 


# Each subdirectory must supply rules for building sources it contributes
user_c/isr.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/project/user/src/isr.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
user_c/main.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/project/user/src/main.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

