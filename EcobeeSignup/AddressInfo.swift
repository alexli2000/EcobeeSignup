//
//  AddressInfo.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation
import CoreLocation

struct AddressInfo {
    var streetAddress = ""
    var city = ""
    var province = ""
    var zipCode = ""
    var lat: Double = 0
    var lon: Double = 0
    
    init(placemark: CLPlacemark?) {
        guard let placemark = placemark else {
            return
        }
        streetAddress = placemark.thoroughfare ?? ""
        city = placemark.locality ?? ""
        province = placemark.administrativeArea ?? ""
        zipCode = placemark.postalCode ?? ""
        lat = placemark.location?.coordinate.latitude ?? 0
        lon = placemark.location?.coordinate.longitude ?? 0
    }
}
