//
//  Device.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import SwiftUI

public struct Device: Equatable {
    public let type: DeviceType
    public let name: String
    public let size: CGSize
    
    public init(_ type: DeviceType, name: String, size: CGSize) {
        self.type = type
        self.name = name
        self.size = size
    }
    
    public enum DeviceType {
        case iPhone
        case iPad
    }
}
