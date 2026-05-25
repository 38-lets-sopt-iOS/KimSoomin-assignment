//
//  EmptyViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class EmptyViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    // MARK: - Initializer
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    override func setStyle() {
        view.backgroundColor = .watchaBlack
        
        titleLabel.do {
            $0.font = .head3
            $0.textColor = .white
            $0.textAlignment = .center
        }
    }
    
    override func setUI() {
        view.addSubview(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
