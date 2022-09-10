//
//  IPhoneChromeWrapper.swift
//  Marketing
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI
import Screenshotting

public extension View {
    func iPhoneChrome(in size: CGSize) -> some View {
        self.modifier(IPhoneChromeWrapper(size: size))
    }
}

struct IPhoneChromeWrapper: ViewModifier {
    let size: CGSize
    
    func body(content: Content) -> some View {
        content
            .frame(size: size)
            .clipShape(roundedRectangle(grid: 11))
            .padding(4 * 4.5)
            .background(.black)
            .clipShape(roundedRectangle(grid: 14))
            .overlay(roundedRectangle(grid: 15).stroke(.darkGray, lineWidth: 4))
            .padding(2)
            .overlay(roundedRectangle(grid: 15.5).stroke(.lightGray, lineWidth: 1))
    }
    
    private func roundedRectangle(grid: CGFloat) -> some Shape {
        RoundedRectangle(cornerRadius: 4 * grid, style: .continuous)
    }
}

struct IPhoneChromeWrapper_Previews: PreviewProvider {
    static let device: Device = .iPhone13Pro
    
    static var previews: some View {
        chromed()
            .frame(size: device.size.padding(88))
            .background(.black)
            .previewLayout(.sizeThatFits)
    }
    
    static private func chromed() -> some View {
        Group {
            list()
            list().preferredColorScheme(.dark)
        }
        .iPhoneChrome(in: device.size)
    }
    
    static private func list() -> some View {
        TabView {
            NavigationView {
                List {
                    Section("Networks Section") {
                        ForEach(0..<26, content: row)
                    }
                }
                .navigationBarTitle("Navigation Title")
            }
            .tabItem {
                Label("Star", systemImage: "star")
            }
            
            Text("Wi-Fi")
                .tabItem {
                    Label("Wi-Fi", systemImage: "wifi")
                }
        }
        .redacted(reason: .placeholder)
    }
    
    static private func row(n: Int) -> some View {
        Text(String(repeating: "a", count: 11 + n * 23 % 38))
    }
}


extension ShapeStyle where Self == Color {
    static var lightGray: Self { .lightGray }
    static var darkGray: Self { .darkGray }
}

extension Color {
    static var lightGray: Self {
        .gray.opacity(0.85)
    }
    
    static var darkGray: Self {
        .init(red: 44/255, green: 44/255, blue: 44/255)
    }
}
