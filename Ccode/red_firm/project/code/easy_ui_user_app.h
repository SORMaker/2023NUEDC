/*!
 * Copyright (c) 2023, ErBW_s
 * All rights reserved.
 *
 * @author  Baohan
 */

#ifndef _MENU_H
#define _MENU_H

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdint.h>
#include <string.h>
#include "easy_ui.h"
#include "easy_key.h"
#include "ctrl.h"
#include "zf_driver_pit.h"
#include "zf_driver_pwm.h"
#include "zf_driver_uart.h"
#include "zf_device_dl1a.h"

void MenuInit();

extern uint64_t uid;

#ifdef __cplusplus
}
#endif

#endif
