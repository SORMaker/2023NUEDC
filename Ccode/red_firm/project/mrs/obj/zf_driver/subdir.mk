################################################################################
# MRS Version: {"version":"1.8.4","date":"2023/02/015"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_adc.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_delay.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_dvp.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_encoder.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_exti.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_flash.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_gpio.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_iic.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_pit.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_pwm.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_soft_iic.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_soft_spi.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_spi.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_timer.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_uart.c \
/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_usb_cdc.c

OBJS += \
./zf_driver/zf_driver_adc.o \
./zf_driver/zf_driver_delay.o \
./zf_driver/zf_driver_dvp.o \
./zf_driver/zf_driver_encoder.o \
./zf_driver/zf_driver_exti.o \
./zf_driver/zf_driver_flash.o \
./zf_driver/zf_driver_gpio.o \
./zf_driver/zf_driver_iic.o \
./zf_driver/zf_driver_pit.o \
./zf_driver/zf_driver_pwm.o \
./zf_driver/zf_driver_soft_iic.o \
./zf_driver/zf_driver_soft_spi.o \
./zf_driver/zf_driver_spi.o \
./zf_driver/zf_driver_timer.o \
./zf_driver/zf_driver_uart.o \
./zf_driver/zf_driver_usb_cdc.o 

C_DEPS += \
./zf_driver/zf_driver_adc.d \
./zf_driver/zf_driver_delay.d \
./zf_driver/zf_driver_dvp.d \
./zf_driver/zf_driver_encoder.d \
./zf_driver/zf_driver_exti.d \
./zf_driver/zf_driver_flash.d \
./zf_driver/zf_driver_gpio.d \
./zf_driver/zf_driver_iic.d \
./zf_driver/zf_driver_pit.d \
./zf_driver/zf_driver_pwm.d \
./zf_driver/zf_driver_soft_iic.d \
./zf_driver/zf_driver_soft_spi.d \
./zf_driver/zf_driver_spi.d \
./zf_driver/zf_driver_timer.d \
./zf_driver/zf_driver_uart.d \
./zf_driver/zf_driver_usb_cdc.d 


# Each subdirectory must supply rules for building sources it contributes
zf_driver/zf_driver_adc.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_adc.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_delay.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_delay.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_dvp.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_dvp.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_encoder.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_encoder.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_exti.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_exti.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_flash.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_flash.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_gpio.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_gpio.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_iic.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_iic.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_pit.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_pit.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_pwm.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_pwm.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_soft_iic.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_soft_iic.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_soft_spi.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_soft_spi.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_spi.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_spi.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_timer.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_timer.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_uart.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_uart.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_driver/zf_driver_usb_cdc.o:/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver/zf_driver_usb_cdc.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/Libraries/doc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Core" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Ld" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Peripheral" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/sdk/Startup" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/user/inc" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_common" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_device" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/project/code" -I"/Users/baohan/ErBW_s/Projects/2023NUEDC/Ccode/red_firm/libraries/zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

