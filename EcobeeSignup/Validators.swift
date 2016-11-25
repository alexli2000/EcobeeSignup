//
//  Validators.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct Validators {
    
    static func isEmailValid(input: String) -> Bool {
        if input.characters.count == 0 { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: input)
    }
    
    static func isNameValid(input: String) -> Bool {
        return input.characters.count >= 3 && input.characters.count <= 20
    }
    
    static func isPasswordValid(input: String) -> Bool {
        return !input.contains(" ") && input.characters.count > 0
    }
    
    static func isRepeatPasswordValid(original: String, input: String) -> Bool {
        return original == input
    }
}
