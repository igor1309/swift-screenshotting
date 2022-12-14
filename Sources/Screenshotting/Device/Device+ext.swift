//
//  Device+ext.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public extension Device {
    
    /// `4.7"` (375 x 667 points @2x)
    /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
    static let iPhoneSE2nd: Self = .init(.iPhone, "iPhone SE (2nd Gen)", .iPhoneSE2nd, 2)
    
    /// `5.4"` (375 x 812 points @3x)
    /// iPhone 13 mini, iPhone 12 mini
    static let iPhone13mini: Self = .init(.iPhone, "iPhone 13 mini", .iPhone13mini, 3)
    
    /// `5.5"` (414 x 736 points @3x)
    /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
    static let iPhone8Plus: Self = .init(.iPhone, "iPhone 8 Plus", .iPhone8Plus, 3)
    
    /// `5.8"` (375 x 812 points @3x)
    /// iPhone 11 Pro, iPhone XS, iPhone X
    static let iPhoneX: Self = .init(.iPhone, "iPhone X", .iPhoneX, 3)

    /// `6.1"` (414 x 896 points @2x)
    /// iPhone 11, iPhone XR
    static let iPhone11: Self = .init(.iPhone, "iPhone 11", .iPhone11, 2)
    
    /// `6.1"` (390 x 844 points @3x)
    /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
    static let iPhone14Pro: Self = .init(.iPhone, "iPhone 14 Pro", .iPhone14Pro, 3)
    static let iPhone14: Self = .init(.iPhone, "iPhone 14", .iPhone14, 3)
    static let iPhone13Pro: Self = .init(.iPhone, "iPhone 13 Pro", .iPhone13Pro, 3)

    /// `6.5"` (414 x 896 points @3x)
    /// iPhone 11 Pro Max, iPhone XS Max
    static let iPhoneXSMax: Self = .init(.iPhone, "iPhone XS Max", .iPhoneXSMax, 3)
    
    /// `6.7"` (428 x 926 points @3x)
    /// iPhone 13 Pro Max, iPhone 12 Pro Max
    static let iPhone14ProMax: Self = .init(.iPhone, "iPhone 14 Pro Max", .iPhone14ProMax, 3)
    static let iPhone14Plus: Self = .init(.iPhone, "iPhone 14 Plus", .iPhone14Plus, 3)
    
    static let iPhone13ProMax: Self = .init(.iPhone, "iPhone 13 Pro Max", .iPhone13ProMax, 3)
}

public extension Device {
    
    /// `12.9"` 1024 x 1366 @2 | 2048 x 2732 pixels (portrait), 2732 x 2048 pixels (landscape)
    /// iPad Pro (6th generation, 5th generation, 4th generation, 3rd generation)
    /// iPad Pro (2nd generation)
    static let iPadPro12_9_6th: Self = .init(.iPad, "iPad Pro (12.9-inch) (6th generation)", .iPadPro12_9, 2)
    // use `ipadPro129` in iPad Pro name for fastlane
    // http://docs.fastlane.tools/actions/upload_to_app_store/#uploading-screenshots-for-ipad-pro-129-inch-3rd-generation
    static let iPadPro12_9_3rd: Self = .init(.iPad, "iPad Pro (12.9-inch) (3rd generation) ipadPro129", .iPadPro12_9, 2)
    static let iPadPro12_9_2nd: Self = .init(.iPad, "iPad Pro (12.9-inch) (2nd generation)", .iPadPro12_9, 2)
}

private extension Device {
    
    init(_ type: DeviceType, _ name: String, _ size: CGSize, _ scale: CGFloat) {
        self.init(type, name: name, size: size, scale: scale)
    }
}
