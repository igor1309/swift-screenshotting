//
//  AppStorePreview.swift
//  Marketing
//
//  Created by Igor Malyarov on 10.09.2022.
//

import Screenshotting
import SwiftUI

/// Create `App Store preview` for a given device size.
///
///     func appStorePreview(on device: Device) -> some View {
///         // ...
///         return AppStorePreview(...)
///     }
///
///     struct AppStorePreview_Previews: PreviewProvider {
///         static let devices = [Device.iPhone13Pro, .iPhone13ProMax]
///         static let locales = [Locale.en_US, .ru_RU]
///
///         static var previews: some View {
///             ForEach(devices, id: \.self) { device in
///                 ForEach(locales, id: \.self) { locale in
///                     appStorePreview(on: device)
///                         .environment(\.locale, locale)
///                 }
///                 .previewDisplayName(device.name)
///             }
///             .previewLayout(.sizeThatFits)
///         }
///     }
///
public struct AppStorePreview<Marketing, Content, Background>: View
where Marketing: View,
      Content: View,
      Background: View {
    
    let device: Device
    let background: Background
    let marketingPlacement: Placement
    let marketing: () -> Marketing
    let content: () -> Content
    
    public init(
        device: Device,
        background: Background,
        marketingPlacement: Placement = .top,
        marketing: @escaping () -> Marketing,
        content: @escaping () -> Content
    ) {
        self.device = device
        self.background = background
        self.marketingPlacement = marketingPlacement
        self.marketing = marketing
        self.content = content
    }
    
    public var body: some View {
        stack()
            .frame(size: device.size)
            .background(background)
    }
    
    @ViewBuilder
    private func stack() -> some View {
        switch marketingPlacement {
        case .top:
            VStack {
                marketing()
                framedContent()
            }
        case .bottom:
            VStack {
                framedContent()
                marketing()
            }
        }
    }
    
    private func framedContent() -> some View {
        Color.clear
            .overlay(alignment: alignment, content: framedOverlay)
    }
    
    private func framedOverlay() -> some View {
        content()
            .statusBar()
            .iPhoneChrome(in: device.size)
            .scaleEffect(0.8, anchor: anchor)
    }
    
    private var alignment: Alignment {
        marketingPlacement.alignment
    }
    
    private var anchor: UnitPoint {
        marketingPlacement.anchor
    }
}

public enum Placement: String, CaseIterable {
    case top, bottom
}

private extension Placement {
    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }
    
    var anchor: UnitPoint {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }
}

struct AppStorePreview_Previews: PreviewProvider {
    static var previews: some View {
        AppStorePreviewDemoView()
    }
}

private extension View {
    func previewDisplayName(
        _ placement: Placement,
        _ device: Device,
        _ colorScheme: ColorScheme
    ) -> some View {
        previewDisplayName("\(placement.rawValue) - \(device.name) | \(colorScheme)")
    }
}

private struct AppStorePreviewDemoView: View {
    let device: Device = .iPhone13Pro
    
    var body: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ForEach(Placement.allCases, id: \.self) { placement in
                appStorePreview(placement, on: device)
                    .previewDisplayName(placement, device, colorScheme)
                    .preferredColorScheme(colorScheme)
            }
        }
        .previewLayout(.sizeThatFits)
    }
    
    private func appStorePreview(
        _ placement: Placement,
        on device: Device
    ) -> some View {
        AppStorePreview(
            device: device,
            background: Color.orange,
            marketingPlacement: placement,
            marketing: marketing,
            content: content
        )
    }
    
    private func marketing() -> some View {
        VStack(spacing: 16) {
            Text("This is a preview for the App Store with a long long long long long long long marketing text")
            
            Label("And image", systemImage: "shippingbox")
                .foregroundColor(.indigo)
        }
        .multilineTextAlignment(.center)
        .padding()
        .font(.largeTitle.bold())
    }
    
    private func content() -> some View {
        TabView {
            tab("Networks", icon: "network")
            tab("Charts", icon: "chart.bar")
            tab("Account", icon: "person")
        }
    }
    
    private func tab(
        _ title: String,
        icon: String
    ) -> some View {
        NavigationView {
            List(content: list)
                .redacted(reason: .placeholder)
                .navigationTitle(title)
        }
        .tabItem {
            Label(title, systemImage: icon)
        }
    }
    
    private func list() -> some View {
        Section("Section Header") {
            ForEach(0..<26) { i in
                Text(String(repeating: "a", count: 1 + i * 20 % 18))
            }
        }
    }
}
