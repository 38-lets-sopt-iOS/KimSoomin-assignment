//
//  StartSupscriptionView.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class StartSupscriptionView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let ticketIconImageView = UIImageView()
    private let startSubscriptionButton = UIButton()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        backgroundColor = .watchaPink
        
        titleLabel.do {
            $0.font = .subhead2
            $0.textColor = .watchaWhite
            $0.text = "매주 500편 이상 신작 업데이트!"
        }
        
        subTitleLabel.do {
            $0.font = .body2
            $0.textColor = .watchaWhite
            $0.text = "지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요"
        }
        
        ticketIconImageView.do {
            $0.image = .ticket
            $0.contentMode = .scaleAspectFit
        }
        
        startSubscriptionButton.do {
            $0.setTitle("구독 시작하기", for: .normal)
            $0.setTitleColor(.watchaWhite, for: .normal)
            $0.titleLabel?.font = .body2
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, subTitleLabel, ticketIconImageView, startSubscriptionButton)
    }
    
    override func setLayout() {
        ticketIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalTo(ticketIconImageView.snp.trailing).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.leading.equalTo(titleLabel)
        }
        
        startSubscriptionButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
