// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-screenshotting",
    products: [
        .library(name: "Screenshotting", targets: ["Screenshotting"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: .init(0, 0, 0)
        )
    ],
    targets: [
        .target(name: "Screenshotting"),
        .testTarget(
            name: "ScreenshottingTests",
            dependencies: [
                "Screenshotting",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        ),
    ]
)
