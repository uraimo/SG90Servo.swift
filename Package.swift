// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SG90Servo",
    products: [
        .library(name: "SG90Servo", targets: ["SG90Servo"]),
    ], 
    dependencies: [
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "SG90Servo", dependencies: ["SwiftyGPIO"]),
    ]
)
