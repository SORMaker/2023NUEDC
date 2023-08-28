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
#include "inc_all.h"

void packReceiveHandle(uint8_t *d, uint16_t s) {
    rxData.cx = (d[1] << 8) | d[0];
    rxData.cy = ((d[3] << 8) | d[2]);

    rxData.cx-=SOLID_BIAS_X;
    rxData.cy-=SOLID_BIAS_Y;
//    if(rxData.cx!=0||rxData.cy!=0)
//        beepTime=100;
//    printf("%d %d\n", rxData.cx, rxData.cy);
}

void packSendHandle(uint8_t *d, uint16_t s) {
    uart_write_buffer(UART_7, d, s);
//    for (int i = 0; i < s; i++)
//    {
//        printf("%c\n",i);
//    }
}
upacker_inst myPack;
upacker_inst_t myPackPtr = &myPack;
int main(void) {
    clock_init(SYSTEM_CLOCK_120M);      // 初始化芯片时钟 工作频率为 120MHz
    debug_init();                       // 务必保留，本函数用于初始化MPU 时钟 调试串口

    uart_init(UART_7, 115200, UART7_MAP3_TX_E12, UART7_MAP3_RX_E13);


    upacker_init(myPackPtr, &packReceiveHandle, &packSendHandle);
    // 此处编写用户代码 例如外设初始化代码等
    gpio_init(A8,GPI,1,GPI_PULL_UP);
    MenuInit();
    EasyUIInit(1);
    pwmInit();
    pidAllInit();
    BuzzerInit();
    cursorInit(&global_cursor, 0, 0, 0, 0, 0, 0);
    // 此处编写用户代码 例如外设初始化代码等
    taskTimAllInit();
    cursorResume(&global_cursor);
    system_delay_ms(2000);
    uart_rx_interrupt(UART_7, ENABLE);
    while (1) {
        EasyUI(20);
        // 此处编写需要循环执行的代码

//        system_delay_ms(500);
        // 此处编写需要循环执行的代码
    }
}

