//
//  EmptyView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct EmptyView: View {
    
    // MARK: - Property
    
    let title: String
    
    // MARK: - Body

    var body: some View {
        ZStack {
            Color.watchaBlack.ignoresSafeArea()
            Text("\(title) 🛠️")
                .font(.head2)
                .foregroundColor(.watchaWhite)
        }
    }
}
