/*!
 * @file    ctrl.c
 * @author  Baohan
 * @date    2022/10/09
 */

#include "ctrl.h"

float cornerPoint[4][2] = {{111 - 50, 10 - 111},
                           {111 - 200, 30 - 111},
                           {111 - 180, 210 - 111},
                           {111 - 30, 180 - 111}};
uint16_t servoDuty[1000][2] = {0};    // [][0] Upper servo, [][1] Bottom servo
float k1, k2, k3, k4, b1, b2, b3, b4;
float param = 100.0f / 224.0f;
float x, y;

/*!
 * @brief       Motor control init, including encoder init
 *
 * @return      None
 */
void MotorInit(void)
{
//    // Servo motor init
//    pwm_init(TIM4_PWM_MAP1_CH1_D12, SERVO_FREQ, SERVO_MID);
//    pwm_init(TIM4_PWM_MAP1_CH3_D14, SERVO_FREQ, SERVO_MID);

    // Interrupt init
//    pit_ms_init(TIM2_PIT, 10);
}


//void pwm_set_servo_duty(pwm_channel_enum pin, uint32 duty)
//{
//    duty = Limitation(duty, (-SERVO_DUTY_MAX), SERVO_DUTY_MAX);
//    pwm_set_duty(pin, duty);
//}


void GetRectLine()
{
    float tmpK = 0;

    k1 = (cornerPoint[0][0] - cornerPoint[1][0]) / (cornerPoint[0][1] - cornerPoint[1][1]);
    b1 = cornerPoint[0][0] - k1 * cornerPoint[0][1];

    k2 = (cornerPoint[1][0] - cornerPoint[2][0]) / (cornerPoint[1][1] - cornerPoint[2][1]);
    b2 = cornerPoint[1][0] - k2 * cornerPoint[1][1];

    k3 = (cornerPoint[2][0] - cornerPoint[3][0]) / (cornerPoint[2][1] - cornerPoint[3][1]);
    b3 = cornerPoint[2][0] - k3 * cornerPoint[2][1];

    k4 = (cornerPoint[3][0] - cornerPoint[0][0]) / (cornerPoint[3][1] - cornerPoint[0][1]);
    b4 = cornerPoint[3][0] - k4 * cornerPoint[3][1];
}


uint16_t GetLaserPoint()
{
    uint32_t dutyUp, dutyBottom = 0;
    uint16_t cnt = 0;
    for (int16_t i = (int16_t) cornerPoint[0][1]; i <= (int16_t) cornerPoint[1][1]; ++i)
    {
        y = (int16_t) (k1 * i + b1);
        x = i;
        vofaData[3] = x;
        vofaData[2] = y;
        VofaSendFrame();
        system_delay_ms(100);
        servoDuty[cnt][0] = GetServoDuty(atanf(param * y / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][1] = GetServoDuty(atanf(param * i / 100.0f) * RAD_TO_DEGREE);
    }
    for (int16_t i = (int16_t) cornerPoint[1][0]; i <= (int16_t) cornerPoint[2][0]; ++i)
    {
        x = (int16_t) ((i - b2) / k2);
        y = i;
        vofaData[3] = x;
        vofaData[2] = y;
        VofaSendFrame();
        system_delay_ms(100);
        servoDuty[cnt][0] = GetServoDuty(atanf(param * i / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][1] = GetServoDuty(atanf(param * x / 100.0f) * RAD_TO_DEGREE);
    }
    for (int16_t i = (int16_t) cornerPoint[2][1]; i >= (int16_t) cornerPoint[3][1]; --i)
    {
        y = (int16_t) (k3 * i + b3);
        x = i;
        vofaData[3] = x;
        vofaData[2] = y;
        VofaSendFrame();
        system_delay_ms(100);
        servoDuty[cnt][0] = GetServoDuty(atanf(param * y / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][1] = GetServoDuty(atanf(param * i / 100.0f) * RAD_TO_DEGREE);
    }
    for (int16_t i = (int16_t) cornerPoint[3][0]; i >= (int16_t) cornerPoint[0][0]; --i)
    {
        x = (int16_t) ((i - b4) / k4);
        y = i;
        vofaData[3] = x;
        vofaData[2] = y;
        VofaSendFrame();
        system_delay_ms(100);
        servoDuty[cnt][0] = GetServoDuty(atanf(param * i / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][1] = GetServoDuty(atanf(param * x / 100.0f) * RAD_TO_DEGREE);
    }
    return cnt;
}