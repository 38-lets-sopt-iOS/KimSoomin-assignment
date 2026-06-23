//
//  WideView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct WideView: View {
    
    // MARK: - Properties
    
    private let contents = WatchaContent.wideMockData
    
    // MARK: - Body
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let cardWidth = screenWidth * 0.85
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(contents) { content in
                    PosterCardView(content: content)
                        .frame(width: cardWidth, height: 180)
                }
            }
            .padding(.horizontal, (screenWidth - cardWidth) / 2)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .padding(.top, 15)
    }
}
