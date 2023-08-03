/*********************************************************************************************************************
* CH32V307VCT6 Opensourec Library 即（CH32V307VCT6 开源库）是一个基于官方 SDK 接口的第三方开源库
* Copyright (c) 2022 SEEKFREE 逐飞科技
*
* 本文件是CH32V307VCT6 开源库的一部分
*
* CH32V307VCT6 开源库 是免费软件
* 您可以根据自由软件基金会发布的 GPL（GNU General Public License，即 GNU通用公共许可证）的条款
* 即 GPL 的第3版（即 GPL3.0）或（您选择的）任何后来的版本，重新发布和/或修改它
*
* 本开源库的发布是希望它能发挥作用，但并未对其作任何的保证
* 甚至没有隐含的适销性或适合特定用途的保证
* 更多细节请参见 GPL
*
* 您应该在收到本开源库的同时收到一份 GPL 的副本
* 如果没有，请参阅<https://www.gnu.org/licenses/>
*
* 额外注明：
* 本开源库使用 GPL3.0 开源许可证协议 以上许可申明为译文版本
* 许可申明英文版在 libraries/doc 文件夹下的 GPL3_permission_statement.txt 文件中
* 许可证副本在 libraries 文件夹下 即该文件夹下的 LICENSE 文件
* 欢迎各位使用并传播本程序 但修改内容时必须保留逐飞科技的版权声明（即本声明）
*
* 文件名称          main
* 公司名称          成都逐飞科技有限公司
* 版本信息          查看 libraries/doc 文件夹内 version 文件 版本说明
* 开发环境          MounRiver Studio V1.8.1
* 适用平台          CH32V307VCT6
* 店铺链接          https://seekfree.taobao.com/
*
* 修改记录
* 日期                                      作者                             备注
* 2022-09-15        大W            first version
********************************************************************************************************************/
#include "zf_common_headfile.h"

uint8_t receiveSuccess = 1;

void packReceiveHandle(uint8_t *d, uint16_t s)
{
    rxData.cx = (d[1] << 8) | d[0];
    rxData.cy =  ((d[3] << 8)| d[2]);
    cornerPoint[0][0] = (d[5]<<8 | d[4]) - FRAME_WIDTH / 2 - 1;
    cornerPoint[0][1] = FRAME_HEIGHT / 2 - 1 - (d[7]<<8 | d[6]);
    cornerPoint[1][0] = (d[9]<<8 | d[8]) - FRAME_WIDTH / 2 - 1;
    cornerPoint[1][1] = FRAME_HEIGHT / 2 - 1 - (d[11]<<8 | d[10]);
    cornerPoint[2][0] = (d[13]<<8 | d[12]) - FRAME_WIDTH / 2 - 1;
    cornerPoint[2][1] = FRAME_HEIGHT / 2 - 1 - (d[15]<<8 | d[14]);
    cornerPoint[3][0] = (d[17]<<8 | d[16]) - FRAME_WIDTH / 2 - 1;
    cornerPoint[3][1] = FRAME_HEIGHT / 2 - 1 - (d[19]<<8 | d[18]);
    receiveSuccess = d[20];
    printf("%d %d %d %d %d %d %d %d %d %d %d\n",rxData.cx,rxData.cy ,
           (d[5]<<8 | d[4]),
           (d[5]<<8 | d[4]),
           (d[9]<<8 | d[8]),
           (d[11]<<8 | d[10]),
           (d[13]<<8 | d[12]),
           (d[15]<<8 | d[14]),
           (d[17]<<8 | d[16]),
           (d[19]<<8 | d[18]), d[20]);
}

void packSendHandle(uint8_t *d, uint16_t s)
{
    uart_write_buffer(UART_7, d, s);
//    for (int i = 0; i < s; i++)
//    {
//        printf("%c\n",i);
//    }
}

void pwm_set_servo_duty(pwm_channel_enum pin, uint32 duty)
{
    duty = Limitation(duty, (SERVO_MID-SERVO_DUTY_MAX), (SERVO_MID + SERVO_DUTY_MAX));
    pwm_set_duty(pin, duty);
}

int main (void)
{
    clock_init(SYSTEM_CLOCK_120M);                                              // 初始化芯片时钟 工作频率为 144MHz
    debug_init();                                                               // 初始化默认 Debug UART

    MenuInit();
    EasyUIInit(1);
//    vofaData[0] = cornerPoint[0][0];
//    vofaData[1] = cornerPoint[0][1];
//    VofaSendFrame();
//    vofaData[0] = cornerPoint[1][0];
//    vofaData[1] = cornerPoint[1][1];
//    VofaSendFrame();
//    vofaData[0] = cornerPoint[2][0];
//    vofaData[1] = cornerPoint[2][1];
//    VofaSendFrame();
//    vofaData[0] = cornerPoint[3][0];
//    vofaData[1] = cornerPoint[3][1];
//    VofaSendFrame();

    uart_init(UART_7, 115200, UART7_MAP3_TX_E12, UART7_MAP3_RX_E13);
    upacker_inst myPack;
    upacker_inst_t myPackPtr = &myPack;
    upacker_init(myPackPtr,&packReceiveHandle,&packSendHandle);
    uart_rx_interrupt(UART_7,ENABLE);

    system_delay_ms(500);

    pwm_init(TIM4_PWM_MAP1_CH1_D12, SERVO_FREQ, SERVO_UP_MID);          // Upper servo
    pwm_init(TIM4_PWM_MAP1_CH3_D14, SERVO_FREQ, SERVO_BOTTOM_MID);      // Bottom servo
    system_delay_ms(500);
//    BuzzerInit();
//    beepTime = 100;

//    system_delay_ms(2000);

    EasyUITransitionAnim();
    pit_ms_init(TIM1_PIT, 10);
    pit_ms_init(TIM2_PIT, 10);
    pit_disable(TIM2_PIT);
    extern uint16_t maxIndex;

    while(1)
    {
//        pwm_set_duty(TIM4_PWM_MAP1_CH1_D12, 00);
        if(BufferFinish == 1)
        {
            upacker_unpack(myPackPtr,Buffer,sizeof(Buffer));
//            upacker_pack(myPackPtr,(uint8_t*)&rxData,sizeof(rxData));
            BufferFinish = 0;
            uart_rx_interrupt(UART_7,ENABLE);
        }
        if (receiveSuccess)
        {
            GetRectLine();
            maxIndex = GetLaserPoint();
        }
        EasyUI(20);
//        system_delay_ms(20);
    }
}