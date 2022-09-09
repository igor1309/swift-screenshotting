//
//  Device+ext.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import Foundation

public extension Device {
    static let iPhoneSE2ndGen: Self = .init(.iPhone, name: "iPhone SE (2nd Gen)", size: .iPhoneSE2ndGen)
    static let iPhone13mini: Self = .init(.iPhone, name: "iPhone 13 mini", size: .iPhone13mini)
    static let iPhone8Plus: Self = .init(.iPhone, name: "iPhone 8 Plus", size: .iPhone8Plus)
    static let iPhoneX: Self = .init(.iPhone, name: "iPhone X", size: .iPhoneX)
    static let iPhone11: Self = .init(.iPhone, name: "iPhone 11", size: .iPhone11)
    static let iPhone13Pro: Self = .init(.iPhone, name: "iPhone 13 Pro", size: .iPhone13Pro)
    static let iPhoneXSMax: Self = .init(.iPhone, name: "iPhone XS Max", size: .iPhoneXSMax)
    static let iPhone13ProMax: Self = .init(.iPhone, name: "iPhone 13 Pro Max", size: .iPhone13ProMax)
}

public extension Array where Element == Device {
    static let all: Self = [.iPhoneSE2ndGen, .iPhone13mini, .iPhone8Plus, .iPhoneX, .iPhone11, .iPhone13Pro, .iPhoneXSMax, .iPhone13ProMax]
    static let mainDevices: Self = [.iPhone13Pro, .iPhone13ProMax]
}
