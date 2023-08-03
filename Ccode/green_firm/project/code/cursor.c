#include "cursor.h"

float global_X,global_Y,global_yaw,global_pitch;
Cursor global_cursor = {0};

void cursorReset(Cursor *cursor) {
    memset(cursor, 0, sizeof(Cursor));
}

void cursorInit(Cursor *cursor, float x0, float y0, float x_bias, float y_bias) {
    cursorReset(cursor);
    cursor->biasX = x_bias;
    cursor->biasY = y_bias;
    cursorSetPoint(cursor, x0, y0);
}

void cursorSetPoint(Cursor *cursor, float x_des, float y_des) {
    if(cursor->is_halt)return;
    float yaw_des, pitch_des;
    yaw_des = RAD_TO_ANGLE(atanf((float) x_des / 100));
    pitch_des = RAD_TO_ANGLE(-atanf((float) y_des / 100));
    angleSet(SERVO_YAW_PIN, yaw_des);
    angleSet(SERVO_PITCH_PIN, pitch_des);
    cursor->yaw = yaw_des;
    cursor->pitch = pitch_des;
    cursor->X = x_des;
    cursor->Y = y_des;
}

void cursorSetPointSport(Cursor *cursor, float x, float y, uint16 ms) {
    if(cursor->is_halt)return;
    cursor->sportX_des = x;
    cursor->sportY_des = y;
    cursor->sportX_step = (x - cursor->X) / ((float) ms / TIM_MS_PER_TICK);
    cursor->sportY_step = (y - cursor->Y) / ((float) ms / TIM_MS_PER_TICK);
    cursor->is_sporting = true;
}

void cursorSetAngle(Cursor *cursor, float yaw, float pitch) {
    if(cursor->is_halt)return;
    cursor->X = tanf(ANGLE_TO_RAD(yaw)) * 100;
    cursor->Y = tanf(ANGLE_TO_RAD(pitch)) * 100;
    cursor->yaw = yaw;
    cursor->pitch = pitch;
}

void cursorHandler(Cursor *cursor) {
    if (cursor->is_sporting == false && cursor->is_halt==true){
        if(cursor->timeStamp%200)  // 2ms
        {
            if(cursor->X!=global_X||cursor->Y!=global_Y){
                cursorSetPoint(cursor,global_X,global_Y);
                global_yaw = cursor->yaw;
                global_pitch = cursor->pitch;
            }
            if(cursor->yaw!=global_yaw||cursor->pitch!=global_pitch){
                cursorSetAngle(cursor,global_yaw,global_pitch);
                global_X = cursor->X;
                global_Y = cursor->Y;
            }
        }
    }
    float x_target, y_target;
    x_target = cursor->X;
    y_target = cursor->Y;
    if ((cursor->sportX_step > 0 && cursor->X < cursor->sportX_des) ||
        (cursor->sportX_step < 0 && cursor->X > cursor->sportX_des))
        x_target = cursor->X + cursor->sportX_step;
    if ((cursor->sportY_step > 0 && cursor->Y < cursor->sportY_des) ||
        (cursor->sportY_step < 0 && cursor->Y > cursor->sportY_des))
        y_target = cursor->Y + cursor->sportY_step;
    if (((cursor->sportX_step > 0 && cursor->X >= cursor->sportX_des) ||
         (cursor->sportX_step < 0 && cursor->X <= cursor->sportX_des) || cursor->sportX_step == 0) &&
        ((cursor->sportY_step > 0 && cursor->Y >= cursor->sportY_des) ||
         (cursor->sportY_step < 0 && cursor->Y <= cursor->sportY_des) || cursor->sportY_step == 0)) {
        x_target = cursor->sportX_des;
        y_target = cursor->sportY_des;
        cursor->is_sporting = false;
    }
    cursorSetPoint(cursor, x_target, y_target);
    cursor->timeStamp+=TIM_MS_PER_TICK;

}