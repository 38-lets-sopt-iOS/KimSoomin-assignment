//
//  MainHeaderView.swift
//  Watcha-Clone
//
//  Created by mandoo on 5/1/26.
//

import UIKit

import SnapKit
import Then

final class StickyHeaderView: BaseUIView {
    
    // MARK: - UI Components
    
    let titleLabel = UILabel()
    let grayLineView = UIView()
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        backgroundColor = .watchaBlack
        
        titleLabel.do {
            $0.text = "구독"
            $0.font = .head1
            $0.textColor = .white
        }
        
        grayLineView.do {
            $0.backgroundColor = .gray700
        }
    }
    
    override func setUI() {
        addSubviews(titleLabel, grayLineView)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().offset(28)
        }
        
        grayLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(-20)
            $0.height.equalTo(1)
        }
    }
}
