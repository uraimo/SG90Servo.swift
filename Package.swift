import PackageDescription

let package = Package(
    name: "SG90Servo",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git",
                 majorVersion: 0)
    ]
)
