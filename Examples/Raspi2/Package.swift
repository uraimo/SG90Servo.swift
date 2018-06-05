import PackageDescription

let package = Package(
    name: "TestServo",
    dependencies: [
        .Package(url: "https://github.com/uraimo/SG90Servo.swift.git",
                 majorVersion: 2)
    ]
)
