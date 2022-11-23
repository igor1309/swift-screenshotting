//
//  CGSize+iPhones.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public extension CGSize {
    
    /// `4"` (320 x 568 @2x)
    /// iPhone SE (1st Gen), iPod Touch (7th Gen)
    static let iPhoneSE1st:    Self = .init(width: 320, height: 568)
    static let iPodTouch7th:   Self = .init(width: 320, height: 568)

    /// `4.7"` (375 x 667 points @2x)
    /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
    static let iPhoneSE2nd:    Self = .init(width: 375, height: 667)
    static let iPhone8:        Self = .init(width: 375, height: 667)
    static let iPhone7:        Self = .init(width: 375, height: 667)
    static let iPhone6S:       Self = .init(width: 375, height: 667)
    
    /// `5.4"` (375 x 812 points @3x)
    /// iPhone 13 mini, iPhone 12 mini
    static let iPhone13mini:   Self = .init(width: 375, height: 812)
    static let iPhone12mini:   Self = .init(width: 375, height: 812)
    
    /// `5.5"` (414 x 736 points @3x)
    /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
    static let iPhone8Plus:    Self = .init(width: 414, height: 736)
    static let iPhone7Plus:    Self = .init(width: 414, height: 736)
    static let iPhone6SPlus:   Self = .init(width: 414, height: 736)
    
    /// `5.8"` (375 x 812 points @3x)
    /// iPhone 11 Pro, iPhone XS, iPhone X
    static let iPhone11Pro:    Self = .init(width: 375, height: 812)
    static let iPhoneXS:       Self = .init(width: 375, height: 812)
    static let iPhoneX:        Self = .init(width: 375, height: 812)
    
    /// `6.1"` (414 x 896 points @2x)
    /// iPhone 11, iPhone XR
    static let iPhone11:       Self = .init(width: 414, height: 896)
    static let iPhoneXR:       Self = .init(width: 414, height: 896)
    
    /// `6.1"` (390 x 844 points @3x)
    /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
    static let iPhone14Pro:    Self = .init(width: 393, height: 852)
    static let iPhone14:       Self = .init(width: 390, height: 844)
    
    static let iPhone13Pro:    Self = .init(width: 390, height: 844)
    static let iPhone13:       Self = .init(width: 390, height: 844)
    static let iPhone12Pro:    Self = .init(width: 390, height: 844)
    static let iPhone12:       Self = .init(width: 390, height: 844)
    
    /// `6.5"` (414 x 896 points @3x)
    /// iPhone 11 Pro Max, iPhone XS Max
    static let iPhone11ProMax: Self = .init(width: 414, height: 896)
    static let iPhoneXSMax:    Self = .init(width: 414, height: 896)
    
    /// `6.7"` (428 x 926 points @3x)
    /// iPhone 13 Pro Max, iPhone 12 Pro Max
    static let iPhone14ProMax: Self = .init(width: 430, height: 932)
    static let iPhone14Plus:   Self = .init(width: 428, height: 926)
    
    static let iPhone12ProMax: Self = .init(width: 428, height: 926)
    static let iPhone13ProMax: Self = .init(width: 428, height: 926)
}

public extension CGSize {
    
    /// `12.9"` 1024 x 1366 @2 | 2048 x 2732 pixels (portrait), 2732 x 2048 pixels (landscape)
    /// iPad Pro (6th generation, 5th generation, 4th generation, 3rd generation)
    /// iPad Pro (2nd generation)
    static let iPadPro12_9: Self = .init(width: 1_024, height: 1_366)
}
