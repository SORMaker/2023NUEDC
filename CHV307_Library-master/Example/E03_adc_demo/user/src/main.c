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

// *************************** 例程硬件连接说明 ***************************
// 使用逐飞科技 WCH-LINK 调试下载器连接
//      直接将下载器正确连接在核心板的调试下载接口即可
//
// 使用 USB-TTL 模块连接
//      模块管脚            单片机管脚
//      USB-TTL-RX          查看 zf_common_debug.h 文件中 DEBUG_UART_TX_PIN 宏定义的引脚 默认 B10
//      USB-TTL-TX          查看 zf_common_debug.h 文件中 DEBUG_UART_RX_PIN 宏定义的引脚 默认 B11
//      USB-TTL-GND         核心板电源地 GND
//      USB-TTL-3V3         核心板 3V3 电源

// *************************** 例程测试说明 ***************************
// 1.核心板烧录完成本例程，单独使用核心板与调试下载器或者 USB-TTL 模块，在断电情况下完成连接
//
// 2.将调试下载器或者 USB-TTL 模块连接电脑，完成上电
//
// 3.电脑上使用串口助手打开对应的串口，串口波特率为 zf_common_debug.h 文件中 DEBUG_UART_BAUDRATE 宏定义 默认 115200，核心板按下复位按键
//
// 4.可以在串口助手上看到如下串口信息：
//      ADC channel 1 convert data is x.
//      ...
//      ADC channel 1 mean filter convert data is x.
//      ...
//
// 5.将 ADC_CHANNELx 宏定义对应的引脚分别接到 3V3/GND 再对应的信息会看到数据变化
//
// 如果发现现象与说明严重不符 请参照本文件最下方 例程常见问题说明 进行排查


// **************************** 代码区域 ****************************
#define CHANNEL_NUMBER          (4)

#define ADC_CHANNEL1            (ADC1_IN7_A7)
#define ADC_CHANNEL2            (ADC1_IN9_B1)
#define ADC_CHANNEL3            (ADC1_IN10_C0)
#define ADC_CHANNEL4            (ADC1_IN11_C1)

uint8 channel_index = 0;
adc_channel_enum channel_list[CHANNEL_NUMBER] =
{
    ADC_CHANNEL1, ADC_CHANNEL2, ADC_CHANNEL3, ADC_CHANNEL4,
};



int main(void)
{
    clock_init(SYSTEM_CLOCK_120M);      // 初始化芯片时钟 工作频率为 120MHz
    debug_init();                       // 务必保留，本函数用于初始化MPU 时钟 调试串口

    // 此处编写用户代码 例如外设初始化代码等
    adc_init(ADC_CHANNEL1, ADC_12BIT);                                          // 初始化对应 ADC 通道为对应精度
    adc_init(ADC_CHANNEL2, ADC_12BIT);                                          // 初始化对应 ADC 通道为对应精度
    adc_init(ADC_CHANNEL3, ADC_10BIT);                                           // 初始化对应 ADC 通道为对应精度
    adc_init(ADC_CHANNEL4, ADC_8BIT);                                           // 初始化对应 ADC 通道为对应精度

                                                                                // 这里你会发现输出全是 8bit 精度
                                                                                // 因为这都是同一个 ADC 模块的引脚
                                                                                // 所以会以最后一个初始化精度为准
    // 此处编写用户代码 例如外设初始化代码等

    while(1)
    {
        // 此处编写需要循环执行的代码
        for(channel_index = 0; channel_index < CHANNEL_NUMBER; channel_index ++)
        {
            printf(
                "ADC channel %d convert data is %d.\r\n",
                channel_index + 1,
                adc_convert(channel_list[channel_index]));                      // 循环输出单次转换结果
        }
        system_delay_ms(1000);

        for(channel_index = 0; channel_index < CHANNEL_NUMBER; channel_index ++)
        {
            printf(
                "ADC channel %d mean filter convert data is %d.\r\n",
                channel_index + 1,
                adc_mean_filter_convert(channel_list[channel_index], 10));      // 循环输出 10 次均值滤波转换结果
        }
        system_delay_ms(1000);
        // 此处编写需要循环执行的代码
    }
}
// **************************** 代码区域 ****************************

// *************************** 例程常见问题说明 ***************************
// 遇到问题时请按照以下问题检查列表检查
//
// 问题1：串口没有数据
//      查看串口助手打开的是否是正确的串口，检查打开的 COM 口是否对应的是调试下载器或者 USB-TTL 模块的 COM 口
//      如果是使用逐飞科技 WCH-LINK 调试下载器连接，那么检查下载器线是否松动，检查核心板串口跳线是否已经焊接，串口跳线查看核心板原理图即可找到
//      如果是使用 USB-TTL 模块连接，那么检查连线是否正常是否松动，模块 TX 是否连接的核心板的 RX，模块 RX 是否连接的核心板的 TX
//
// 问题2：串口数据乱码
//      查看串口助手设置的波特率是否与程序设置一致，程序中 zf_common_debug.h 文件中 DEBUG_UART_BAUDRATE 宏定义为 debug uart 使用的串口波特率





