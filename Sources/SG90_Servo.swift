import SwiftyGPIO  //Comment this when not using the package manager
import Glibc

 
public class SG90Servo{
    var pwm: PWMOutput

    public init(_ pwm:PWMOutput, period: Int = SERVO_PERIOD_NS)
        self.pwm = pwm
    }

    public enable()
        pwm.initPWM()
    }

    public disable(){
        pwm.stopPWM()
    }

    public move(to: Position) {
        pwm.startPWM(period: SERVO_PERIOD_NS, duty: to.rawValue)
    }
}

public enum Position: Int {
    case left = 5
    case middle = 8
    case right = 10
}

let SERVO_PERIOD_NS = 20_000_000  //20ms
