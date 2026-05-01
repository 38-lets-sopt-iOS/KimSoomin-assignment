//
//  BaseUIView.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/23/26.
//

import UIKit

class BaseUIView: UIView {
    
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
    
    // MARK: - Setup Methods
    
    func setStyle() {}

    func setUI() {}

    func setLayout() {}
}
