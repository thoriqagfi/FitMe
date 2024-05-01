//
//  LocationDataManager.swift
//  FitMe Watch App
//
//  Created by Lonard Steven on 01/05/24.
//

import Foundation
import CoreLocation

@MainActor
class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationDataManager()
    
    // create a location manager
    private let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation?
    
    override init() {
        super.init()
        
        // do configure the location manager
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestAccessPermission() {
        locationManager.requestWhenInUseAuthorization()
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            currentLocation = locationManager.location
            print(currentLocation?.coordinate.latitude, currentLocation?.coordinate.longitude, currentLocation?.speed, currentLocation?.timestamp)
            
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        } else {
            locationManager.requestWhenInUseAuthorization()
            requestAccessPermission()
        }
    }
}

