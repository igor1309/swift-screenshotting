// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-screenshotting",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "Marketing", targets: ["Marketing"]),
        .library(name: "Screenshotting", targets: ["Screenshotting"]),
    ],
    targets: [
        .target(
            name: "Marketing",
            dependencies: ["Screenshotting"]
        ),
        .testTarget(
            name: "MarketingTests",
            dependencies: ["Marketing"]
        ),
        .target(name: "Screenshotting"),
        .testTarget(
            name: "ScreenshottingTests",
            dependencies: ["Screenshotting"]
        ),
    ]
)
