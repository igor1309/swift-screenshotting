//
//  StatusBar.swift
//  AppStoreScreenshotPreview
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI

struct StatusBar: View {
    var body: some View {
        HStack(spacing: 2) {
            Text("9:41")
            
            Spacer()
            
            CellularBars()
                .frame(height: 10)
            Image(systemName: "wifi")
            Image(systemName: "battery.100")
        }
        .font(.system(size: 16).monospacedDigit().bold())
        .padding()
        .padding(.leading)
        .ignoresSafeArea()
    }
}

struct StatusBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatusBar()
            StatusBar()
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
