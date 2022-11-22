//
//  CGSizeStaticInstancesTests.swift
//  ScreenshottingTests
//
//  Created by Igor Malyarov on 10.09.2022.
//

import Screenshotting
import XCTest

final class CGSizeStaticInstancesTests: XCTestCase {
    
    func test_CGSize_width() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(CGSize.iPhoneSE2nd.width, 375)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(CGSize.iPhone13mini.width, 375)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(CGSize.iPhone8Plus.width, 414)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(CGSize.iPhoneX.width, 375)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(CGSize.iPhone11.width, 414)
        
        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(CGSize.iPhone13Pro.width, 390)

        XCTAssertEqual(CGSize.iPhone14Pro.width, 393)

        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(CGSize.iPhoneXSMax.width, 414)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(CGSize.iPhone13ProMax.width, 428)

        XCTAssertEqual(CGSize.iPhone14ProMax.width, 430)
    }
    
    func test_CGSize_height() {
        /// `4.7"` (375 x 667 points @2x)
        /// iPhone SE (2nd Gen), iPhone 8, iPhone 7, iPhone 6S
        XCTAssertEqual(CGSize.iPhoneSE2nd.height, 667)
        
        /// `5.4"` (375 x 812 points @3x)
        /// iPhone 13 mini, iPhone 12 mini
        XCTAssertEqual(CGSize.iPhone13mini.height, 812)
        
        /// `5.5"` (414 x 736 points @3x)
        /// iPhone 8 Plus, iPhone 7 Plus, iPhone 6S Plus
        XCTAssertEqual(CGSize.iPhone8Plus.height, 736)
        
        /// `5.8"` (375 x 812 points @3x)
        /// iPhone 11 Pro, iPhone XS, iPhone X
        XCTAssertEqual(CGSize.iPhoneX.height, 812)
        
        /// `6.1"` (414 x 896 points @2x)
        /// iPhone 11, iPhone XR
        XCTAssertEqual(CGSize.iPhone11.height, 896)

        /// `6.1"` (390 x 844 points @3x)
        /// iPhone 13 Pro, iPhone 13, iPhone 12 Pro, iPhone 12
        XCTAssertEqual(CGSize.iPhone13Pro.height, 844)

        XCTAssertEqual(CGSize.iPhone14Pro.height, 852)

        /// `6.5"` (414 x 896 points @3x)
        /// iPhone 11 Pro Max, iPhone XS Max
        XCTAssertEqual(CGSize.iPhoneXSMax.height, 896)
        
        /// `6.7"` (428 x 926 points @3x)
        /// iPhone 13 Pro Max, iPhone 12 Pro Max
        XCTAssertEqual(CGSize.iPhone13ProMax.height, 926)

        XCTAssertEqual(CGSize.iPhone14ProMax.height, 932)
    }
}

