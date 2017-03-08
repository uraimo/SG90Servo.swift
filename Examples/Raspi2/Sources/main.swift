import SwiftyGPIO
import SG90Servo
import Glibc

let pwms = SwiftyGPIO.hardwarePWMs(for:.RaspberryPi2)!
let pwm = (pwms[0]?[.P18])!

let s1 = SG90Servo(pwm)
s1.enable()

print("<- Left")
s1.move(to: .left)
sleep(10)

print("^  Middle")
s1.move(to: .middle)
sleep(10)

print("-> Right")
s1.move(to: .right)
sleep(10)

s1.disable()