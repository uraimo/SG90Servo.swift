import PackageDescription

let package = Package(
    name: "TestServo",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/uraimo/SG90Servo.swift.git",
                 majorVersion: 1)
    ]
)
