# Untitled - By: sorrymaker - 周三 8月 2 2023
from machine import Timer
from machine import UART
from fpioa_manager import fm
import ustruct
import struct
import os, utime
import sensor, image, time
from Maix import GPIO

class uart_send_data_t:
# 用户自定义变量
   def __init__( self, cx=0,cy=0):
      self.cx = cx
      self.cy = cy

class Upacker():
    def __init__(self):
        self._STX_L = 0x55
        self._MAX_PACK_SIZE = 1024 + 4 + 128
        self._calc = 0
        self._check = 0
        self._cnt = 0
        self._flen = 0
        self._state = 0
        self._data = bytearray()

    def _decode(self, d):
        if (self._state == 0 and d == self._STX_L):
            self._state = 1
            self._calc = self._STX_L
        elif self._state == 1:
            self._flen = d & 0xff
            self._calc ^= d & 0xff
            self._state = 2
        elif self._state == 2:
            self._flen |= (d & 0xff) << 8
            self._calc ^= d & 0x3F
            # 数据包超长得情况下直接丢包
            if ((self._flen & 0x3FFF) > self._MAX_PACK_SIZE):
                self._state = 0
                return -1
            else:
                self._data = bytearray(self._flen & 0x3FFF)
            self._state = 3
            self._cnt = 0
        elif self._state == 3:
            header_crc = ((d & 0x03) << 4) | ((self._flen & 0xC000) >> 12)
            self._check = d
            if (header_crc != (self._calc & 0X3C)):
                self._state = 0
                return -1
            self._state = 4
            self._flen &= 0x3FFF
        elif self._state == 4:
            self._data[self._cnt] = d
            self._cnt += 1
            self._calc ^= d
            if self._cnt == self._flen:
                self._state = 0
                #接收完，检查check
                if ((self._calc & 0xFC) == (self._check & 0XFC)):
                    return 0
                else:
                    return -1
        else:
            self._state = 0

        return 1

    # 解包
    def unpack(self, bytes_data, callback):
        ret = 0
        for i in bytes_data:
            ret = self._decode(i)
            if ret == 0:
                callback(self._data)
                break
            elif ret == -1:
                print("err")
                break

    # 打包
    def enpack(self, data):
        tmp = bytearray(4)
        tmp[0] = 0x55
        tmp[1] = len(data) & 0xff
        tmp[2] = (len(data) >> 8) & 0xff
        crc = tmp[0] ^ tmp[1] ^ tmp[2]
        tmp[2] |= (crc & 0x0c) << 4
        tmp[3] = 0x03 & (crc >> 4)

        for i in range(len(data)):
            crc ^= data[i]
        tmp[3] |= (crc & 0xfc)

        frame = struct.pack("BBBB%ds" % len(data), tmp[0], tmp[1], tmp[2],
                            tmp[3], data)
        #Debug语句
        #print(''.join(map(lambda x:('' if len(hex(x))>=4 else '/x0')+hex(x)[2:],frame)))
        return frame

# 发送数组初始化
def BufferInit():
    sendData = uart_send_data_t()
    return sendData

# 数据打包
def PackData(pack,global_uart_send_data):
    hex_data = ustruct.pack("<hh",                                  #小端字节序
                   global_uart_send_data.cx,
                   global_uart_send_data.cy,)
    pkg_data =  pack.enpack(hex_data)
    return pkg_data

# 用户自定义回调函数，在该函数内解析数据
def UartCallBack(D):
    #float_value = struct.unpack('f', D[3:7])[0]     # D[3:7]:取D列表的 3 4 5 6位的元素   struct.unpack：返回一个元组，取第一位
    #int16_value = struct.unpack('h', D[1:3])[0]     # 同上
    #int8_value = D[0]
    #print(float_value)
    #print(int16_value)
    #print(int8_value)
    pass

# 接收数据并解包
def UnPackData(pack,uart):
    Data = uart.read()
    if Data:
        pack.unpack(Data,UartCallBack)
    Data = 0

