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
    
    func test_device_width() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(Device.iPhoneSE2nd.size.width, 375)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(Device.iPhone13mini.size.width, 375)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(Device.iPhone8Plus.size.width, 414)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(Device.iPhoneX.size.width, 375)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(Device.iPhone11.size.width, 414)
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(Device.iPhone13Pro.size.width, 390)
        
        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(Device.iPhoneXSMax.size.width, 414)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(Device.iPhone13ProMax.size.width, 428)
    }
    
    func test_device_height() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(Device.iPhoneSE2nd.size.height, 667)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(Device.iPhone13mini.size.height, 812)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(Device.iPhone8Plus.size.height, 736)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(Device.iPhoneX.size.height, 812)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(Device.iPhone11.size.height, 896)
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(Device.iPhone13Pro.size.height, 844)
        
        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(Device.iPhoneXSMax.size.height, 896)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(Device.iPhone13ProMax.size.height, 926)
    }
}

