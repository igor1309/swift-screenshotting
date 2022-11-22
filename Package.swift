// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift-screenshotting",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .appStorePreviewing,
        .screenshotting,
    ],
    targets: [
        .appStorePreviewing,
        .appStorePreviewingTests,
        .screenshotting,
        .screenshottingTests,
    ]
)

extension Product {
    
    static let appStorePreviewing = library(
        name: .appStorePreviewing,
        targets: [.appStorePreviewing]
    )
    static let screenshotting = library(
        name: .screenshotting,
        targets: [.screenshotting]
    )
}

extension Target {
    
    static let appStorePreviewing = target(
        name: "AppStorePreviewing",
        dependencies: ["Screenshotting"]
    )
    static let appStorePreviewingTests = testTarget(
        name: "AppStorePreviewingTests",
        dependencies: ["AppStorePreviewing"]
    )
    static let screenshotting = target(name: "Screenshotting")
    static let screenshottingTests = testTarget(
        name: "ScreenshottingTests",
        dependencies: ["Screenshotting"]
    )
}

extension Target.Dependency {
    
    static let appStorePreviewing = byName(name: .appStorePreviewing)
    static let screenshotting = byName(name: .screenshotting)
}

private extension String {
    
    static let appStorePreviewing = "AppStorePreviewing"
    static let appStorePreviewingTests = "AppStorePreviewingTests"
    static let screenshotting = "Screenshotting"
    static let screenshottingTests = "ScreenshottingTests"
}
