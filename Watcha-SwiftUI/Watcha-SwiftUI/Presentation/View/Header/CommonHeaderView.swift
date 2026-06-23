//
//  CommonHeaderView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct CommonHeaderView: View {
    
    // MARK: - Property
    
    let title: String
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.head3)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("더보기")
                .font(.cap1)
                .foregroundColor(.gray10)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 22)
        .padding(.top, 45)
    }
}
