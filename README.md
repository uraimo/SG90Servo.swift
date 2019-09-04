# SG90Servo.swift

*A Swift library for the SG90 servo motor, that can be adapted to work with other servos (9g ES08A, SM-S4303R, S3003, ...).*

<p>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux-only" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat" alt="Swift 4 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/SG90Servo.swift/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>
 

![SG90 Servo Motor](https://raw.githubusercontent.com/uraimo/SG90Servo.swift/master/sg90.jpg)

# Summary

This simple library can control an SG90 servo motor with a PWM, that has a 20ms period and duty cycle that represent these positions:

* 1ms = 5%: _-90°, left position_
* 1.5ms = 7.5%: _-90°, middle position_
* 2ms = 10%: _+90°, right position_

Your servo could have slightly different settings (1-2% difference), play around with the values in the `Position` enum (expressed in percentage) to find the right duty cycles for your servo.

## Supported Boards

Every board supported by [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO) with the PWM feature, right now only RaspberryPis. And you'll need Swift 3.x, check out the SwiftyGPIO readme for more info on where to find it.

The example below uses a RaspberryPi 2 board but you can easily modify the example to use one the the other supported boards, a full working demo projects for the RaspberryPi2 is available in the `Examples` directory.

## Usage

The first thing we need to do is to obtain an instance of `PWMOutput` from SwiftyGPIO and use it to initialize the `SG90Servo` object:

```swift
import SwiftyGPIO
import SG90Servo

let pwms = SwiftyGPIO.hardwarePWMs(for:.RaspberryPi2)!
let pwm = (pwms[0]?[.P18])!

let s1 = SG90Servo(pwm)
s1.enable()
s1.move(to: .left)
sleep(1)
s1.move(to: .middle)
sleep(1)
s1.move(to: .right)
sleep(1)

s1.disable()

```

## Installation

Please refer to the [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO) readme for Swift installation instructions.

Once your board runs Swift, if your version support the Swift Package Manager, you can simply add this library as a dependency of your project and compile with `swift build`:

```
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TestServo",
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/uraimo/SG90Servo.swift.git",from: "3.0.0")
    ],
    targets: [
        .target(name: "TestServo", dependencies: ["SwiftyGPIO","SG90Servo"]),
    ]
) 
```

The directory `Examples` contains sample projects that uses SPM, compile it and run the sample with `sudo ./.build/debug/TestServo`.

As everything interacting with GPIOs, if you are not already root or member of a specific gpio group, you will need to run that binary with `sudo ./main`.
