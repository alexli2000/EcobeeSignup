//
//  RegistrationInfo.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct RegistrationInfo {
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var repeatPassword = ""
    
    func isAllValid() -> Bool {
        return Validators.isNameValid(input: firstName) && Validators.isNameValid(input: lastName) && Validators.isEmailValid(input: email) && Validators.isPasswordValid(input: password) && Validators.isRepeatPasswordValid(original: password, input: repeatPassword)
    }
}
