//
//  IPhoneChromeWrapper.swift
//  Screenshotting
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI

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
            .overlay(roundedRectangle(grid: 15.5).stroke(.gray.opacity(0.85), lineWidth: 1))
    }
    
    private func roundedRectangle(grid: CGFloat) -> some Shape {
        RoundedRectangle(cornerRadius: 4 * grid, style: .continuous)
    }
}

struct IPhoneChromeWrapper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Color(uiColor: .secondarySystemBackground)
            
            Color(uiColor: .secondarySystemBackground)
                .preferredColorScheme(.dark)
        }
        .iPhoneChrome(in: .iPhone13ProMax)
        .frame(size: .iPhone13ProMax.padding(88))
        .background(.orange)
        .previewLayout(.sizeThatFits)
    }
}

extension ShapeStyle where Self == Color {
    static var darkGray: Self {
        .darkGray
    }
}

extension Color {
    static var darkGray: Self {
        .init(red: 44/255, green: 44/255, blue: 44/255)
    }
}
