//
//  BannerView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct BannerView: View {
    
    // MARK: - Properties
    
    private let contents = WatchaContent.bannerMockData
    private var sidePadding: CGFloat {
        (UIScreen.main.bounds.width - 300) / 2
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(contents) { content in
                    PosterCardView(content: content)
                        .frame(width: 300, height: 430)
                }
            }
            .scrollTargetLayout()
            .padding(.horizontal, sidePadding)
        }
        .scrollTargetBehavior(.viewAligned)
        .frame(height: 430)
        .padding(.top, 28)
    }
}
