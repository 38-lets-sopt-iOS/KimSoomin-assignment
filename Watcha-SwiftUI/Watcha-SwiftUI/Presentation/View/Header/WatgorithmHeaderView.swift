//
//  WatgorithmHeaderView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct WatgorithmHeaderView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Image(.watgorhithm)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 79, height: 25.5)
                .padding(.leading, 24)
            
            HStack(alignment: .bottom) {
                Text("예능부터 드라마까지!")
                    .font(.head3)
                    .foregroundColor(.watchaWhite)
                    .padding(.leading, 26)
                    .padding(.top, 8.5)
                
                Spacer()
                
                Text("더보기")
                    .font(.cap1)
                    .foregroundColor(.gray10)
                    .padding(.bottom, 11)
                    .padding(.trailing, 22)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding(.top, 45)
    }
}
