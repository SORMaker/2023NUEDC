/*
 * inc_all.h
 *
 *  Created on: Mar 16, 2023
 *      Author: sorrymaker
 *
 */

#ifndef INC_ALL_H_
#define INC_ALL_H_

#define USE_GPS 1

#include "math.h"
#include "moto.h"
#include "pid.h"
#include "ctrl.h"
#include "buzzer.h"
#include "upacker.h"
#include "ctrl.h"
#include "cursor.h"
#include "easy_ui_user_app.h"
#include "easy_ui.h"
#include "easy_key.h"

extern uint32 now_tick;
#define BEEP_PWM_PIN TIM8_PWM_MAP1_CH4_C13

#endif /* INC_ALL_H_ */
