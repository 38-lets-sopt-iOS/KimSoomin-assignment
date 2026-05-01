//
//  WatchaContentCell.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

class WatchaContentCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "WatchaContentCell"
    
    // MARK: - UI Component
    
    private let posterImageView = UIImageView()
    
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
        posterImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    private func setUI() {
        contentView.addSubview(posterImageView)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}

// MARK: - Extension

extension WatchaContentCell {
    func bindData(image: UIImage?, radius: CGFloat = 10) {
        posterImageView.image = image
        posterImageView.layer.cornerRadius = radius
    }
}
