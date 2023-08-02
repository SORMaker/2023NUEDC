################################################################################
# MRS Version: {"version":"1.8.4","date":"2023/02/015"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/src/isr.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/src/main.c

OBJS += \
./user_c/isr.o \
./user_c/main.o 

C_DEPS += \
./user_c/isr.d \
./user_c/main.d 


# Each subdirectory must supply rules for building sources it contributes
user_c/isr.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/src/isr.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
user_c/main.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/src/main.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

