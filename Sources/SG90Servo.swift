/*
   SG90Servo.swift

   Copyright (c) 2017 Umberto Raimondi
   Licensed under the MIT license, as follows:

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.)
*/

import SwiftyGPIO  //Comment this when not using the package manager

 
public class SG90Servo{
    var pwm: PWMOutput

    public init(_ pwm:PWMOutput, period: Int = SERVO_PERIOD_NS) {
        self.pwm = pwm
    }

    public func enable() {
        pwm.initPWM()
    }

    public func disable() {
        pwm.stopPWM()
    }

    public func move(to: Position) {
        pwm.startPWM(period: SERVO_PERIOD_NS, duty: Float(to.rawValue))
    }
}

public enum Position: Int {
    case left = 5
    case middle = 8
    case right = 12
}

let SERVO_PERIOD_NS = 20_000_000  //20ms
