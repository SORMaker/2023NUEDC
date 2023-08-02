################################################################################
# MRS Version: {"version":"1.8.4","date":"2023/02/015"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/buzzer.c \
F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/ctrl.c \
F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/moto.c \
F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/pid.c 

OBJS += \
./code/buzzer.o \
./code/ctrl.o \
./code/moto.o \
./code/pid.o 

C_DEPS += \
./code/buzzer.d \
./code/ctrl.d \
./code/moto.d \
./code/pid.d 


# Each subdirectory must supply rules for building sources it contributes
code/buzzer.o: F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/buzzer.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\Libraries\doc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Core" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Ld" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Peripheral" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Startup" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\user\inc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_common" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_device" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\code" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/ctrl.o: F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/ctrl.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\Libraries\doc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Core" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Ld" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Peripheral" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Startup" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\user\inc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_common" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_device" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\code" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/moto.o: F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/moto.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\Libraries\doc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Core" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Ld" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Peripheral" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Startup" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\user\inc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_common" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_device" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\code" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/pid.o: F:/电赛/Firmware/2023NUEDC/Ccode/red_firm/project/code/pid.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\Libraries\doc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Core" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Ld" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Peripheral" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\sdk\Startup" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\user\inc" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_common" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_device" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\project\code" -I"F:\电赛\Firmware\2023NUEDC\Ccode\red_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

