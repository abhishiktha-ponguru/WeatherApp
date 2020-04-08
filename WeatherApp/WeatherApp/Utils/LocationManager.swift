//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Abhishiktha on 4/8/20.
//  Copyright © 2020 Abhishiktha. All rights reserved.
//

import Foundation
import CoreLocation

typealias DidChangeAuthorization = ((_ status: CLAuthorizationStatus) -> Void)
typealias DidUpdateLocation = ((_ location: CLLocationCoordinate2D?) -> Void)

class LocationManager: NSObject {
    var locationManager = CLLocationManager()
    var didChangeAuthorization: DidChangeAuthorization?
    var didUpdateLocation: DidUpdateLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    func requestPermission() {
        self.locationManager.requestAlwaysAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if CLLocationManager.locationServicesEnabled() && (status == .authorizedWhenInUse || status == .authorizedAlways) {
            locationManager.startUpdatingLocation()
        } else if status != .notDetermined && status != .restricted {
            didChangeAuthorization?(.denied)
        }
    }
    
    func stopUpdating() {
        self.locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        didUpdateLocation?(locations.last?.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else if status != .notDetermined && status != .restricted {
            didChangeAuthorization?(.denied)
        }
    }
}
