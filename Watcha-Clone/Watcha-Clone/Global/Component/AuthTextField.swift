//
//  AuthTextField.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

import Then
import SnapKit

enum FieldType {
    case email
    case password
    case nickname
}

class AuthTextField: BaseUIView {
    
    // MARK: - Properties
    
    var onTextChange: ((String) -> Void)?
    
    var type: FieldType = .email {
        didSet {
            setFieldStyle()
        }
    }
    
    var isSuccess: Bool = false {
        didSet {
            updateStatusStyle()
        }
    }
    
    var placeholder: String? {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [.foregroundColor: UIColor.gray200]
            )
        }
    }
    
    private var isEyeOn: Bool = false {
        didSet {
            updateStatusStyle()
        }
    }
    
    // MARK: - UI Components
    
    lazy var textField = UITextField().then {
        $0.textColor = .watchaWhite
        $0.font = .body2
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.setImage(.closeSquare, for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private lazy var statusButton = UIButton().then {
        $0.isHidden = true
        $0.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
    }
    
    private let rightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
    }
    
    // MARK: - Custom Methods
    
    override func setUI() {
        backgroundColor = .gray600
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        addSubviews(textField, rightStackView)
        rightStackView.addArrangedSubviews(deleteButton, statusButton)
    }
    
    override func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(80)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Private Methods
    
    private func setFieldStyle() {
        switch type {
        case .email:
            placeholder = "email@address.com"
            textField.isSecureTextEntry = false
            statusButton.setImage(.checkOff, for: .normal)
        case .password:
            placeholder = "비밀번호 입력"
            textField.isSecureTextEntry = !isEyeOn
            statusButton.setImage(.eyeOff, for: .normal)
        case .nickname:
            placeholder = "닉네임 입력"
            textField.isSecureTextEntry = false
        }
    }
    
    private func updateStatusStyle() {
        let hasText = !(textField.text?.isEmpty ?? true)
        
        deleteButton.isHidden = (type == .nickname) || !hasText
        statusButton.isHidden = !hasText
        
        if type == .password {
            let eyeImage = isEyeOn ? UIImage(resource: .eyeOn) : UIImage(resource: .eyeOff)
            statusButton.setImage(eyeImage, for: .normal)
            textField.isSecureTextEntry = !isEyeOn
        } else if type == .email {
            let checkImage = isSuccess ? UIImage(resource: .checkOn) : UIImage(resource: .checkOff)
            statusButton.setImage(checkImage, for: .normal)
        }
        else {
            statusButton.isHidden = true
        }
    }
    
    // MARK: - Actions
    
    @objc private func textFieldDidChange() {
        updateStatusStyle()
        onTextChange?(textField.text ?? "")
    }
    
    @objc private func deleteButtonTapped() {
        textField.text = ""
        onTextChange?("")
        isSuccess = false
        updateStatusStyle()
    }
    
    @objc private func statusButtonTapped() {
        if type == .password {
            isEyeOn.toggle()
        }
    }
}

// MARK: - Extension

extension AuthTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderColor = UIColor.gray200.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderColor = UIColor.clear.cgColor
    }
}
