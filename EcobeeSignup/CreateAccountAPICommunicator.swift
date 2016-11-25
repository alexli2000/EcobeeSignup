//
//  CreateAccountAPICommunicator.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

//url:'http://example.com/account' method: POST
//type: application/json
//POST body: { accountCreationToken:'<thetoken>' firstName: 'firstname',
//    lastName: 'lastName',
//    email: 'email@something.com', password: 'thepassword', repeatPassword: 'thepassword'
//}

import UIKit

struct CreateAccountAPICommunicator {
    
    let mockResult1 = APIResult(jsonDict: ["status" : 200, "message" : "ok", "apiToken" : "abcdefg"], codeKey: "apiToken")
    let mockResult2 = APIResult(jsonDict: ["status" : 401, "code" : 1, "message" : "email associated with account already"], codeKey: "apiToken")
    let mockResult3 = APIResult(jsonDict: ["status" : 401, "code" : 2, "message" : "passwords don't match"], codeKey: "apiToken")
    
    func createAccount(from info: AccountInfo, completion: @escaping (_ result: APIResult) -> Void) {
        completion(mockResult1)
    }
    
    
//    func createAccount(from info: AccountInfo, completion: @escaping (_ result: APIResult) -> Void) {
//        guard let url = URL(string: Constants.APIurls.account) else {
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let bodyObject: [String : Any] = [
//            "accountCreationToken" : info.creationToken,
//            "firstName" : info.registrationInfo.firstName,
//            "lastName" : info.registrationInfo.lastName,
//            "email" : info.registrationInfo.email,
//            "password" : info.registrationInfo.password,
//            "repeatPassword" : info.registrationInfo.repeatPassword
//        ]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//        
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        session.dataTask(with: request) { (data, response, error) in
//            guard error == nil else {
//                completion(nil, error as? NSError)
//                return
//            }
//            guard let data = data else {
//                completion (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: 0, userInfo: ["message" : "no data"]))
//                return
//            }
//            let info = self.process(data: data)
//            completion(info.apiToken, info.error)
//        }.resume()
//        session.finishTasksAndInvalidate()
//    }
//    
//    private func process(data: Data) -> (apiToken: String?, error: NSError?) {
//        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String : Any]
//            guard let status = json["status"] as? Int else {
//                return (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: 0, userInfo: ["message" : "missing status code"]))
//            }
//            switch status {
//            case 401:
//                return (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: json["code"] as? Int ?? 0, userInfo: ["message" : json["message"] as? String ?? "unknown error"]))
//            case 200:
//                guard let accountCreationToken = json["accountCreationToken"] as? String else {
//                    return (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: 0, userInfo: ["message" : "invalid account creation token"]))
//                }
//                return (accountCreationToken, nil)
//            default:
//                return (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: 0, userInfo: ["message" : "unknown status code"]))
//            }
//        } catch {
//            return (nil, NSError(domain: "com.alexli.EcobeeSignup.CreateAccount", code: 0, userInfo: ["message" : "processing error"]))
//        }
//    }
}
