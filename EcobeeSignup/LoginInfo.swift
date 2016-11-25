//
//  LoginInfo.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-18.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

typealias TextTag = Int

enum LoginInfo: TextTag {
    case email = 0, password
    
    var imageName: String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        }
    }
    
    var placeholder: String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        }
    }
    
    var shouldHideText: Bool {
        switch self {
        case .password:
            return true
        case .email:
            return false
        }
    }
}
