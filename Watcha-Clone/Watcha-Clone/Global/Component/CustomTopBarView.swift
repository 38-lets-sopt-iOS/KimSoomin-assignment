//
//  CustomTopBarView.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

final class CustomTopBarView: BaseUIView {
    
    // MARK: - UI Components
    
    private let videoIconImageView = UIImageView()
    private let bellIconImageView = UIImageView()
    private let profileIconImageView = UIImageView()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        backgroundColor = .clear
        
        videoIconImageView.do {
            $0.image = .video
        }
        
        bellIconImageView.do {
            $0.image = .notification
        }
        
        profileIconImageView.do {
            $0.image = .profile
        }
    }
    
    override func setUI() {
        addSubviews(videoIconImageView, bellIconImageView, profileIconImageView)
    }
    
    override func setLayout() {
        profileIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.trailing.equalToSuperview().inset(30)
            $0.size.equalTo(24)
        }
        
        bellIconImageView.snp.makeConstraints {
            $0.top.equalTo(profileIconImageView)
            $0.trailing.equalTo(profileIconImageView.snp.leading).offset(-20)
            $0.size.equalTo(24)
        }
        
        videoIconImageView.snp.makeConstraints {
            $0.top.equalTo(profileIconImageView)
            $0.trailing.equalTo(bellIconImageView.snp.leading).offset(-20)
            $0.size.equalTo(24)
        }
    }
}
