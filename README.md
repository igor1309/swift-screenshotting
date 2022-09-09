# Screenshotting

A small library to create AppStore screenshots.

## Installation

### 🛠 Xcode

> ⚠️ Warning: By default, Xcode will try to add the `Screenshotting` package to your project's main application/framework target. Please ensure that `Screenshotting` is added to the ___test___ target instead, as documented below.

1. From the menu select **File/Add Packages…**
2. Enter package repository URL: `https://github.com/igor1309/swift-screenshotting.git` into the search field
3. Confirm the version and let Xcode resolve the package
4. On the final dialog, make sure Screenshotting's **Add to Target** column is set to a test target that will contain screenshot tests

### 📦 Swift Package Manager

If you want to use `Screenshotting` in any other project that uses [SwiftPM](https://swift.org/package-manager/), add the package as a dependency in `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
        from: .init(0, 0, 0)
    )
]
```

Next, add `Screenshotting` as a dependency of your test target:

```swift
targets: [
    .target(name: "MyApp"),
    .testTarget(
        name: "MyAppTests",
        dependencies: [
            "MyApp",
            .product(name: "Screenshotting", package: "swift-screenshotting")
        ]
    )
]
```
