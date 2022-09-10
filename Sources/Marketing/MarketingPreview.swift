//
//  MarketingPreview.swift
//  Marketing
//
//  Created by Igor Malyarov on 08.09.2022.
//

import Screenshotting
import SwiftUI

/// Create `Marketing (App Store) preview` for a given device size.
///
///     func marketingPreview(on device: Device) -> some View {
///         // ...
///         return MarketingPreview(...)
///     }
///
///     struct MarketingPreview_Previews: PreviewProvider {
///         static let devices = [Device.iPhone13Pro, .iPhone13ProMax]
///         static let locales = [Locale.en_US, .ru_RU]
///
///         static var previews: some View {
///             ForEach(devices, id: \.self) { device in
///                 ForEach(locales, id: \.self) { locale in
///                     marketingPreview(on: device)
///                         .environment(\.locale, locale)
///                 }
///                 .previewDisplayName(device.name)
///             }
///             .previewLayout(.sizeThatFits)
///         }
///     }
///
public struct MarketingPreview<Marketing, Content>: View
where Marketing: View,
      Content: View {
    
    let device: Device
    let offset: CGFloat
    let marketing: () -> Marketing
    let content: () -> Content
    
    public init(
        device: Device,
        offset: CGFloat,
        marketing: @escaping () -> Marketing,
        content: @escaping () -> Content
    ) {
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
    static var previews: some View {
        MarketingPreviewDemoView()
    }
}

private extension View {
    func previewDisplayName(
        _ device: Device,
        _ colorScheme: ColorScheme
    ) -> some View {
        previewDisplayName("\(device.name) | \(colorScheme)")
    }
}

private struct MarketingPreviewDemoView: View {
    let device: Device = .iPhone13Pro
    
    var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            group(device: device)
                .previewDisplayName(device, colorScheme)
                .preferredColorScheme(colorScheme)
        }
        .previewLayout(.sizeThatFits)
    }
    
    private func group(device: Device) -> some View {
        Group {
            marketingPreview(.top, 170, on: device)
            marketingPreview(.bottom, -170, on: device)
        }
    }
    
    private func marketingPreview(
        _ alignment: Alignment,
        _ offset: CGFloat,
        on device: Device
    ) -> some View {
        MarketingPreview(
            device: device,
            offset: offset,
            marketing: { marketing(alignment: alignment) },
            content: content
        )
    }
    
    private func marketing(
        alignment: Alignment
    ) -> some View {
        ZStack(alignment: alignment) {
            Color.orange
            
            Text("This is a preview for the App Store with a long long long long long long long marketing text")
                .multilineTextAlignment(.center)
                .padding()
                .font(.largeTitle.bold())
        }
    }
    
    private func content() -> some View {
        ZStack {
            Color.indigo
            
            TabView {
                tab("Networks", icon: "network")
                tab("Charts", icon: "chart.bar")
                tab("Account", icon: "person")
            }
        }
    }
    
    private func tab(
        _ title: String,
        icon: String
    ) -> some View {
        NavigationView {
            List {
                Section(title) {
                    ForEach(0..<26) { i in
                        Text(String(repeating: "a", count: 1 + i * 20 % 18))
                    }
                }
            }
            .redacted(reason: .placeholder)
            .navigationTitle(title)
        }
        .tabItem {
            Label(title, systemImage: icon)
        }
    }
}
