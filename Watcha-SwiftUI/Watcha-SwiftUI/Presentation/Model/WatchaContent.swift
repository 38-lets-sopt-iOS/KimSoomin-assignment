//
//  WatchaContent.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct WatchaContent: Identifiable {
    let id = UUID()
    let imageResource: ImageResource
    let time: String?
    let title: String?
    
    init(imageResource: ImageResource, time: String? = nil, title: String? = nil) {
        self.imageResource = imageResource
        self.time = time
        self.title = title
    }
}

// MARK: - Mock

extension WatchaContent {
    static let bannerMockData: [WatchaContent] = [
        WatchaContent(imageResource: .main1),
        WatchaContent(imageResource: .main2),
        WatchaContent(imageResource: .main3),
        WatchaContent(imageResource: .main4),
        WatchaContent(imageResource: .main5)
    ]
    
    static let wideMockData: [WatchaContent] = [
        WatchaContent(imageResource: .wide1),
        WatchaContent(imageResource: .wide2),
        WatchaContent(imageResource: .wide3),
        WatchaContent(imageResource: .wide4),
        WatchaContent(imageResource: .wide5)
    ]
    
    static let commonMockData: [WatchaContent] = [
        WatchaContent(imageResource: .main2), WatchaContent(imageResource: .main4),
        WatchaContent(imageResource: .main5), WatchaContent(imageResource: .main1),
        WatchaContent(imageResource: .main3), WatchaContent(imageResource: .main2),
        WatchaContent(imageResource: .main4), WatchaContent(imageResource: .main5),
        WatchaContent(imageResource: .main1), WatchaContent(imageResource: .main3)
    ]
    
    static let partyMockData: [WatchaContent] = [
        WatchaContent(imageResource: .party1, time: "21:13", title: "# 왕과 사는 남자"),
        WatchaContent(imageResource: .party2, time: "22:22", title: "# 파묘"),
        WatchaContent(imageResource: .party3, time: "19:00", title: "# 서울의 봄"),
        WatchaContent(imageResource: .party1, time: "21:13", title: "# 왕과 사는 남자"),
        WatchaContent(imageResource: .party2, time: "22:22", title: "# 파묘"),
    ]
}
