//
//  WatchaTab.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

enum WatchaTab: Int, CaseIterable {
    case subscription = 0
    case buy
    case webtoon
    case search
    case folder
    
    var title: String {
        switch self {
        case .subscription: 
            return "구독"
        case .buy:          
            return "개별 구매"
        case .webtoon:      
            return "웹툰"
        case .search:       
            return "찾기"
        case .folder:       
            return "보관함"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .subscription:
            return .subscription
        case .buy:
            return .buy
        case .webtoon:
            return .webtoon
        case .search:
            return .search
        case .folder:
            return .folder
        }
    }
    
    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .subscription:
          EmptyView(title: self.title)
        case .buy, .webtoon, .search, .folder:
            EmptyView(title: self.title)
        }
    }
}
