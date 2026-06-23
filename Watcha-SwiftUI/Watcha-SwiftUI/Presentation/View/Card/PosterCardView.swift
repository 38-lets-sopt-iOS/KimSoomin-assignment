//
//  WatchaPosterCardView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct PosterCardView: View {
    
    // MARK: - Properties
    
    let content: WatchaContent
    var cornerRadius: CGFloat = 10
    
    // MARK: - Body
    
    var body: some View {
        Image(content.imageResource)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
