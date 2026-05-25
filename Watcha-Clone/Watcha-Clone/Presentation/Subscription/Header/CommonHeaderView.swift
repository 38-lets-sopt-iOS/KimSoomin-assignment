//
//  CommonHeaderView.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

class CommonHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "CommonHeaderView"
    
    // MARK: - UI Component
    
    private let titleLabel = UILabel()
    private let moreButton = UIButton()
    
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
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.gray10, for: .normal)
            $0.titleLabel?.font = .cap1
        }
    }
    
    private func setUI() {
        addSubviews(titleLabel, moreButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
        }
    }
}

// MARK: - Extension

extension CommonHeaderView {
    func configure(title: String) {
        titleLabel.text = title
    }
}
