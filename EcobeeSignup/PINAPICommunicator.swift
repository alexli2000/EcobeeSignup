//
//  PINAPICommunicator.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation

struct PINAPICommunicator {
    
    let mockResult1 = APIResult(jsonDict: ["status" : 200, "message" : "ok", "accountCreationToken" : "abcdefg"], codeKey: "accountCreationToken")
    let mockResult2 = APIResult(jsonDict: ["status" : 401, "message" : "invalid pin"], codeKey: "accountCreationToken")
    
    func sendPIN(pin: String, completion: (_ result: APIResult) -> Void) {
        completion(mockResult1)
    }
}
