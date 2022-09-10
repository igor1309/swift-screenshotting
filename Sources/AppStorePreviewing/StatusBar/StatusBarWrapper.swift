//
//  StatusBarWrapper.swift
//  Marketing
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI

public extension View {
    func statusBar() -> some View {
        self.modifier(StatusBarWrapper())
    }
}

struct StatusBarWrapper: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top, content: statusBar)
    }
    
    //  iPhone 13 Pro status bar height is 47
    private func statusBar() -> some View {
        StatusBar()
            .frame(height: 47)
        // .offset(y: -2)
            .ignoresSafeArea()
    }
    
    private func roundedRectangle(grid: CGFloat) -> some Shape {
        RoundedRectangle(cornerRadius: 4 * grid, style: .continuous)
    }
}

struct StatusBarWrapper_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                Color(uiColor: .secondarySystemBackground)
                
                Color(uiColor: .secondarySystemBackground)
                    .preferredColorScheme(.dark)
            }
            .frame(height: 47)
            .statusBar()
            .overlay(rectangle47)
            
            Color(uiColor: .secondarySystemBackground)
                .statusBar()
                .overlay(alignment: .top) { rectangle47 }
                .frame(height: 400)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
    
    static var rectangle47: some View {
        Rectangle()
            .strokeBorder(.pink.opacity(0.5), style: .init(lineWidth: 1))
            .frame(height: 47)
            .overlay(line)
    }
    
    static var line: some View {
        Rectangle()
            .fill(.pink.opacity(0.5))
            .frame(height: 1)
    }
}
