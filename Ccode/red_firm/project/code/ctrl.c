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

paramType squarePoint[3][2] = {{14, 14},      // Up left x and y
                               {-14, 14},      // Up right x and y
                               {-14, -14}};     // Down right x and y
paramType teachCorner[3][2] = {{-41, 45},
                               {42, 45},
                               {43, -39}};

volatile int8_t servoCoordBackup[2000][2] = {0};    // [][1] Upper servo, [][0] Bottom servo
volatile int8_t servoCoord[2000][2] = {0};    // [][1] Upper servo, [][0] Bottom servo
uint16_t servoDuty[6][2] = {0};    // [][1] Upper servo, [][0] Bottom servo
//uint16_t servoDuty[2000][2] = {0};    // [][1] Upper servo, [][0] Bottom servo
float k1, k2, k3, k4, b1, b2, b3, b4;
float x, y;

paramType widthPerPixel = 0.60241;
paramType heightPerPixel = 0.595238;
paramType unit = 0.1;


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

//    servoDuty[cnt][1] = (uint32_t)squarePoint[0][1];
//    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];
//
//    servoDuty[cnt][1] = (uint32_t)squarePoint[1][1];
//    servoDuty[cnt++][0] = (uint32_t)squarePoint[1][0];
//
//    servoDuty[cnt][1] = (uint32_t)squarePoint[2][1];
//    servoDuty[cnt++][0] = (uint32_t)squarePoint[2][0];
//
//    servoDuty[cnt][1] = (uint32_t)squarePoint[2][1];
//    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];
//
//    servoDuty[cnt][1] = (uint32_t)squarePoint[0][1];
//    servoDuty[cnt++][0] = (uint32_t)squarePoint[0][0];
//    
//    servoDuty[cnt][1] = GetServoDuty(0);
//    servoDuty[cnt++][0] = GetServoDuty(0);
    
    servoCoordBackup[cnt][1] = (int8_t)teachCorner[0][1];
    servoCoordBackup[cnt++][0] = (int8_t)teachCorner[0][0];

    servoCoordBackup[cnt][1] = (int8_t)teachCorner[1][1];
    servoCoordBackup[cnt++][0] = (int8_t)teachCorner[1][0];

    servoCoordBackup[cnt][1] = (int8_t)teachCorner[2][1];
    servoCoordBackup[cnt++][0] = (int8_t)teachCorner[2][0];

    servoCoordBackup[cnt][1] = (int8_t)teachCorner[2][1];
    servoCoordBackup[cnt++][0] = (int8_t)teachCorner[0][0];

    servoCoordBackup[cnt][1] = (int8_t)teachCorner[0][1];
    servoCoordBackup[cnt++][0] = (int8_t)teachCorner[0][0];
    
    servoCoordBackup[cnt][1] = 0;
    servoCoordBackup[cnt++][0] = 0;

    memcpy(&servoCoord[0][0], &servoCoordBackup[0][0], sizeof(servoCoord));

    return cnt;
}

uint16_t GetLaserPoint()
{
    uint16_t cnt = 0;

    for (float i = (int16_t) cornerPoint[0][0]; i <= cornerPoint[1][0]; )
    {
        y = roundf(k1 * i + b1);
        x = roundf(i);
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
//        servoCoordBackup[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * y / 100.0f) * RAD_TO_DEGREE);
//        servoCoordBackup[cnt++][0] = GetBottomServoDuty(- atanf(widthPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        servoCoordBackup[cnt][1] = y;
        servoCoordBackup[cnt++][0] = x;
        i += unit;
    }
    for (float i = (int16_t) cornerPoint[1][1]; i >= cornerPoint[2][1]; )
    {
        if (isinf(k2))
            x = cornerPoint[1][0];
        else
            x = roundf((i - b2) / k2);
        y = roundf(i);
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
//        servoCoordBackup[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * i / 100.0f) * RAD_TO_DEGREE);
//        servoCoordBackup[cnt++][0] = GetBottomServoDuty(- atanf(widthPerPixel * x / 100.0f) * RAD_TO_DEGREE);
        servoCoordBackup[cnt][1] = y;
        servoCoordBackup[cnt++][0] = x;
        i -= unit;
    }
    for (float i = (int16_t) cornerPoint[2][0]; i >= cornerPoint[3][0]; )
    {
        y = roundf(k3 * i + b3);
        x = roundf(i);
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
//        servoCoordBackup[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * y / 100.0f) * RAD_TO_DEGREE);
//        servoCoordBackup[cnt++][0] = GetBottomServoDuty(- atanf(widthPerPixel * i / 100.0f) * RAD_TO_DEGREE);
        servoCoordBackup[cnt][1] = y;
        servoCoordBackup[cnt++][0] = x;
        i -= unit;
    }
    for (float i = (int16_t) cornerPoint[3][1]; i <= cornerPoint[0][1]; )
    {
        if (isinf(k4))
            x = cornerPoint[3][0];
        else
            x = roundf((i - b4) / k4);
        y = roundf(i);
//        vofaData[3] = x;
//        vofaData[2] = y;
//        VofaSendFrame();
//        servoCoordBackup[cnt][1] = GetUpServoDuty(atanf(heightPerPixel * i / 100.0f) * RAD_TO_DEGREE);
//        servoCoordBackup[cnt++][0] = GetBottomServoDuty(- atanf(widthPerPixel * x / 100.0f) * RAD_TO_DEGREE);
        servoCoordBackup[cnt][1] = y;
        servoCoordBackup[cnt++][0] = x;
        i += unit;
    }
    memcpy(servoCoord, servoCoordBackup, sizeof(servoCoord));
    return cnt;
}

void TeachCornerPointHandler(void)
{
    widthPerPixel = 50 / (teachCorner[1][0] - teachCorner[0][0]);
    heightPerPixel = 50 / (teachCorner[1][1] - teachCorner[2][1]);
}