# 定时器回调函数，在该函数内定时发送数据包
def TimerCallBack(tim):
    global pkg
    Peripheral_internUart.write(pkg)

# 找最大色块
def Find_Max_Blobs(blobs):
    maxSize = 0
    for b in blobs:
        if b[4] > maxSize:
            maxSize = b[4]
            maxB = b
    return maxB

# Calibration
def CenterCalibration():
    pass

# sensorInit
sensor.reset()
sensor.reset(freq=24000000, dual_buff=1)
sensor.run(0)
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.set_auto_exposure(1)
sensor.set_auto_gain(0)
sensor.set_auto_whitebal(1)
sensor.set_vflip(1)
sensor.set_hmirror(1)
sensor.skip_frames(time = 2000)
#sensor.set_windowing((224,224))


## 按键初始化
#fm.register(16,fm.fpioa.GPIOHS0, force=True)
#fm.register(12,fm.fpioa.GPIOHS1, force=True)
#led_b = GPIO(GPIO.GPIOHS1,GPIO.OUT)
#key = GPIO(GPIO.GPIOHS0,GPIO.IN)


# 交互串口初始化
fm.register(6, fm.fpioa.UART1_RX, force=True)
fm.register(7, fm.fpioa.UART1_TX, force=True)
Peripheral_internUart = UART(UART.UART1, 115200, 8, 0, 0, timeout=100, read_buf_len=4096)

# 串口发送定时器初始化，定时发送k210采集的信息
tim = Timer(Timer.TIMER0, Timer.CHANNEL0, mode = Timer.MODE_PERIODIC, period = 1000, unit = Timer.UNIT_MS, callback = TimerCallBack, arg = TimerCallBack, start = False)
tim.callback(TimerCallBack)
tim.period(1000) # 数据包发送周期，用户可在这更改发送周期

sensorWidth = sensor.width()
sensorHeight = sensor.height()
#sensorWidth = 224
#sensorHeight = 224

# RoisInit
roiWidth = 100
roiHeight = 100
offsetWidth = 1.5
offsetHeight = 1.8
centerX = int(sensorWidth/2 - roiWidth/2)
centerY = int(sensorHeight/2 - roiHeight/2)

ROIS =  [   # 中心列
            (centerX, int(centerY - roiHeight*offsetWidth), roiWidth, roiHeight, 0.2),      # 上
            (centerX, int(centerY + roiHeight*offsetWidth), roiWidth, roiHeight, 0.2),      # 下
            # 中心
            (centerX, centerY, roiWidth, roiHeight, 0.2),
            # 中心行
            (int(centerX - roiHeight*offsetHeight), centerY, roiWidth, roiHeight, 0.2),     # 左
            (int(centerX + roiHeight*offsetHeight), centerY, roiWidth, roiHeight, 0.2)      # 右
        ]

targetColorThreshold = [(76, 100, -11, 61, -4, 14)]
xStride = 0
yStride = 0
pixelsThreshold = 0
areaThreshold = 0

# 数据包初始化
Global_pack = Upacker()
Global_sendBuffer = BufferInit()
Global_sendBuffer.cx = 0
Global_sendBuffer.cy = 0

# 系统状态标志位
SystemState = 0
clock = time.clock()
sensor.run(1)
tim.start()

while(True):
    r = ROIS[2]
    img = sensor.snapshot()
    blobs = img.find_blobs(targetColorThreshold, roi = r[0:4], merge = True)
    if blobs:
       maxBlob =  Find_Max_Blobs(blobs)
       img.draw_rectangle(maxBlob.rect())
       img.draw_cross(maxBlob.cx(),
                      maxBlob.cy())
       Global_sendBuffer.cx = maxBlob.cx()
       Global_sendBuffer.cy = maxBlob.cy()
    pkg = PackData(Global_pack,Global_sendBuffer) # 数据打包，在定时回调函数中周期发送pkg
    img.draw_rectangle(r[0:4])
