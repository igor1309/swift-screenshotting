//
//  Device.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import CoreGraphics

public struct Device: Equatable, Hashable {
    public let type: DeviceType
    public let name: String
    public let size: CGSize
    public let scale: CGFloat
    
    public init(_ type: DeviceType, name: String, size: CGSize, scale: CGFloat) {
        self.type = type
        self.name = name
        self.size = size
        self.scale = scale
    }
    
    public enum DeviceType {
        case iPhone
        case iPad
    }
}

extension CGSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
