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
    
    override init() {
        super.init()
        
        // do configure the location manager
        locationManager.delegate = self
    }
    
    func requestAccessPermission() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse: do {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
        case .notDetermined: locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            break
        default:
            break
        }
    }
}

