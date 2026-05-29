//
//  WideHeaderView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct WideHeaderView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("방금 막 도착한 신상 컨텐츠")
                .font(.head3)
                .foregroundStyle(.white)
            
            Text("예능부터 드라마까지")
                .font(.subhead1)
                .foregroundStyle(.gray10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
        .padding(.top, 34)
    }
}
