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

// *************************** 例程测试说明 ***************************
// 1.核心板烧录完成本例程，完成上电
//
// 2.可以看到核心板上蓝色 LED 闪烁
//
// 3.可以通过在线调试的方式查看gpio_status变量 来查看当前D0引脚的状态


uint8 gpio_status;
#define LED1_PIN E2
#define LED2_PIN E9
#define INPUT_PIN  B2
int main(void)
{
    clock_init(SYSTEM_CLOCK_120M);      // 初始化芯片时钟 工作频率为 120MHz
    debug_init();                       // 务必保留，本函数用于初始化MPU 时钟 调试串口

    // 此处编写用户代码 例如外设初始化代码等

    // 初始化GPIO B9 为输出 默认输出低电平
    gpio_init(LED1_PIN, GPO, 0, GPO_PUSH_PULL);
    gpio_init(LED2_PIN, GPO, 0, GPO_PUSH_PULL);

    // 初始化GPIO D0 D1 为输入引脚
    gpio_init(INPUT_PIN, GPI, 0, GPI_PULL_UP);

    // 此处编写用户代码 例如外设初始化代码等

    while(1)
    {
        gpio_set_level(LED1_PIN, 1);                // 设置引脚电平为高电平
        system_delay_ms(100);
        gpio_set_level(LED1_PIN, 0);                // 设置引脚电平为低电平
        system_delay_ms(100);

        gpio_toggle_level(LED2_PIN);                // 翻转引脚电平
        system_delay_ms(100);

        gpio_status = gpio_get_level(INPUT_PIN);      // 获取引脚电平
        system_delay_ms(100);
    }
}






