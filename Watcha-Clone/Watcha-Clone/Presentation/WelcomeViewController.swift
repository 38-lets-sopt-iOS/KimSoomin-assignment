//
//  WelcomeViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import Then
import SnapKit

final class WelcomeViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let logoImageView = UIImageView().then {
        $0.image = .logo
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.font = .head2
        $0.textColor = .watchaWhite
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    private let goToMainButton = AuthButton().then {
        $0.style = .main
        $0.isEnabled = true
    }
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.backgroundColor = .watchaBlack
        view.addSubviews(logoImageView, welcomeLabel, goToMainButton)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(85)
            $0.horizontalEdges.equalToSuperview().inset(28)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
        }
        
        goToMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
        }
    }
    
    // MARK: - Public Method
    
    func bindNickname(nickname: String?) {
        if let nickname = nickname {
            welcomeLabel.text = "\(nickname)님\n가입을 환영합니다!"
        }
        else {
            welcomeLabel.text = "가입을 환영합니다!"
        }
    }
}

