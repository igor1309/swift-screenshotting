//
//  CellularBars.swift
//  Marketing
//
//  Created by Igor Malyarov on 08.09.2022.
//

import SwiftUI

struct CellularBars: View {
    let barsCount = 4
    let minimumHeightRatio = CGFloat(0.5)
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: 1) {
                ForEach(0...barsCount-1, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 1, style: .continuous)
                        .frame(height: proxy.size.height * heightRatio(at: index))
                }
            }
        }
        .aspectRatio(1.71, contentMode: .fit)
    }
    
    private func heightRatio(at index: Int) -> CGFloat {
        let leftover = 1.0 - minimumHeightRatio
        let step = leftover / CGFloat(barsCount - 1)
        return minimumHeightRatio + CGFloat(index) * step
    }
}

struct CellularBars_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CellularBars()
            
            CellularBars()
                .frame(height: 32)
        }
        .previewLayout(.sizeThatFits)
    }
}
