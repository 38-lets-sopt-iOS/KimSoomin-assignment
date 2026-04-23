//
//  PasswordEnterViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import Then
import SnapKit

final class PasswordEnterViewController: BaseUIViewController {
    
    // MARK: - Property
    
    private var userNickname: String?
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "사용할 비밀번호를\n입력해주세요"
        $0.textColor = .watchaWhite
        $0.font = .head2
        $0.numberOfLines = 2
    }
    
    private let subTitleLabel = UILabel().then {
        $0.textColor = .gray50
        $0.font = .body1
        $0.numberOfLines = 2
    }
    
    private let passwordTextField = AuthTextField().then {
        $0.type = .password
    }
    
    private let validCheckStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 6
    }
    
    private lazy var registerButton = AuthButton().then {
        $0.style = .register
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private let checkIcon = UIImageView().then {
        $0.image = .enableOff
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.textColor = .gray100
        $0.font = .body2
    }
    
    private lazy var nicknameSettingButton = UIButton().then {
        $0.setTitle("닉네임 설정", for: .normal)
        $0.setTitleColor(.gray100, for: .normal)
        $0.titleLabel?.font = .body2
        $0.addTarget(self, action: #selector(nicknameSettingButtonTapped), for: .touchUpInside)
    }
    
    private let grayLineView = UIView().then {
        $0.backgroundColor = .gray100
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.backgroundColor = .watchaBlack
        
        view.addSubviews(titleLabel, subTitleLabel, passwordTextField, validCheckStackView, nicknameSettingButton, grayLineView, registerButton)
        validCheckStackView.addArrangedSubviews(checkIcon, descriptionLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(30)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(30)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(44)
            $0.horizontalEdges.equalToSuperview().inset(31)
        }
        
        checkIcon.snp.makeConstraints {
            $0.size.equalTo(13)
        }
        
        validCheckStackView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(35)
        }
        
        nicknameSettingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(validCheckStackView.snp.bottom).offset(40)
        }
        
        grayLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nicknameSettingButton.snp.bottom).offset(-6)
            $0.width.equalTo(55)
            $0.height.equalTo(1)
        }
        
        registerButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
        }
    }
    
    // MARK: - Private Methods
    
    private func setBind() {
        passwordTextField.onTextChange = { [weak self] text in
            guard let self = self else { return }
            
            let isValid = text.isValidPassword
            
            self.passwordTextField.isSuccess = isValid
            self.registerButton.isEnabled = isValid
            
            if isValid {
                checkIcon.image = .enableOn
                descriptionLabel.textColor = .watchaGreen
            }
            else {
                checkIcon.image = .enableOff
                descriptionLabel.textColor = .gray100
            }
        }
    }
    
    private func presentToNicknameBottomSheet() {
        let viewController = NicknameSettingBottmSheet()
        viewController.modalPresentationStyle = .overFullScreen
        viewController.delegate = self
        self.present(viewController, animated: true)
    }
    
    private func pushToWelcomeViewController() {
        let viewController = WelcomeViewController()
        viewController.bindNickname(nickname: userNickname)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Public Method
    
    func bindEmail(email: String?) {
        if let email = email {
            subTitleLabel.text = "\(email)로 가입중"
        }
        else {
            subTitleLabel.text = "가입중"
        }
    }
    
    // MARK: - Actions
    
    @objc func nicknameSettingButtonTapped() {
        presentToNicknameBottomSheet()
    }
    
    @objc func registerButtonTapped() {
        pushToWelcomeViewController()
    }
}

// MARK: - Extension

extension PasswordEnterViewController: CompleteNicknameSettingDelegate {
    func setNickname(nickname: String) {
        self.userNickname = nickname
        nicknameSettingButton.setTitle("\(nickname)", for: .normal)
        grayLineView.isHidden = true
    }
}

