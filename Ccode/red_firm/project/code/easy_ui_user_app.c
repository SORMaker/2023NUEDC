/*!
 * Copyright (c) 2023, ErBW_s
 * All rights reserved.
 *
 * @author  Baohan
 */

#include "easy_ui_user_app.h"

// Pages
EasyUIPage_t pageMain, pageTeach, pageSetting;

// Items
EasyUIItem_t titleMain, itemTeach, itemSetting, itemRunSquare, itemRun;
EasyUIItem_t titlePreset, itemPr1, itemPr2, itemPr3;
EasyUIItem_t titleSpdPID, itemSpdKp, itemSpdKi, itemSpdKd, itemSpdTarget, itemSpdInMax, itemSpdErrMax, itemSpdErrMin;
EasyUIItem_t titleDirPID, itemDirKp, itemDirKi, itemDirKd, itemDirInMax, itemDirErrMax, itemDirErrMin;
EasyUIItem_t itemExp, itemTh;
EasyUIItem_t titleEle, itemLoop, itemCross, itemLeftR, itemRightR, itemBreak, itemObstacle, itemGarage;
EasyUIItem_t titleSetting, itemColor, itemListLoop, itemBuzzer, itemSave, itemReset, itemAbout;

//paramType
static uint8_t teachState = 0;
extern uint16_t maxIndex;
extern uint8_t receiveSuccess;
extern void pwm_set_servo_duty(pwm_channel_enum pin, uint32 duty);

void EventSquareLoop(EasyUIItem_t *item)
{
    BufferFinish = 2;
    maxIndex = LaserGoSquare();
    pit_enable(TIM2_PIT);

    if (opnExit)
    {
        pit_disable(TIM2_PIT);
        BufferFinish = 1;
        functionIsRunning = false;
        EasyUIBackgroundBlur();
    }
}

void EventRunLoop(EasyUIItem_t *item)
{
    BufferFinish = 2;
    pit_enable(TIM2_PIT);
//    if (receiveSuccess)
//    {
//        GetRectLine();
//        maxIndex = GetLaserPoint();
//        functionIsRunning = false;
//        EasyUIBackgroundBlur();
//    }

    if (opnExit)
    {
        pit_disable(TIM2_PIT);
        BufferFinish = 1;
        functionIsRunning = false;
        EasyUIBackgroundBlur();
    }
}


void CornerUpLeftHandler(void)
{
    EasyUIDisplayStr(0, 0, "Up left Corner X and Y:");
    EasyUIDisplayFloat(0, 1 * 10, squarePoint[0][0], 4, 0);
    EasyUIDisplayFloat(0, 2 * 10, squarePoint[0][1], 4, 0);
    EasyUIDisplayFloat(5 * 8, 1 * 10, rxData.cx, 4, 0);
    EasyUIDisplayFloat(5 * 8, 2 * 10, rxData.cy, 4, 0);

    EasyUIDisplayStr(0, 3 * 10, "Width / Height per pixel:");
    EasyUIDisplayFloat(0, 4 * 10, widthPerPixel, 4, 6);
    EasyUIDisplayFloat(0, 5 * 10, heightPerPixel, 4, 6);

    pwm_set_duty(TIM4_PWM_MAP1_CH1_D12, GetUpServoDuty(squarePoint[0][1]));
    pwm_set_duty(TIM4_PWM_MAP1_CH3_D14, GetBottomServoDuty(squarePoint[0][0]));

    if (opnUp)
        squarePoint[0][1] += 1;
    if (opnDown)
        squarePoint[0][1] -= 1;

    if (opnForward)
        squarePoint[0][0] -= 1;
    if (opnBackward)
        squarePoint[0][0] += 1;

    if (opnEnter)
    {
        teachCorner[0][0] = rxData.cx;
        teachCorner[0][1] = rxData.cy;
        teachState++;
    }

    TeachCornerPointHandler();
}

void CornerUpRightHandler(void)
{
    EasyUIDisplayStr(0, 0, "Up right Corner X and Y:");
    EasyUIDisplayFloat(0, 1 * 10, squarePoint[1][0], 4, 0);
    EasyUIDisplayFloat(0, 2 * 10, squarePoint[1][1], 4, 0);
    EasyUIDisplayFloat(5 * 8, 1 * 10, rxData.cx, 4, 0);
    EasyUIDisplayFloat(5 * 8, 2 * 10, rxData.cy, 4, 0);

    EasyUIDisplayStr(0, 3 * 10, "Width / Height per pixel:");
    EasyUIDisplayFloat(0, 4 * 10, widthPerPixel, 4, 6);
    EasyUIDisplayFloat(0, 5 * 10, heightPerPixel, 4, 6);

    pwm_set_duty(TIM4_PWM_MAP1_CH1_D12, GetUpServoDuty(squarePoint[1][1]));
    pwm_set_duty(TIM4_PWM_MAP1_CH3_D14, GetBottomServoDuty(squarePoint[1][0]));

    if (opnUp)
        squarePoint[1][1] += 1;
    if (opnDown)
        squarePoint[1][1] -= 1;

    if (opnForward)
        squarePoint[1][0] -= 1;
    if (opnBackward)
        squarePoint[1][0] += 1;

    if (opnEnter)
    {
        teachCorner[1][0] = rxData.cx;
        teachCorner[1][1] = rxData.cy;
        teachState++;
    }

    TeachCornerPointHandler();
}

