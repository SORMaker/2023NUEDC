################################################################################
# MRS Version: {"version":"1.8.5","date":"2023/05/22"}
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/buzzer.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/ctrl.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/cursor.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_key.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_ui.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_ui_user_app.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/moto.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/pid.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/profile_photo_erbws.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/upacker.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/user_flash.c \
F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/user_ips114.c 

OBJS += \
./code/buzzer.o \
./code/ctrl.o \
./code/cursor.o \
./code/easy_key.o \
./code/easy_ui.o \
./code/easy_ui_user_app.o \
./code/moto.o \
./code/pid.o \
./code/profile_photo_erbws.o \
./code/upacker.o \
./code/user_flash.o \
./code/user_ips114.o 

C_DEPS += \
./code/buzzer.d \
./code/ctrl.d \
./code/cursor.d \
./code/easy_key.d \
./code/easy_ui.d \
./code/easy_ui_user_app.d \
./code/moto.d \
./code/pid.d \
./code/profile_photo_erbws.d \
./code/upacker.d \
./code/user_flash.d \
./code/user_ips114.d 


# Each subdirectory must supply rules for building sources it contributes
code/buzzer.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/buzzer.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/ctrl.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/ctrl.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/cursor.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/cursor.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/easy_key.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_key.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/easy_ui.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_ui.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/easy_ui_user_app.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/easy_ui_user_app.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/moto.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/moto.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/pid.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/pid.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/profile_photo_erbws.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/profile_photo_erbws.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/upacker.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/upacker.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/user_flash.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/user_flash.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
code/user_ips114.o: F:/TICup/Firmware/2023NUEDC/Ccode/green_firm/project/code/user_ips114.c
	@	@	riscv-none-embed-gcc -march=rv32imafc -mabi=ilp32f -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -pedantic -Wunused -Wuninitialized -Wall  -g -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\Libraries\doc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Core" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Ld" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Peripheral" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\sdk\Startup" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\user\inc" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_common" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_device" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\project\code" -I"F:\TICup\Firmware\2023NUEDC\Ccode\green_firm\libraries\zf_driver" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

