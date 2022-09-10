//
//  DeviceStaticInstancesTests.swift
//  ScreenshottingTests
//
//  Created by Igor Malyarov on 10.09.2022.
//

import Screenshotting
import XCTest

final class DeviceStaticInstancesTests: XCTestCase {
    
    func test_device_name() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(Device.iPhoneSE2nd.name, "iPhone SE (2nd Gen)")
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(Device.iPhone13mini.name, "iPhone 13 mini")
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(Device.iPhone8Plus.name, "iPhone 8 Plus")
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(Device.iPhoneX.name, "iPhone X")
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(Device.iPhone11.name, "iPhone 11")
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(Device.iPhone13Pro.name, "iPhone 13 Pro")
        
        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(Device.iPhoneXSMax.name, "iPhone XS Max")
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(Device.iPhone13ProMax.name, "iPhone 13 Pro Max")
    }
    
    func test_device_size() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(Device.iPhoneSE2nd.size, CGSize.iPhoneSE2nd)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(Device.iPhone13mini.size, CGSize.iPhone13mini)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(Device.iPhone8Plus.size, CGSize.iPhone8Plus)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(Device.iPhoneX.size, CGSize.iPhoneX)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(Device.iPhone11.size, CGSize.iPhone11)
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(Device.iPhone13Pro.size, CGSize.iPhone13Pro)
        
        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(Device.iPhoneXSMax.size, CGSize.iPhoneXSMax)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(Device.iPhone13ProMax.size, CGSize.iPhone13ProMax)
    }
    
    func test_device_scale() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(Device.iPhoneSE2nd.scale, 2)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(Device.iPhone13mini.scale, 3)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(Device.iPhone8Plus.scale, 3)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(Device.iPhoneX.scale, 3)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(Device.iPhone11.scale, 2)
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(Device.iPhone13Pro.scale, 3)
        
        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(Device.iPhoneXSMax.scale, 3)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(Device.iPhone13ProMax.scale, 3)
    }
}
