# Screenshotting

A small library to create AppStore previews and screenshots.

(Optionally) use `MarketingPreview` to create App Store previews (SwiftUI views) and `screenshots` to create and save screenshots of the view for provided `devices` (device sizes) and `locales`.

SwiftUI previews are not available in test targets, so if you want to have SwiftUI previews it makes sense to create a separate target for views that would be the sources for the App Store screenshots/previews, and import that target into test target that actually produce screenshots (png-files).

`screenshot` and `screenshots`

## Preparation

_The following is optional, take it as an use example. For clarity and simplicity, we would consider ourselves living in the SwiftUI world._

Create new __app target__ named `AppStorePreviews`. Compose the views you'd like screenshots of. You can use `MarketingPreview` from `Marketing` library to assist you.

![Previews](/Docs/previews.png)

Create new __test target__ named `AppStorePreviewsTests`. Add tests...

```swift
let locales: [Locale] = ...
let devices: [Device] = ...

let marketingPreview: (Device) -> MarketingPreview = { device in
    // ...
}

try screenshots(marketingPreview, with: locales, on: devices)
```

Create (or tweak) __scheme__ `AppStorePreviews` ...

In fastlane's `Snapfile` set `scheme` and `output directory`:

```ruby
scheme "AppStorePreviews"
output_directory "./AppStorePreviewsTests/AppStoreScreenshots"
```

Run ... Output:

```
AppStoreScreenshots
├── en-US
│   ├── en-US-iPhone-13-Pro-1MarketingMaterial.png
│   └── en-US-iPhone-13-Pro-2MarketingMaterial.png
└── ru-RU
    ├── ru-RU-iPhone-13-Pro-1MarketingMaterial.png
    └── ru-RU-iPhone-13-Pro-2MarketingMaterial.png
```

See discussion in blog [Automating app screenshots and previews for the App Store with Snapshotting and fastlane | Swift and iOS dev with Igor](https://igor1309.dev/articles/2022/2022-08-20-fastlane-screenshots/).

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
        url: "https://github.com/igor1309/swift-screenshotting.git",
        from: .init(0, 0, 1)
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
