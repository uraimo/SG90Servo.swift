import SwiftyGPIO
import SG90Servo
import Glibc

let pwms = SwiftyGPIO.hardwarePWMs(for:.RaspberryPi2)!
let pwm = (pwms[0]?[.P18])!

let s1 = SG90Servo(pwm)
s1.enable()

for i in 0...5 {
    print("<- Left")
    s1.move(to: .left)
    sleep(1)

    print("^  Middle")
    s1.move(to: .middle)
    sleep(1)

    print("-> Right")
    s1.move(to: .right)
    sleep(1)
}

s1.disable()