//
//  WatgorithmHeaderView.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

class WatgorithmHeaderView: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "WatgorithmHeaderView"
    
    // MARK: - UI Components
    
    private let watgorithmImageView = UIImageView()
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
        watgorithmImageView.do {
            $0.image = .watgorhithm
        }
        
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
        addSubviews(watgorithmImageView, titleLabel, moreButton)
    }
    
    private func setLayout() {
        watgorithmImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(79)
            $0.height.equalTo(25.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(watgorithmImageView).offset(2)
            $0.top.equalTo(watgorithmImageView.snp.bottom).offset(8.5)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(watgorithmImageView.snp.bottom).offset(4.5)
            $0.trailing.equalToSuperview()
        }
    }
}

// MARK: - Extension

extension WatgorithmHeaderView {
    func configure(title: String) {
        titleLabel.text = title
    }
}
