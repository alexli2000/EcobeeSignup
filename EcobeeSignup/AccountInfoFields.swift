//
//  AccountInfoFields.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

enum AccountInfoFields: TextTag {
    case firstName = 0, lastName, email, password, passwordRepeat
    
    var title: String {
        switch self {
        case .firstName:
            return "First Name"
        case .lastName:
            return "Last Name"
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .passwordRepeat:
            return "Repeat Password"
        }
    }
    
    var shouldHideText: Bool {
        switch self {
        case .password, .passwordRepeat:
            return true
        case .firstName, .lastName, .email:
            return false
        }
    }
    
    static func all() -> [AccountInfoFields] {
        return [.firstName, .lastName, .email, .password, .passwordRepeat]
    }
}