void CornerDownRightHandler(void)
{
    EasyUIDisplayStr(0, 0, "Down right Corner X and Y:");
    EasyUIDisplayFloat(0, 1 * 10, squarePoint[2][0], 4, 0);
    EasyUIDisplayFloat(0, 2 * 10, squarePoint[2][1], 4, 0);
    EasyUIDisplayFloat(5 * 8, 1 * 10, rxData.cx, 4, 0);
    EasyUIDisplayFloat(5 * 8, 2 * 10, rxData.cy, 4, 0);

    EasyUIDisplayStr(0, 3 * 10, "Width / Height per pixel:");
    EasyUIDisplayFloat(0, 4 * 10, widthPerPixel, 4, 6);
    EasyUIDisplayFloat(0, 5 * 10, heightPerPixel, 4, 6);

    pwm_set_duty(TIM4_PWM_MAP1_CH1_D12, GetUpServoDuty(squarePoint[2][1]));
    pwm_set_duty(TIM4_PWM_MAP1_CH3_D14, GetBottomServoDuty(squarePoint[2][0]));

    if (opnUp)
        squarePoint[2][1] += 1;
    if (opnDown)
        squarePoint[2][1] -= 1;

    if (opnForward)
        squarePoint[2][0] -= 1;
    if (opnBackward)
        squarePoint[2][0] += 1;

    if (opnEnter)
    {
        teachCorner[2][0] = rxData.cx;
        teachCorner[2][1] = rxData.cy;
        teachState = 0;
    }

    TeachCornerPointHandler();
}


/*!
 * @brief   Custom page of teach
 *
 * @param   page    Useless param
 * @return  void
 */
void PageTeach(EasyUIPage_t *page)
{
//    pit_disable(TIM2_PIT);
    switch (teachState)
    {
    case 0:
        CornerUpLeftHandler();
        break;
    case 1:
        CornerUpRightHandler();
        break;
    case 2:
        CornerDownRightHandler();
    default:
        break;
    }
}



//extern paramType motor1Speed, motor2Speed;
//extern bool motor1Dir, motor2Dir;

paramType motor1Speed = 5000, motor2Speed = 5000;
bool motor1Dir = true, motor2Dir = true;

void MenuInit()
{
    EasyUIAddPage(&pageMain, PAGE_LIST);
    EasyUIAddPage(&pageTeach, PAGE_CUSTOM, PageTeach);
    EasyUIAddPage(&pageSetting, PAGE_LIST);

    // Page Main
    EasyUIAddItem(&pageMain, &titleMain, "[Main]", ITEM_PAGE_DESCRIPTION);
    EasyUIAddItem(&pageMain, &itemRunSquare, "Run square", ITEM_MESSAGE, "Running...", EventSquareLoop);
    EasyUIAddItem(&pageMain, &itemRun, "Run", ITEM_MESSAGE, "Running...", EventRunLoop);
    EasyUIAddItem(&pageMain, &itemTeach, "Teach mode", ITEM_JUMP_PAGE, pageTeach.id);
    EasyUIAddItem(&pageMain, &itemSetting, "Settings", ITEM_JUMP_PAGE, pageSetting.id);

    // Page Teach

    // Page setting
    EasyUIAddItem(&pageSetting, &titleSetting, "[Settings]", ITEM_PAGE_DESCRIPTION);
    EasyUIAddItem(&pageSetting, &itemColor, "Reversed Color", ITEM_SWITCH, &reversedColor);
    EasyUIAddItem(&pageSetting, &itemListLoop, "List Loop", ITEM_SWITCH, &listLoop);
    EasyUIAddItem(&pageSetting, &itemSave, "Save Settings", ITEM_MESSAGE, "Saving...", EasyUIEventSaveSettings);
    EasyUIAddItem(&pageSetting, &itemReset, "Reset Settings", ITEM_MESSAGE, "Resetting...", EasyUIEventResetSettings);
}