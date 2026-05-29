//
//  CommonView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct CommonView: View {
    
    // MARK: - Properties
    
    private let contents = WatchaContent.commonMockData
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 13) {
                ForEach(contents) { content in
                    PosterCardView(content: content)
                        .frame(width: 113, height: 158)
                }
            }
            .padding(.leading, 14)
            .padding(.top, 7)
        }
    }
}
