# takeAphoto- By: sorrymaker - 周二 7月 11 2023
import os, utime
from fpioa_manager import fm
from Maix import GPIO
import sensor, lcd, image, time



def checkPeripheral():
    for item in fm.get_gpio_used():
        print(item)
    pass

def takeAPhoto():
    global num
    global key
    if key.value() == 0:
        img = sensor.snapshot()
        initName = "/sd/DS/1.jpg"
        count += 1
        filename = initName.replace("1",str(count))
        print(filename)
        img.save(filename,quality = 95)
        img.draw_string(0,0,"Save Successfully!")
        lcd.display(img)
        utime.sleep_ms(600)

# SystemInit
fm.register(16,fm.fpioa.GPIOHS0, force=True)
fm.register(12,fm.fpioa.GPIOHS1, force=True)
led_b = GPIO(GPIO.GPIOHS1,GPIO.OUT)
key = GPIO(GPIO.GPIOHS0,GPIO.IN)

lcd.init()
lcd.clear(lcd.BLUE)

sensor.reset()
sensor.reset(freq=24000000, dual_buff=1)
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.set_auto_exposure(1)
sensor.set_auto_gain(0, gain_db = 17)
sensor.set_auto_whitebal(0, rgb_gain_db = (0,0,0))
sensor.set_hmirror(1)
sensor.set_vflip(1)
sensor.set_windowing((224,224))
sensor.run(1)

# clock = time.clock()
#lcd.rotation(2)

count = 0

while True:
    # clock.tick()
    img = sensor.snapshot()
    lcd.display(img)
    # lcd.draw_string(0,16,str(clock.fps()))
    takeAPhoto()

