//
//  String+.swift
//  Watcha-Clone
//
//  Created by mandoo on 4/23/26.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = /^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,}$/
        return self.wholeMatch(of: regex) != nil
    }
    
    var isValidPassword: Bool {
        let regex = /^(?=.*[!_@$%^&+=])[A-Za-z0-9!_@$%^&+=]{10,}$/
        return self.wholeMatch(of: regex) != nil
    }
}
