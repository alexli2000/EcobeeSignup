//
//  Constants.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct Constants {
    struct SegueIdentifiers {
        static let loginToRegistrationSegue = "LoginToRegistrationSegue"
        static let registrationToTermsAndServiceSegue = "RegistrationToTermsAndServiceSegue"
        static let termsAndServiceToAccountInfoSegue = "TermsAndServiceToAccountInfoSegue"
        
        static let createAccountToEnableWeatherSegue = "CreateAccountToEnableWeatherSegue"
        
        static let enableWeatherToAddressConfirmationSegue = "EnableWeatherToAddressConfirmationSegue"
        static let enableWeatherToCongratulationsSegue = "EnableWeatherToCongratulationsSegue"
        
        static let addressConfirmationToCongratulationsSegue = "AddressConfirmationToCongratulationsSegue"
        
        static let congratulationsToLoginSegue = "CongratulationsToLoginSegue"
    }
    
    struct APIurls {
        static let pin = "http://example.com/pin"
        static let account = "http://example.com/account"
        static let location = "http://example.com/location"
    }
}
