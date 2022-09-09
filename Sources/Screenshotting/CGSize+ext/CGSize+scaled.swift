//
//  CGSize+scaled.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public extension CGSize {
    func scaled(x: CGFloat, y: CGFloat) -> CGSize {
        applying(.init(scaleX: x, y: y))
    }
}

