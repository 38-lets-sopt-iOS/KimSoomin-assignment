//
//  ContentModel.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

struct ContentModel {
    let posterImage: UIImage
    let time: String?
    let title: String?
    
    init(posterImage: UIImage, time: String? = nil, title: String? = nil) {
        self.posterImage = posterImage
        self.time = time
        self.title = title
    }
}

extension ContentModel {
    static func mainMockData() -> [ContentModel] {
        return [
            ContentModel(posterImage: .main1),
            ContentModel(posterImage: .main2),
            ContentModel(posterImage: .main3),
            ContentModel(posterImage: .main4),
            ContentModel(posterImage: .main5)
        ]
    }
    
    static func wideMockData() -> [ContentModel] {
        return [
            ContentModel(posterImage: .wide1),
            ContentModel(posterImage: .wide2),
            ContentModel(posterImage: .wide3),
            ContentModel(posterImage: .wide4),
            ContentModel(posterImage: .wide5)
        ]
    }
    
    static func posterMockData() -> [ContentModel] {
        return [
            ContentModel(posterImage: .main2),
            ContentModel(posterImage: .main4),
            ContentModel(posterImage: .main5),
            ContentModel(posterImage: .main1),
            ContentModel(posterImage: .main3),
            ContentModel(posterImage: .main2),
            ContentModel(posterImage: .main4),
            ContentModel(posterImage: .main5),
            ContentModel(posterImage: .main1),
            ContentModel(posterImage: .main3)
        ]
    }
    
    static func watchaPartyMockData() -> [ContentModel] {
        return [
            ContentModel(posterImage: .party1, time: "21:13", title: "# 왕과 사는 남자"),
            ContentModel(posterImage: .party2, time: "22:22", title: "# 파묘"),
            ContentModel(posterImage: .party3, time: "18:30", title: "# 너의 이름은"),
            ContentModel(posterImage: .party3, time: "19:00", title: "# 서울의 봄"),
            ContentModel(posterImage: .party3, time: "20:30", title: "# 해리포터 불의 잔"),
        ]
    }
}
