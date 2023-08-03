#ifndef __BSP_MOTO_H
#define __BSP_MOTO_H

#include "zf_common_headfile.h"

#define SERVO_FREQ          50                                  // Servo frequency(50-300)
/* 
 * Caculate servo PWM duty from turning angle.
 * 
 * Servo often receive a period of 0.5ms to 2.5ms high level pulse,
 * which correspond 0 to 180 degree turning angle.
 * 
 * To make caculate easier, I change the angle to [-90, 90],
 * if you want to use [0, 180], change the "1.5" in equation to "0.5".
 * 
 * Below is the angle to duty equation,
 * "freq" refers to "PWM frequency"
 * 
 *         10000 * (1.5 + x / 90)
 * duty = ------------------------   (-90 <= x <= 90)
 *              1000 / freq
 * 
 */
#define GetYawServoDuty(x)    ((float)(PWM_DUTY_MAX * (1.57 + (float)x / 90.0)) / (1000.0 / (float)SERVO_FREQ))
#define GetPitchServoDuty(x)    ((float)(PWM_DUTY_MAX * (1.54 + (float)x / 90.0)) / (1000.0 / (float)SERVO_FREQ))


#define SERVO_YAW_MID           (GetYawServoDuty(0))
#define SERVO_PITCH_MID         (GetPitchServoDuty(0))
#define SERVO_DUTY_MAX          (GetServoDuty(14) - SERVO_MID)                                  // Maximum turning angle of servo motor
#define SERVO_YAW_PIN           TIM2_PWM_MAP0_CH1_A0                                        // Servo YAW output pin
#define SERVO_PITCH_PIN         TIM2_PWM_MAP0_CH2_A1                                        // Servo PITCH pwm output pin



extern uint8 servo_sport_update_flag;
extern uint16 servo_current_duty;
void pwmInit(void);
void angleSet(pwm_channel_enum pin,float angle);
void ServoSportSet(uint16_t duty_value,int32_t ticks);
void ServoSportHandler(uint16 *duty_input);
#define myABS(x) (x>0?x:-x)

#endif
