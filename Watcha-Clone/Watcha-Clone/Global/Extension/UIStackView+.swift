//
//  UIStackView+.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/23/26.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
