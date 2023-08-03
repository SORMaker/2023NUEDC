/*!
 * @file    ctrl.c
 * @author  Baohan
 * @date    2022/10/09
 */

#include "ctrl.h"

// Test array
//float cornerPoint[4][2] = {{50 - 111, 111 - 10},
//                           {200 - 111, 111 - 30},
//                           {180 - 111, 111 - 210},
//                           {30 - 111, 111 - 180}};
//float cornerPoint[4][2] = {{20 - 111, 111 - 20},
//                           {200 - 111, 111 - 20},
//                           {200 - 111, 111 - 200},
//                           {20 - 111, 111 - 200}};

float cornerPoint[4][2] = {0};

paramType squarePoint[3][2] = {{850, 870},      // Up left x and y
                               {690, 865},      // Up right x and y
                               {700, 715}};     // Down right x and y
paramType teachCorner[3][2] = {0};

uint16_t servoDuty[2000][2] = {0};    // [][1] Upper servo, [][0] Bottom servo
float k1, k2, k3, k4, b1, b2, b3, b4;
float x, y;

paramType widthPerPixel = 0.26786;
paramType heightPerPixel = 0.26786;
paramType unit = 0.2;


void GetRectLine()
{
    k1 = (cornerPoint[0][1] - cornerPoint[1][1]) / (cornerPoint[0][0] - cornerPoint[1][0]);
    b1 = cornerPoint[0][1] - k1 * cornerPoint[0][0];

    k2 = (cornerPoint[1][1] - cornerPoint[2][1]) / (cornerPoint[1][0] - cornerPoint[2][0]);
    b2 = cornerPoint[1][1] - k2 * cornerPoint[1][0];

    k3 = (cornerPoint[2][1] - cornerPoint[3][1]) / (cornerPoint[2][0] - cornerPoint[3][0]);
    b3 = cornerPoint[2][1] - k3 * cornerPoint[2][0];

    k4 = (cornerPoint[3][1] - cornerPoint[0][1]) / (cornerPoint[3][0] - cornerPoint[0][0]);
    b4 = cornerPoint[3][1] - k4 * cornerPoint[3][0];
}

uint16_t LaserGoSquare(void)
{
    uint16_t cnt = 0;

    servoDuty[cnt][1] = (uint32_t)squarePoint[0][1];
    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];

    servoDuty[cnt][1] = (uint32_t)squarePoint[1][1];
    servoDuty[cnt++][0] = (uint32_t)squarePoint[1][0];

    servoDuty[cnt][1] = (uint32_t)squarePoint[2][1];
    servoDuty[cnt++][0] = (uint32_t)squarePoint[2][0];

    servoDuty[cnt][1] = (uint32_t)squarePoint[2][1];
    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];

    servoDuty[cnt][1] = (uint32_t)squarePoint[0][1];
    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];

    return cnt;
}

uint16_t GetLaserPoint()
{
    uint16_t cnt = 0;

    for (float i = (int16_t) cornerPoint[0][0]; i <= cornerPoint[1][0]; )
    {
        y = (int16_t) (k1 * i + b1);
        x = i;
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
        servoDuty[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * y / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][0] = GetBottomServoDuty( - atanf(widthPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        i += unit;
    }
    for (float i = (int16_t) cornerPoint[1][1]; i >= cornerPoint[2][1]; )
    {
        if (isinf(k2))
            x = cornerPoint[1][0];
        else
            x = (int16_t) ((i - b2) / k2);
        y = i;
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
        servoDuty[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][0] = GetBottomServoDuty( - atanf(widthPerPixel * x / 100.0f) * RAD_TO_DEGREE);
        i -= unit;
    }
    for (float i = (int16_t) cornerPoint[2][0]; i >= cornerPoint[3][0]; )
    {
        y = (int16_t) (k3 * i + b3);
        x = i;
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
        servoDuty[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * y / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][0] = GetBottomServoDuty( - atanf(widthPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        i -= unit;
    }
    for (float i = (int16_t) cornerPoint[3][1]; i <= cornerPoint[0][1]; )
    {
        if (isinf(k4))
            x = cornerPoint[3][0];
        else
            x = (int16_t) ((i - b4) / k4);
        y = i;
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
        servoDuty[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        servoDuty[cnt++][0] = GetBottomServoDuty( - atanf(widthPerPixel * x / 100.0f) * RAD_TO_DEGREE);
        i += unit;
    }
    return cnt;
}

void TeachCornerPointHandler(void)
{
    widthPerPixel = (teachCorner[1][0] - teachCorner[0][0]) / 50;
    heightPerPixel = (teachCorner[1][1] - teachCorner[2][1]) / 50;
}