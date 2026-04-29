//
//  AuthButton.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import SnapKit

enum ButtonStyle {
    case next, register, complete, main
    
    var title: String {
        switch self {
        case .next: return "다음"
        case .register: return "가입하기"
        case .complete: return "완료"
        case .main: return "메인으로"
        }
    }
    
    func backgroundColor(isEnabled: Bool) -> UIColor {
        if self == .complete {
            return .gray600
        }
        return isEnabled ? .watchaPink : .gray400
    }
    
    func titleColor(isEnabled: Bool) -> UIColor {
        if self == .complete {
            return .watchaWhite
        }
        return isEnabled ? .watchaWhite : .gray200
    }
}

class AuthButton: UIButton {
    
    // MARK: - Properties
    
    var style: ButtonStyle = .next {
        didSet {
            updateButtonStyle()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
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
    
    private func updateButtonStyle() {
        self.setTitle(style.title, for: .normal)
        
        self.backgroundColor = style.backgroundColor(isEnabled: self.isEnabled)
        
        self.setTitleColor(style.titleColor(isEnabled: true), for: .normal)
        self.setTitleColor(style.titleColor(isEnabled: false), for: .disabled)
    }
}
