/*!
 * Copyright (c) 2023, ErBW_s
 * All rights reserved.
 * 
 * @author  Baohan
 */

#include "buzzer.h"

int16_t beepTime = 0;

void BuzzerInit()
{
    gpio_init(BUZZER_PIN,GPO,0,GPO_PUSH_PULL);
}

void Beep()
{
    if (beepTime <= 0)
    {
        gpio_set_level(BUZZER_PIN,0);
        return;
    }
    gpio_set_level(BUZZER_PIN,1);
    beepTime -= BUZZER_TRIGGER_TIME_MS;
}