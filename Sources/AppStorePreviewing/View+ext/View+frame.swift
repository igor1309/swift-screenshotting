//
//  View+frame.swift
//  Marketing
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public extension View {
    func frame(size: CGSize) -> some View {
        frame(width: size.width, height: size.height)
    }
}
