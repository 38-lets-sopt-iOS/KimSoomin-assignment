//
//  StickyHeaderView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct StickyHeaderView: View {
    
    // MARK: - Properties
    
    let progress: CGFloat
    
    private var titleFont: Font {
        return progress > 0.5 ? .head2 : .head1
    }
    
    private var bottomPadding: CGFloat {
        return 15 - (7 * progress)
    }
    
    private var textYOffset: CGFloat {
        return 4 * progress
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("구독")
                .font(titleFont)
                .foregroundColor(.white)
                .padding(.leading, 28)
                .padding(.bottom, bottomPadding)
                .offset(y: textYOffset)
                .animation(.easeInOut(duration: 0.15), value: titleFont)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50, alignment: .bottom)
        .overlay(
            VStack {
                Spacer()
                Rectangle()
                    .fill(.gray700)
                    .frame(height: 1)
            }
        )
    }
}
