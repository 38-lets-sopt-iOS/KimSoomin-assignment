//
//  FloatingUpdateView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct FloatingUpdateView: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(.ticket)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .padding(.top, 11)
                .padding(.leading, 16)
            
            VStack(alignment: .leading) {
                Text("매주 500편 이상 신작 업데이트!")
                    .font(.subhead2)
                    .foregroundColor(.watchaWhite)
                    .padding(.top, 14)
                
                Text("지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요")
                    .font(.body2)
                    .foregroundColor(.watchaWhite)
                    .padding(.top, 3)
                
                Text("구독 시작하기")
                    .font(.body2)
                    .foregroundColor(.watchaWhite)
                    .padding(.top, 13)
                    .padding(.bottom, 10)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.watchaPink)
        .cornerRadius(10)
        .padding(.horizontal, 12)
    }
}
