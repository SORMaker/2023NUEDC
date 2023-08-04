#include "ctrl.h"



#define MAIN_PIT           TIM1_PIT
#define BEEP_AND_KEY_PIT   TIM3_PIT

float bias_chaseX=0,bias_chaseY=0;
bool chase_enable = false;
void taskTimAllInit(void) {
    pit_ms_init(MAIN_PIT, 2);
    pit_ms_init(BEEP_AND_KEY_PIT, 10);
    interrupt_set_priority(TIM1_UP_IRQn, (1 << 5) | 1);
    interrupt_set_priority(TIM3_IRQn, (2 << 5) | 2);
}
void ChasingControl(void) {
    if(!chase_enable)return;
    bias_chaseX = rxData.cx;
    bias_chaseY = rxData.cy;
    PID_Calculate(&chaseXPid, 0, bias_chaseX);
    PID_Calculate(&chaseYPid, 0, bias_chaseY);
    cursorSetPoint(&global_cursor,chaseXPid.delta_out,chaseYPid.delta_out);
    if(powf(bias_chaseX,2)+ powf(bias_chaseY,2)<36)
        beepTime=2000;

//    if(servo_sport_update_flag==0)
//    {
//        servo_current_duty = servo_input_duty;//记得在缓动不起效果时更新当前duty值
//    }
//    ServoSportHandler(&servo_input_duty);

//    pwm_set_duty(SERVO_YAW_PIN, (uint32)chaseXPid.pos_out);
//    pwm_set_duty(SERVO_PITCH_PIN, (uint32)chaseYPid.pos_out);
}
