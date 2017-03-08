# SG90Servo.swift

*A Swift library for the SG90 servo motor, that can be adapted for other servos.*

<p>
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux-only" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://raw.githubusercontent.com/uraimo/5110lcd_pcd8544.swift/master/LICENSE"><img src="http://img.shields.io/badge/license-BSD-blue.svg?style=flat" alt="License: BSD" /></a>
</p>
 

## Supported Boards

Every board supported by [SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO): RaspberryPis, BeagleBones, C.H.I.P., etc...

To use this library, you'll need a Linux ARM board with Swift 3.x.

The example below will use a RaspberryPi 2 board but you can easily modify the example to use one the the other supported boards, a full working demo projects for the RaspberryPi2 is available in the `Examples` directory.

## Usage

So, the first thing we need to do is choose a `PWMOutput` using SwiftyGPIO and use it to initialize the `SG90Servo` object:

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

  let package = Package(
      name: "MyProject",
      dependencies: [
    .Package(url: "https://github.com/uraimo/SG90Servo.swift.git", majorVersion: 1),
    ...
      ]
      ...
  ) 

The directory `Examples` contains sample projects that uses SPM, compile it and run the sample with `sudo ./.build/debug/TestServo`.

If SPM is not supported, you'll need to manually download the library and its dependencies: 

    wget https://raw.githubusercontent.com/uraimo/SG90Servo.swift/master/Sources/SG90Servo.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SwiftyGPIO.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/Presets.swift https://raw.githubusercontent.com/uraimo/SwiftyGPIO/master/Sources/SunXi.swift
     
And once all the files have been downloaded, create an additional file that will contain the code of your application (e.g. main.swift). When your code is ready, compile it with:

    swiftc *.swift

The compiler will create a **main** executable.

As everything interacting with GPIOs, if you are not already root or member of a specific gpio group, you will need to run that binary with `sudo ./main`.
