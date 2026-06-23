//
//  WelcomeButton.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/29/26.
//


import SwiftUI

struct WelcomeButton: View {
    
    // MARK: - Property
    
    var action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            Text("메인으로")
                .font(.medium)
                .foregroundColor(.watchaWhite)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(.watchaPink)
                .cornerRadius(10)             
        }
    }
}
