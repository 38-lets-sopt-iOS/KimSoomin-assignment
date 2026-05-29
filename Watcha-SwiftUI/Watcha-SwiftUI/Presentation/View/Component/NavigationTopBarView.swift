//
//  NavigationTopBarView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//

import SwiftUI

struct NavigationTopBarView: View {
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            HStack(spacing: 20) {
                Image(.video)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Image(.notification)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
            }
            .padding(.trailing, 30)
            .padding(.top, 60)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 105, alignment: .bottom)
    }
}
