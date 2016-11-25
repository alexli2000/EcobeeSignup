//
//  LocationManager.swift
//  EcobeeSignup
//
//  Created by Alexander Li on 2016-11-17.
//  Copyright © 2016 Alexander Li. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    var callback: (_ placemark: CLPlacemark?) -> Void
    var locationManager = CLLocationManager()
    
    init(callback: @escaping ((_ placemark: CLPlacemark?) -> Void)) {
        self.callback = callback
        super.init()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        callback(nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            callback(nil)
            return
        }
        fetchAddress(from: location)
    }
    
    func fetchAddress(from location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard error == nil else {
                self?.callback(nil)
                return
            }
            self?.callback(placemarks?.first)
        }
    }
}

