//
//  WatchaTabBarView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct WatchaTabBarView: View {
    
    // MARK: - Property
    
    @State private var selectedTab: WatchaTab = .subscription
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .subscription:
                    NavigationStack {
                        SubscriptionView()
                    }
                case .buy, .webtoon, .search, .folder:
                    NavigationStack { EmptyView(title: selectedTab.title) }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 99)
            
            VStack {
                Rectangle()
                    .fill(.gray700)
                    .frame(height: 0.5)
                
                HStack {
                    ForEach(WatchaTab.allCases, id: \.self) { tab in
                        Button {
                            selectedTab = tab
                        } label: {
                            VStack(alignment: .center, spacing: 9) {
                                Image(tab.icon)
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(selectedTab == tab ? .watchaWhite : .gray500)
                                    .frame(width: 24, height: 24)
                                
                                Text(tab.title)
                                    .font(.body2)
                                    .foregroundColor(selectedTab == tab ? .watchaWhite : .gray500)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 14)
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                Spacer()
            }
            .background(.watchaBlack)
            .frame(height: 99)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}
