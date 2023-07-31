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
// 核心板正常供电即可 无需额外连接


// *************************** 例程测试说明 ***************************
// 1.核心板烧录完成本例程，完成上电
//
// 2.使用万用表检测 PWM_CHx 对应的通道，会看到电压变化
//
// 2.使用示波器检测 PWM_CHx 对应的通道，会看到脉宽变化
//
// 如果发现现象与说明严重不符 请参照本文件最下方 例程常见问题说明 进行排查


// **************************** 代码区域 ****************************
#define CHANNEL_NUMBER          (4)

#define PWM_CH1                 (TIM10_PWM_MAP3_CH1_D1)
#define PWM_CH2                 (TIM10_PWM_MAP3_CH2_D3)
#define PWM_CH3                 (TIM10_PWM_MAP3_CH3_D5)
#define PWM_CH4                 (TIM10_PWM_MAP3_CH4_D7)

int16 duty = 0;
uint8 channel_index = 0;
pwm_channel_enum channel_list[CHANNEL_NUMBER] = {PWM_CH1, PWM_CH2, PWM_CH3, PWM_CH4};

int main (void)
{
    clock_init(SYSTEM_CLOCK_120M);      // 初始化芯片时钟 工作频率为 120MHz
    debug_init();                       // 务必保留，本函数用于初始化MPU 时钟 调试串口

    // 此处编写用户代码 例如外设初始化代码等
    pwm_init(PWM_CH1, 17000, 0);                                                // 初始化 PWM 通道 频率 17KHz 初始占空比 0%
    pwm_init(PWM_CH2, 17000, 0);                                                // 初始化 PWM 通道 频率 17KHz 初始占空比 0%
    pwm_init(PWM_CH3, 17000, 0);                                                // 初始化 PWM 通道 频率 17KHz 初始占空比 0%
    pwm_init(PWM_CH4, 17000, 0);                                                // 初始化 PWM 通道 频率 17KHz 初始占空比 0%
    // 此处编写用户代码 例如外设初始化代码等

    while(1)
    {
        // 此处编写需要循环执行的代码
        for(channel_index = 0; channel_index < CHANNEL_NUMBER; channel_index++)
        {
            for(duty = 0; duty <= PWM_DUTY_MAX / 2; duty ++)                    // 输出占空比递增到 50%
            {
                pwm_set_duty(channel_list[channel_index], duty);                // 更新对应通道占空比额
                system_delay_us(100);
            }
            for(duty = PWM_DUTY_MAX / 2; duty >= 0; duty --)                    // 输出占空比递减到 0%
            {
                pwm_set_duty(channel_list[channel_index], duty);                // 更新对应通道占空比
                system_delay_us(100);
            }
        }
        // 此处编写需要循环执行的代码
    }
}
// **************************** 代码区域 ****************************

// *************************** 例程常见问题说明 ***************************
// 遇到问题时请按照以下问题检查列表检查
//
// 问题1：PWM_CHx 对应的通道长时间无信号、电压变化
//      查看程序是否正常烧录，是否下载报错，确认正常按下复位按键
//      四个通道同一时间只有一个通道输出，换个通道看看



