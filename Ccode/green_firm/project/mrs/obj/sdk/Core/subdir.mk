################################################################################
# MRS Version: {"version":"1.8.4","date":"2023/02/015"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/libraries/sdk/Core/core_riscv.c 

OBJS += \
./sdk/Core/core_riscv.o 

C_DEPS += \
./sdk/Core/core_riscv.d 


# Each subdirectory must supply rules for building sources it contributes
sdk/Core/core_riscv.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/libraries/sdk/Core/core_riscv.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

