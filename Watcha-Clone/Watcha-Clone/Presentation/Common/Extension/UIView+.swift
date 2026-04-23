//
//  UIView+.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/21/26.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
