/*!
 * Copyright (c) 2023, ErBW_s
 * All rights reserved.
 * 
 * @author  Baohan
 */

#include "vofa.h"

float vofaData[CHANNEL_NUM] = {0};

enum Endian
{
    Big_Endian,
    Little_Endian
};

/*!
 * @brief   Check for Little-Endian or Big-Endian
 *
 * @param   void
 * @return  0 for Big_Endian
 *          1 for Little_Endian
 */
int CheckEndianness()
{
    unsigned int x = 1;
    char *c = (char *) &x;
    return (int) *c;
}


/*!
 * @brief   Vofa send data using JustFloat
 *
 * @param   void
 * @return  void
 */
void VofaSendFrame()
{
    unsigned char vofaTail[4] = {0x00, 0x00, 0x80, 0x7F};

    // More steps for Big-Endian
    if (CheckEndianness() == Big_Endian)
    {
        vofaTail[0] = 0x7F;
        vofaTail[1] = 0x80;
        vofaTail[2] = 0x00;
        vofaTail[3] = 0x00;

        float temp;

        for (int i = 0; i < CHANNEL_NUM * sizeof(float); i += 2)
        {
            temp = ((uint8_t *) vofaData)[i];
            ((uint8_t *) vofaData)[i] = ((uint8_t *) vofaData)[i + 1];
            ((uint8_t *) vofaData)[i + 1] = (uint8_t) temp;
        }
    }

    uart_write_buffer(UART_3, (uint8_t *) vofaData, CHANNEL_NUM * sizeof(float));
    uart_write_buffer(UART_3, (uint8_t *) vofaTail, 4);
}