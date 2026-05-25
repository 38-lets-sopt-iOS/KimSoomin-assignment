//
//  WatchaPartyCell.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

class WatchaPartyCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "WatchaPartyCell"
    
    // MARK: - UI Component
    
    private let posterImageView = UIImageView()
    private let bellIconImageView = UIImageView()
    private let timeLabel = UILabel()
    private let hashtagLabel = UILabel()
    
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
        contentView.backgroundColor = .gray600
        
        posterImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        timeLabel.do {
            $0.font = .body1
            $0.textColor = .watchaPink
        }
        
        hashtagLabel.do {
            $0.font = .subhead3
            $0.textColor = .watchaWhite
        }
        
        bellIconImageView.do {
            $0.image = .bellRound
        }
    }
    
    private func setUI() {
        contentView.addSubviews(posterImageView, timeLabel, hashtagLabel, bellIconImageView)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(47)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(8)
        }
        
        hashtagLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.leading.equalTo(timeLabel)
            $0.bottom.equalToSuperview().inset(7)
        }
        
        bellIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(7)
            $0.trailing.equalToSuperview().offset(-5)
            $0.size.equalTo(35)
        }
    }
}

// MARK: - Extension

extension WatchaPartyCell {
    func bindData(image: UIImage?, time: String, hashtag: String) {
        posterImageView.image = image
        timeLabel.text = time
        hashtagLabel.text = hashtag
    }
}
