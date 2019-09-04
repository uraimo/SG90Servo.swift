import PackageDescription

let package = Package(
    name: "TestServo",
    dependencies: [
        .Package(url: "https://github.com/uraimo/SG90Servo.swift.git",
                 majorVersion: 2)
    ]
)


// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TestServo",
    dependencies: [
        .package(url: "https://github.com/uraimo/SG90Servo.swift.git",
                 , from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "TestServo",
            dependencies: ["SG90Servo.swift"])
    ]
) 
