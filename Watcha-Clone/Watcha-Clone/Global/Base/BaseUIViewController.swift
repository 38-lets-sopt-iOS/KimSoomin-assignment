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
        setAction()
    }
    
    // MARK: - Setup Methods
    
    func setStyle() {}
    
    func setUI() {}
    
    func setLayout() {}
    
    func setAction() {}
}
