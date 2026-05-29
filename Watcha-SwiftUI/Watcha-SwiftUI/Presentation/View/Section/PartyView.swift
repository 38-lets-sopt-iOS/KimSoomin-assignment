//
//  PartyView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct PartyView: View {
    
    // MARK: - Properties
    
    private let contents = WatchaContent.partyMockData
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(contents) { content in
                    PartyCardView(content: content)
                }
            }
            .padding(.leading, 17)
            .padding(.top, 15)
        }
    }
}
