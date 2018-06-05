import PackageDescription

let package = Package(
    name: "SG90Servo",
    dependencies: [
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git",
                 majorVersion: 1)
    ]
)
