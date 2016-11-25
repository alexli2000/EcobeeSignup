//
//  LocationAPICommunicator.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

/* SAVE LOCATION API CALL url:'http://example.com/location' method: POST
type: application/json
POST body: { apiToken:'<apiTokenFromSuccessfulAccountCreationResponse>', address: 'some address',
    city: 'some city',
    stateProvince: 'some state or province',
    postalCode: 'AAAAAA',
    latitude: '<lat of address>',
    longitude: '<long of address>
}
*/

import Foundation

struct LocationAPICommunicator {
    
    func saveLocation(from info: AccountInfo) {
        
    }
    
//    func saveLocation(from info: AccountInfo) {
//        guard let url = URL(string: Constants.APIurls.location), let apiToken = info.apiToken, let addressInfo = info.addressInfo else {
//            return
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        let bodyObject: [String : Any] = [
//            "apiToken" : apiToken,
//            "address" : addressInfo.streetAddress,
//            "city" : addressInfo.city,
//            "stateProvince" : addressInfo.province,
//            "postalCode" : addressInfo.zipCode,
//            "latitude" : addressInfo.lat,
//            "longitude" : addressInfo.lon
//        ]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
//        
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        session.dataTask(with: request) { (data, response, error) in
//            
//            }.resume()
//        session.finishTasksAndInvalidate()
//    }
}
