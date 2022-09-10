//
//  Device.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 09.09.2022.
//

import CoreGraphics

/// Abstract representation of iOS device essential parameters.
public struct Device: Equatable, Hashable {
    /// iOS device type
    public let type: DeviceType
    
    /// iOS device name
    public let name: String
    
    /// iOS device screen size
    public let size: CGSize
    
    /// iOS device screen scale
    public let scale: CGFloat
    
    public init(_ type: DeviceType, name: String, size: CGSize, scale: CGFloat) {
        self.type = type
        self.name = name
        self.size = size
        self.scale = scale
    }
    
    /// iOS device type: iPhone or iPad
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
