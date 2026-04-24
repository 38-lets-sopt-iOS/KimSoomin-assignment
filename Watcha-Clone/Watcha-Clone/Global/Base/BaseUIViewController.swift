//
//  BaseUIViewController.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/23/26.
//

import UIKit

import SnapKit
import Then

class BaseUIViewController: UIViewController {

    // MARK: - Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    func setUI() {}
    
    func setLayout() {}
}
