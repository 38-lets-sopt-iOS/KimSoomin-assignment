//
//  LoginViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import Then
import SnapKit

final class LoginViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "로그인/가입하려는\n이메일을 입력해주세요"
        $0.textColor = .watchaWhite
        $0.font = .head2
        $0.numberOfLines = 2
    }
    
    private let subTitleLabel = UILabel().then {
        let text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.paragraphStyle,
                                      value: style,
                                      range: NSRange(location: 0, length: attributedString.length))
        $0.attributedText = attributedString
        $0.textColor = .gray50
        $0.font = .body1
        $0.numberOfLines = 2
    }
    
    private let emailTextField = AuthTextField().then {
        $0.type = .email
    }
    
    private lazy var nextButton = AuthButton().then {
        $0.style = .next
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBind()
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.backgroundColor = .watchaBlack
        
        view.addSubviews(titleLabel, subTitleLabel, emailTextField, nextButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(30)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(30)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(26)
            $0.horizontalEdges.equalToSuperview().inset(31)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
        }
    }
    
    // MARK: - Private Methods
    
    private func setBind() {
        emailTextField.onTextChange = { [weak self] text in
            guard let self = self else { return }
            
            let isValid = text.isValidEmail
            
            self.emailTextField.isSuccess = isValid
            self.nextButton.isEnabled = isValid
        }
    }
    
    private func pushToPasswordViewController() {
        let viewController = PasswordEnterViewController()
        viewController.bindEmail(email: emailTextField.textField.text)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Action
    
    @objc private func nextButtonTapped() {
        guard nextButton.isEnabled else { return }
        pushToPasswordViewController()
    }
}

