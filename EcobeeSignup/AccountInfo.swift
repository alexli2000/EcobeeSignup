//
//  AccountInfo.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct AccountInfo {
    
    static var sharedInstance = AccountInfo()
    
    var creationToken: String!
    var apiToken: String?
    
    var registrationInfo = RegistrationInfo()
    var addressInfo: AddressInfo?
    
    private init() { }
}
