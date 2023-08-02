/*!
 * Copyright (c) 2023, ErBW_s
 * All rights reserved.
 * 
 * @author  Baohan
 */

#ifndef _BUZZER_H
#define _BUZZER_H

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>
#include "zf_driver_gpio.h"
#include "zf_driver_pwm.h"

#define BUZZER_PIN                  (B10)
#define BUZZER_TRIGGER_TIME_MS      20

extern int16_t beepTime;

void BuzzerInit();
void Beep();

#ifdef __cplusplus
}
#endif

#endif
