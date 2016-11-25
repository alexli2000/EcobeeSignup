//
//  APIResult.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-21.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct APIResult {
    let errorStatuses = [400, 401]
    
    let expectedKey: String?
    let status: Int!
    let message: String?
    let code: Int?
    let isError: Bool
    
    init(jsonDict: [String : Any], codeKey: String) {
        status = jsonDict["status"] as? Int ?? 400
        message = jsonDict["message"] as? String
        code = jsonDict["code"] as? Int
        expectedKey = jsonDict[codeKey] as? String
        isError = errorStatuses.contains(status)
    }
}
