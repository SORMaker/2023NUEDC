#include "ctrl.h"



#define MAIN_PIT           TIM1_PIT
#define BEEP_AND_KEY_PIT   TIM3_PIT

void taskTimAllInit(void) {
    pit_ms_init(MAIN_PIT, 2);
    pit_ms_init(BEEP_AND_KEY_PIT, 10);
    interrupt_set_priority(TIM1_UP_IRQn, (1 << 5) | 1);
    interrupt_set_priority(TIM3_IRQn, (2 << 5) | 2);
}

void ServoControl(void) {
    PID_Calculate(&dirYawPid, 0, (float) 0);
    PID_Calculate(&dirPitchPid, 0, (float) 0);

//    if(servo_sport_update_flag==0)
//    {
//        servo_current_duty = servo_input_duty;//记得在缓动不起效果时更新当前duty值
//    }
//    ServoSportHandler(&servo_input_duty);
    pwm_set_duty(SERVO_YAW_PIN, (uint32)dirYawPid.pos_out);
    pwm_set_duty(SERVO_PITCH_PIN, (uint32)dirPitchPid.pos_out);
}
