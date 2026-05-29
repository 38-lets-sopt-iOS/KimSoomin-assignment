//
//  WelcomeView.swift
//  Watcha-SwiftUI
//
//  Created by mandoo on 5/27/26.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Properties
    
    @State private var navigateToMain = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.watchaBlack
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 85)
                        .padding(.horizontal, 28)
                    
                    Text("수민님\n가입을 환영합니다!")
                        .font(.head2)
                        .foregroundColor(.watchaWhite)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.top, 54)
                    
                    Spacer()
                    
                    WelcomeButton {
                        navigateToMain = true
                    }
                    .padding(.horizontal, 22)
                    .padding(.bottom, 47)
                }
            }
            .navigationDestination(isPresented: $navigateToMain) {
                WatchaTabBarView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
