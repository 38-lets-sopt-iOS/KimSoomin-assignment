//
//  PartyCardView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct PartyCardView: View {
    
    // MARK: - Property
    
    let content: WatchaContent
    
    // MARK: - Body
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                imageSection
                textSection
            }
            .frame(width: 196, height: 185, alignment: .top)
            .background(.gray600)
        }
}

private extension PartyCardView {
    var imageSection: some View {
        ZStack(alignment: .topTrailing) {
            Image(content.imageResource)
                .resizable()
                .scaledToFill()
                .frame(width: 196, height: 135)
            
            Image(.bellRound)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .padding([.top, .trailing], 8)
        }
    }
    
    var textSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("오늘 \(content.time ?? "?")에 시작")
                .foregroundStyle(.watchaPink)
                .font(.body1)
            
            Text(content.title ?? "?")
                .foregroundStyle(.watchaWhite)
                .font(.subhead3)
        }
        .padding(.leading, 8)
        .padding(.top, 6)
    }
}
