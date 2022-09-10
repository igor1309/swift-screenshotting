// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-screenshotting",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "AppStorePreviewing", targets: ["AppStorePreviewing"]),
        .library(name: "Screenshotting", targets: ["Screenshotting"]),
    ],
    targets: [
        .target(
            name: "AppStorePreviewing",
            dependencies: ["Screenshotting"]
        ),
        .testTarget(
            name: "AppStorePreviewingTests",
            dependencies: ["AppStorePreviewing"]
        ),
        .target(name: "Screenshotting"),
        .testTarget(
            name: "ScreenshottingTests",
            dependencies: ["Screenshotting"]
        ),
    ]
)
