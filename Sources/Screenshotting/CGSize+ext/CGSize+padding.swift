//
//  CGSize+padding.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public extension CGSize {
    func padding(_ padding: CGFloat) -> CGSize {
        .init(width: width + padding, height: height + padding)
    }
    func padding(x: CGFloat, y: CGFloat) -> CGSize {
        .init(width: width + x, height: height + y)
    }
}
