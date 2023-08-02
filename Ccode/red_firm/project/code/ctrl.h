/*!
 * @file    ctrl.h
 * @author  Baohan
 * @date    2022/10/09
 */

#ifndef _CTRL_H
#define _CTRL_H

//#include "zf_driver_pwm.h"
#include "pid.h"
#include <math.h>
#include "vofa.h"

#define SERVO_FREQ          50                                  // Servo frequency(50-300)
/*
 * Calculate servo PWM duty from turning angle.
 *
 * Servo often receive a period of 0.5ms to 2.5ms high level pulse,
 * which correspond 0 to 180-degree turning angle.
 *
 * To make calculate easier, I change the angle to [-90, 90],
 * if you want to use [0, 180], change the "1.5" in equation to "0.5".
 *
 * Below is the angle to duty equation,
 * "freq" refers to "PWM frequency"
 *
 *         10000 * (1.5 + x / 90)
 * duty = ------------------------   (-90 <= x <= 90)
 *              1000 / freq
 */
#define GetServoDuty(x)    ((float)(10000 * (1.5 + (float)x / 90.0)) / (1000.0 / (float)SERVO_FREQ))

#define SERVO_MID           GetServoDuty(0)                     // Middle duty of servo motor
#define SERVO_DUTY_MAX      (GetServoDuty(80) - SERVO_MID)      // Maximum turning angle of servo motor

#define RAD_TO_DEGREE       57.29578

extern float cornerPoint[4][2];
extern uint16_t servoDuty[1000][2];

void MotorInit(void);
//void pwm_set_servo_duty(pwm_channel_enum pin, uint32 duty);
void GetRectLine();
uint16_t GetLaserPoint();

#endif
