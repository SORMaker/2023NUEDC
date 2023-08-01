# CameraDemo - By: sorrymaker - 周二 8月 1 2023

import sensor, image, time

# 找最大色块
def Find_Max_Blobs(blobs):
    maxSize = 0
    for b in blobs:
        if b[4] > maxSize:
            maxSize = b[4]
            maxB = b
    return maxB

# sensorInit
sensor.reset()
sensor.reset(freq=24000000, dual_buff=1)
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.set_auto_exposure(1)
sensor.set_auto_gain(0, gain_db = 17)
sensor.set_auto_whitebal(0, rgb_gain_db = (0,0,0))
sensor.set_vflip(1)
sensor.set_hmirror(1)
sensor.skip_frames(time = 2000)
sensor.set_windowing((224,224))

clock = time.clock()

#sensorWidth = sensor.width()
#sensorHeight = sensor.height()
sensorWidth = 224
sensorHeight = 224
# RoisInit
roiWidth = 30
roiHeight = 30
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

targetColorThreshold = [(38, 65, 34, 78, 1, 62)]
xStride = 20
yStride = 20
pixelsThreshold = 20
areaThreshold = 20

while(True):
    clock.tick()
    img = sensor.snapshot()
    for r in ROIS:
        blobs = img.find_blobs(targetColorThreshold, roi = r[0:4], x_stride = xStride, y_stride = yStride, area_threshold = areaThreshold, pixels_threshold = pixelsThreshold, merge = True)
        if blobs:
           maxBlob =  Find_Max_Blobs(blobs)
           img.draw_rectangle(maxBlob.rect())
           img.draw_cross(maxBlob.cx(),
                          maxBlob.cy())
        img.draw_rectangle(r[0:4])
    print(clock.fps())
