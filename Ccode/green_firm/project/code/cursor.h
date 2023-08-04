//
// Created by Mr.WU on 2023/8/2.
//

#ifndef RED_FIRM_CURSOR_H
#define RED_FIRM_CURSOR_H

#include "inc_all.h"

#define TIM_MS_PER_TICK 1
typedef struct {
    float biasX;
    float biasY;
    float biasXLeft;
    float biasXRight;
    float biasYTop;
    float biasYBottom;
    float X;
    float Y;
    float sportX_des;
    float sportY_des;
    float sportX_step;
    float sportY_step;
    float yaw;
    float pitch;
    uint32 timeStamp;
    bool is_sporting;
    bool is_halt;
} Cursor;

extern Cursor global_cursor;
extern float global_X,global_Y,global_yaw,global_pitch;
void cursorReset(Cursor *cursor);
void cursorResume(Cursor *cursor);
void cursorHalt(Cursor *cursor);
void cursorInit(Cursor *cursor, float x0, float y0, float biasXLeft, float biasXRight, float biasYTop, float biasYBottom);
void cursorSetPoint(Cursor *cursor, float x_des,float y_des);
void cursorSetPointSport(Cursor *cursor, float x, float y, uint16 ms);
void cursorHandler(Cursor *cursor);
#endif //RED_FIRM_CURSOR_H
