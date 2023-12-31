#include "user_flash.h"


uint16_t flashBufIndex = 0;
uint8_t flashSecIndex = 63;
uint8_t flashPageIndex = 3;

uint16_t flashGPSBufIndex = 0;
uint8_t flashGPSSecIndex = 62;
uint8_t flashGPSPageIndex = 3;


/*!
 * @brief       Convert double data(8 Byte) into unsigned int data(4 Byte)
 *
 * @param       val     The object to be converted
 * @param       arr    Target uint32 array
 * @return      void
 *
 * @note        Use a "double" pointer to point to this array,
 *              or use memcpy function
 *              can convert int data back to double
 */
void DoubleToInt(const double *val, uint32_t *arr)
{
    memcpy(arr, val, 2 * sizeof(uint32_t));

}


/*!
 * @brief       Convert double data(8 Byte) into unsigned int data(4 Byte)
 *
 * @param       val     The object to be converted
 * @param       arr    Target uint32 array
 * @return      void
 */
void IntToDouble(double *val, const uint32_t *arr)
{
    memcpy(val, arr, 2 * sizeof(uint32_t));
}


void SaveToFlash(const int32_t *value)
{
    if (flashSecIndex == 0)
        return;

    if (flashBufIndex >= 256)
    {
        flash_write_page_from_buffer(flashSecIndex, flashPageIndex);
        flash_buffer_clear();
        if (flashPageIndex > 0)
        {
            // Change page automatically
            flashPageIndex--;
            flashBufIndex = 0;
        } else
        {
            // Change section automatically
            flashPageIndex = 3;
            flashBufIndex = 0;
            flashSecIndex--;
        }
    }
    flash_union_buffer[flashBufIndex].uint32_type = *value;
    flashBufIndex++;
}
void SaveToFlashWithConversion(const double *value)
{
    if (flashSecIndex == 0)
        return;

    uint32_t arr[2];

    if (flashBufIndex + 1 >= 256)
    {
        flash_write_page_from_buffer(flashSecIndex, flashPageIndex);
        flash_buffer_clear();
        if (flashPageIndex > 0)
        {
            // Change page automatically
            flashPageIndex--;
            flashBufIndex = 0;
        } else
        {
            // Change section automatically
            flashPageIndex = 3;
            flashBufIndex = 0;
            flashSecIndex--;
        }
    }

    DoubleToInt(value, arr);
    flash_union_buffer[flashBufIndex].uint32_type = arr[0];
    flash_union_buffer[++flashBufIndex].uint32_type = arr[1];
    flashBufIndex++;
}

void GPSSaveToFlashWithConversion(const double *value)
{
    if (flashGPSSecIndex == 0)
        return;

    uint32_t arr[2];

    if (flashGPSBufIndex + 1 >= 256)
    {
        flash_write_page_from_buffer(flashGPSSecIndex, flashGPSPageIndex);
        flash_buffer_clear();
        if (flashGPSPageIndex > 0)
        {
            // Change page automatically
            flashGPSPageIndex--;
            flashGPSBufIndex = 0;
        } else
        {
            // Change section automatically
            flashGPSPageIndex = 3;
            flashGPSBufIndex = 0;
            flashGPSSecIndex--;
        }
    }

    DoubleToInt(value, arr);
    flash_union_buffer[flashGPSBufIndex].uint32_type = arr[0];
    flash_union_buffer[++flashGPSBufIndex].uint32_type = arr[1];
    flashGPSBufIndex++;
}


void ReadFlash(int32_t *value)
{
    if (flashSecIndex == 0)
        return;

    if (flashBufIndex >= 256)
    {
        flash_buffer_clear();
        if (flashPageIndex > 0)
        {
            // Change page automatically
            flashPageIndex--;
            flashBufIndex = 0;
        } else
        {
            // Change section automatically
            flashPageIndex = 3;
            flashBufIndex = 0;
            flashSecIndex--;
        }
    }

    flash_read_page_to_buffer(flashSecIndex, flashPageIndex);

    *value = flash_union_buffer[flashBufIndex].int32_type;
    flashBufIndex++;
}
void ReadFlashWithConversion(double *value)
{
    if (flashSecIndex == 0)
        return;

    uint32_t arr[2];

    if (flashBufIndex + 1 >= 256)
    {
        flash_buffer_clear();
        if (flashPageIndex > 0)
        {
            // Change page automatically
            flashPageIndex--;
            flashBufIndex = 0;
        } else
        {
            // Change section automatically
            flashPageIndex = 3;
            flashBufIndex = 0;
            flashSecIndex--;
        }
    }
    flash_read_page_to_buffer(flashSecIndex, flashPageIndex);
    arr[0] = flash_union_buffer[flashBufIndex].uint32_type;
    arr[1] = flash_union_buffer[++flashBufIndex].uint32_type;
    IntToDouble(value, arr);
    flashBufIndex++;
}


void GPSReadFlashWithConversion(double *value)
{
    if (flashGPSSecIndex == 0)
        return;

    uint32_t arr[2];

    if (flashGPSBufIndex + 1 >= 256)
    {
        flash_buffer_clear();
        if (flashGPSPageIndex > 0)
        {
            // Change page automatically
            flashGPSPageIndex--;
            flashGPSBufIndex = 0;
        } else
        {
            // Change section automatically
            flashGPSPageIndex = 3;
            flashGPSBufIndex = 0;
            flashGPSSecIndex--;
        }
    }
    flash_read_page_to_buffer(flashGPSSecIndex, flashGPSPageIndex);
    arr[0] = flash_union_buffer[flashGPSBufIndex].uint32_type;
    arr[1] = flash_union_buffer[++flashGPSBufIndex].uint32_type;
    IntToDouble(value, arr);
    flashGPSBufIndex++;
}


void FlashOperationEnd()
{
    flash_write_page_from_buffer(flashSecIndex, flashPageIndex);
    flash_buffer_clear();
    flashBufIndex = 0;
    flashSecIndex = 63;
    flashPageIndex = 3;
}

void GPSFlashOperationEnd()
{
    flash_write_page_from_buffer(flashGPSSecIndex, flashGPSPageIndex);
    flash_buffer_clear();
    flashGPSBufIndex = 0;
    flashGPSSecIndex = 62;
    flashGPSPageIndex = 3;
}
