//
//  MarketingPreview.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI

public struct MarketingPreview<Marketing, Content>: View
where Marketing: View,
Content: View {
    
    let device: Device
    let offset: CGFloat
    let marketing: () -> Marketing
    let content: () -> Content
    
    public init(device: Device, offset: CGFloat, marketing: @escaping () -> Marketing, content: @escaping () -> Content) {
        self.device = device
        self.offset = offset
        self.marketing = marketing
        self.content = content
    }
    
    public var body: some View {
        marketing()
            .frame(size: device.size)
            .overlay(content: framedContent)
    }
    
    private func framedContent() -> some View {
        content()
            .statusBar()
            .iPhoneChrome(in: device.size)
            .scaleEffect(0.8)
            .offset(y: offset)
    }
}

struct MarketingPreview_Previews: PreviewProvider {
    static let device: Device = .iPhone13Pro
    
    static var previews: some View {
        Group {
            marketingPreview()
            
            marketingPreview()
                .preferredColorScheme(.dark)
        }
        .environment(\.locale, .init(identifier: "ru-RU"))
        .previewLayout(.sizeThatFits)
    }
    
    static private func marketingPreview() -> some View {
        MarketingPreview(
            device: device,
            offset: 50,
            marketing: marketing,
            content: content
        )
    }
    
    static private func marketing() -> some View {
        ZStack(alignment: .top) {
            Color.orange
            
            Text("This is a preview for the App Store")
                .padding()
                .font(.largeTitle.bold())
        }
    }
    
    static private func content() -> some View {
        Color.indigo
    }
}
