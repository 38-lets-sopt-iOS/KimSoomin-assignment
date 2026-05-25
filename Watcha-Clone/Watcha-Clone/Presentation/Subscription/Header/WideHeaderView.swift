//
//  WideHeaderView.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

class WideHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "WideHeaderView"
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .head3
            $0.textColor = .white
        }
        
        subTitleLabel.do {
            $0.font = .subhead1
            $0.textColor = .gray10
        }
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, subTitleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
    }
}

// MARK: - Extension

extension WideHeaderView {
    func configure(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
