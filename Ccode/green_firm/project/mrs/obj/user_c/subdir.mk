################################################################################
# MRS Version: {"version":"1.8.5","date":"2023/05/22"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/user/src/isr.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/user/src/main.c 

OBJS += \
./user_c/isr.o \
./user_c/main.o 

C_DEPS += \
./user_c/isr.d \
./user_c/main.d 


# Each subdirectory must supply rules for building sources it contributes
user_c/isr.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/user/src/isr.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
user_c/main.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/user/src/main.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

