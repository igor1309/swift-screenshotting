// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-screenshotting",
    products: [
        .library(name: "Screenshotting", targets: ["Screenshotting"]),
    ],
    targets: [
        .target(name: "Screenshotting"),
        .testTarget(
            name: "ScreenshottingTests",
            dependencies: ["Screenshotting"]
        ),
    ]
)
