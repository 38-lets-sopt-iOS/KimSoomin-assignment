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
    private let iconStackView = UIStackView()
    
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
        
        iconStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
            $0.spacing = 20
        }
    }
    
    override func setUI() {
        iconStackView.addArrangedSubviews(videoIconImageView, bellIconImageView, profileIconImageView)
        addSubviews(iconStackView)
    }
    
    override func setLayout() {
        iconStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview()
        }
    }
}
