//
//  SubscriptionView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct SubscriptionView: View {
    
    // MARK: - Properties
    
    @State private var scrollOffset: CGFloat = 0
    
    private var progress: CGFloat {
        let threshold: CGFloat = 50.0
        return min(1, max(0, -scrollOffset / threshold))
    }
    
    private var topOffset: CGFloat {
        return -(31 * progress)
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    Color.clear.frame(height: 155)
                    
                    BannerView()
                    
                    WideHeaderView()
                    WideView()
                    
                    WatgorithmHeaderView()
                    CommonView()
                    
                    CommonHeaderView(title: "공개 예정 콘텐츠")
                    CommonView()
                        .padding(.top, 8)
                    
                    CommonHeaderView(title: "왓챠 파티")
                    PartyView()
                        .padding(.bottom, 130)
                }
                .overlay(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: geometry.frame(in: .named("scroll")).minY
                            )
                    },
                    alignment: .top
                )
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.scrollOffset = value
            }
            
            VStack {
                NavigationTopBarView()
                    .background(.watchaBlack)
                
                StickyHeaderView(progress: progress)
                    .offset(y: topOffset)
                    .background(.watchaBlack)
            }
            .padding(.bottom, topOffset)
            .background(.watchaBlack)
            .clipped()
            
            VStack {
                Spacer()
                
                FloatingUpdateView()
                    .padding(.bottom, 14)
            }
        }
        .background(.watchaBlack)
        .ignoresSafeArea(edges: .top)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
