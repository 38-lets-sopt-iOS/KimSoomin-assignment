//
//  NicknameSettingBottmSheet.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/23/26.
//

import UIKit

import Then
import SnapKit

protocol CompleteNicknameSettingDelegate: AnyObject {
    func setNickname(nickname: String)
}

final class NicknameBottmSheetViewController: BaseUIViewController {
    
    // MARK: - Properties
    
    private var nickname: String?
    weak var delegate: CompleteNicknameSettingDelegate?
    
    // MARK: - UI Components
    
    private let backgroundView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .gray400
        $0.layer.cornerRadius = 12
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.clipsToBounds = true
    }
    
    private let indicatorBar = UIView().then {
        $0.backgroundColor = .watchaWhite.withAlphaComponent(0.05)
        $0.layer.cornerRadius = 2.5
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = .subhead1
        $0.textColor = .watchaWhite
    }
    
    private let nicknameTextField = AuthTextField().then {
        $0.type = .nickname
    }
    
    private lazy var completeButton = AuthButton().then {
        $0.style = .complete
        $0.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        view.backgroundColor = .clear
        
        view.addSubviews(backgroundView, contentView)
        contentView.addSubviews(indicatorBar, titleLabel, nicknameTextField, completeButton)
    }
    
    override func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.45)
        }
        
        indicatorBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(5)
            $0.width.equalTo(35)
            $0.height.equalTo(5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(42)
            $0.leading.equalToSuperview().inset(24)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.horizontalEdges.equalToSuperview().inset(31)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
        }
    }
    
    // MARK: - Action
        
    @objc private func completeButtonTapped() {
        let userNickname = nicknameTextField.textField.text ?? ""
        
        if !userNickname.isEmpty {
            delegate?.setNickname(nickname: userNickname)
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.contentView.snp.updateConstraints {
                $0.bottom.equalToSuperview().offset(self.view.frame.height)
            }
            self.backgroundView.alpha = 0
            self.view.layoutIfNeeded()
        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
