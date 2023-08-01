/**
  ******************************************************************************
  * @file    drv_packer.c
  * @author  zpw
  * @version V1.0
  * @date    
  * @brief   閾捐矾灞傞�氳鍗忚
  ******************************************************************************
  * @attention
  *          閾捐矾灞傞�氳鍗忚锛屾暟鎹皝鍖呰В鍖�
  ******************************************************************************
  */
#include "upacker.h"

rx_data_st rxData = {54,100,11.9};
uint8_t Buffer[MAX_PACK_SIZE] = {0};
uint8_t BufferFinish = 0;

static uint8_t frame_decode(upacker_inst_t packer, uint8_t d);
static uint8_t frame_encode(upacker_inst_t packer, uint8_t *data, uint16_t size);

/**
 * @brief  浣跨敤鍔ㄦ�佸唴瀛樻椂闇�瑕佸垵濮嬪寲
 * @note   size pack缂撳瓨鐨勯暱搴︼紝澶т簬鏈�澶х殑鏁版嵁鍖呴暱搴﹀氨琛�,浣跨敤PACK_SIZE
            鏃爎tos鏈�濂界敤闈欐�佸唴瀛�,涓嶇劧瑕佹敼heap
 * @param  *cmd_packer: 
 * @param  *handler: 
 * @retval None
 */
int upacker_init(upacker_inst_t packer, PACKER_CB h, PACKER_CB s)
{

#if USE_DYNAMIC_MEM
    packer->data = (uint8_t *)UP_MALLOC(MAX_PACK_SIZE);
    if (!packer->data)
    {
        return -1;
    }
#endif

    packer->cb = h;
    packer->send = s;
    return 0;
}

/**
 * @brief  瑙ｅ寘杈撳叆鏁版嵁
 * @note   
 * @param  cmd_packer: 
 * @param  *buff: 
 * @param  size: 
 * @retval None
 */
void upacker_unpack(upacker_inst_t packer, uint8_t *buff, uint16_t size)
{
    for (uint16_t i = 0; i < size; i++)
    {
        if (frame_decode(packer, buff[i]))
        {
            //瑙ｆ瀽鎴愬姛,鍥炶皟澶勭悊
            packer->cb(packer->data, packer->flen);
        }
    }
}

/**
 * @brief  灏佸寘鏁版嵁骞跺彂閫�
 * @note   
 * @param  *packer: 
 * @param  *buff: 
 * @param  size: 
 * @retval None
 */
void upacker_pack(upacker_inst_t packer, uint8_t *buff, uint16_t size)
{
    frame_encode(packer, buff, size);
}

static uint8_t frame_decode(upacker_inst_t packer, uint8_t d)
{

    if (packer->state == 0 && d == STX_L)
    {
        packer->state = 1;
        packer->calc = 0x55;
    }
    else if (packer->state == 1)
    {
        packer->flen = d;
        packer->calc ^= d;
        packer->state = 2;
    }
    else if (packer->state == 2)
    {
        //闀垮害淇℃伅
        packer->flen |= (uint16_t)d << 8;
        packer->calc ^= d & 0x3F;

        //鏁版嵁鍖呰秴闀垮緱鎯呭喌涓嬬洿鎺ヤ涪鍖�
        if ((packer->flen & 0x3FFF) > MAX_PACK_SIZE)
        {
            packer->state = 0;
        }
        packer->state = 3;
        packer->cnt = 0;
    }
    else if (packer->state == 3)
    {
        //header鏍￠獙
        uint8_t hc = ((d & 0x03) << 4) | (packer->flen & 0xC000) >> 12;

        packer->check = d;
        if (hc != (packer->calc & 0X3C))
        {
            packer->state = 0;
            return 0;
        }
        packer->state = 4;
        packer->flen &= 0x3FFF;
    }
    else if (packer->state == 4)
    {
        packer->data[packer->cnt++] = d;
        packer->calc ^= d;

        if (packer->cnt == packer->flen)
        {
            packer->state = 0;

            //鎺ユ敹瀹岋紝妫�鏌heck
            if ((packer->calc & 0xFC) == (packer->check & 0XFC))
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
    }
    else
    {
        packer->state = 0;
    }
    return 0;
}

static uint8_t frame_encode(upacker_inst_t packer, uint8_t *data, uint16_t size)
{

    uint8_t tmp[4] = {0};
    uint8_t crc = 0;

    if (size > 16384)
    {
        return 0;
    }

    tmp[0] = 0x55;
    tmp[1] = size & 0xff;
    tmp[2] = (size >> 8) & 0x3f; //浣�14浣嶇敤鏉ヤ繚瀛榮ize;header鏍￠獙4浣�
    crc = tmp[0] ^ tmp[1] ^ tmp[2];
    tmp[2] |= (crc & 0x0C) << 4; //tmp[2][7:6]淇濆瓨header妫�楠孾3:2]
    tmp[3] = 0x03 & (crc >> 4);  //tmp[3][1:0]淇濆瓨header鏍￠獙[5:4]
    for (int i = 0; i < size; i++)
    {
        crc ^= data[i];
    }

    tmp[3] |= (crc & 0xfc); //tmp[3][7:2]淇濆瓨data check[7:2]
    packer->send(tmp, 4);
    packer->send(data, size);

    return 1;
}
