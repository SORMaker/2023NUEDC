################################################################################
# MRS Version: {"version":"1.8.4","date":"2023/02/015"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_clock.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_debug.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_fifo.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_font.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_function.c \
S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_interrupt.c 

OBJS += \
./zf_common/zf_common_clock.o \
./zf_common/zf_common_debug.o \
./zf_common/zf_common_fifo.o \
./zf_common/zf_common_font.o \
./zf_common/zf_common_function.o \
./zf_common/zf_common_interrupt.o 

C_DEPS += \
./zf_common/zf_common_clock.d \
./zf_common/zf_common_debug.d \
./zf_common/zf_common_fifo.d \
./zf_common/zf_common_font.d \
./zf_common/zf_common_function.d \
./zf_common/zf_common_interrupt.d 


# Each subdirectory must supply rules for building sources it contributes
zf_common/zf_common_clock.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_clock.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_common/zf_common_debug.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_debug.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_common/zf_common_fifo.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_fifo.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_common/zf_common_font.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_font.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_common/zf_common_function.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_function.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
zf_common/zf_common_interrupt.o: S:/WorkSpace/NUEDC/2023NUEDC/CHV307_Library-master/Seekfree_CH32V307VCT6_Opensource_Library/libraries/zf_common/zf_common_interrupt.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\Libraries\doc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Core" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Ld" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Peripheral" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\sdk\Startup" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\user\inc" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_common" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_device" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\project\code" -I"S:\WorkSpace\NUEDC\2023NUEDC\CHV307_Library-master\Seekfree_CH32V307VCT6_Opensource_Library\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
