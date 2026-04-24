//
//  AuthButton.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import SnapKit

enum ButtonStyle {
    case next
    case register
    case complete
    case main
    
    var title: String {
        switch self {
        case .next:
            return "다음"
        case .register:
            return "가입하기"
        case .complete:
            return "완료"
        case .main:
            return "메인으로"
        }
    }
}

class AuthButton: UIButton {
    
    // MARK: - Properties
    
    var style: ButtonStyle = .next {
        didSet {
            updateStyle()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            updateBackgroundColor()
        }
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        
        updateStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.titleLabel?.font = .medium
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(56)
        }
    }
    
    // MARK: - Private Methods
    
    private func updateStyle() {
        self.setTitle(style.title, for: .normal)
        
        if style == .complete {
            self.setTitleColor(.watchaWhite, for: .normal)
            self.setTitleColor(.watchaWhite, for: .disabled)
                backgroundColor = .gray600
        } else {
            self.setTitleColor(.watchaWhite, for: .normal)
            self.setTitleColor(.gray200, for: .disabled)
        }
        
        updateBackgroundColor()
    }
    
    private func updateBackgroundColor() {
        if style == .complete {
        } else {
            backgroundColor = isEnabled ? .watchaPink : .gray400
        }
    }
}
