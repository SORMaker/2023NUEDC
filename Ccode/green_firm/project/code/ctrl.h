#ifndef _CTRL_H_
#define _CTRL_H_
#include "zf_common_headfile.h"
#include "inc_all.h"
#define SOLID_BIAS_X  (18)
#define SOLID_BIAS_Y  (-18)

extern bool chase_enable;
bool isCatchPoint(void);
void taskTimAllInit(void);
void ChasingControl(void);

#endif
