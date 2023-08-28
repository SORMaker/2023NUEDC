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
bool isCatchPoint(void){
    return rxData.cx+SOLID_BIAS_X!=0||rxData.cy+SOLID_BIAS_Y!=0;
}
void ChasingControl(void) {
    uint16 miss_count=0;
    static bool mutex=false;
    if(!chase_enable||global_cursor.is_halt)
        return;
    if(isCatchPoint()==false){
        return;
//        while (isCatchPoint()==false){
//            miss_count++;
//            if(miss_count>500){
//                chase_enable=false;
//                pidClear(&chaseYPid);
//                pidClear(&chaseXPid);
//                return;
//            }
//        }
    }
    bias_chaseX = rxData.cx;
    bias_chaseY = rxData.cy;
    if (mutex==false)
    {
        PID_Calculate(&chaseXPid, 0, bias_chaseX);
        PID_Calculate(&chaseYPid, 0, bias_chaseY);
        cursorSetPoint(&global_cursor,chaseXPid.delta_out,chaseYPid.delta_out);
    }
    else
        beepTime=20;
    if(powf(bias_chaseX,2)+ powf(bias_chaseY,2)<18&&mutex==false)
    {
        mutex=true;
    } else if(powf(bias_chaseX,2)+ powf(bias_chaseY,2)>60&&mutex==true){
//        pidClear(&chaseYPid);
//        pidClear(&chaseXPid);
        mutex=false;
    }


//    if(servo_sport_update_flag==0)
//    {
//        servo_current_duty = servo_input_duty;//记得在缓动不起效果时更新当前duty值
//    }
//    ServoSportHandler(&servo_input_duty);

//    pwm_set_duty(SERVO_YAW_PIN, (uint32)chaseXPid.pos_out);
//    pwm_set_duty(SERVO_PITCH_PIN, (uint32)chaseYPid.pos_out);
}
void SquarePathControl(void){
    extern bool enable_square_chase;
    extern int16 global_x_bias,global_y_bias;
    if(!enable_square_chase||global_cursor.is_halt)
        return;
    PID_Calculate(&chaseSqXPid, 0, global_x_bias);
    PID_Calculate(&chaseSqYPid, 0, global_y_bias);
    cursorSetPoint(&global_cursor,chaseSqXPid.delta_out,chaseSqYPid.delta_out);
}