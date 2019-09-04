// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TestServo",
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
        .package(url: "https://github.com/uraimo/SG90Servo.swift.git",from: "3.0.0")
    ],
    targets: [
        .target(name: "TestServo", dependencies: ["SwiftyGPIO","SG90Servo.swift"]),
    ]
) 
