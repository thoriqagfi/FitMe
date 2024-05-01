//
//  ContentView.swift
//  FitMe Watch App
//
//  Created by Agfi on 29/04/24.
//

import SwiftUI
import HealthKit
import CoreMotion
//import CoreLocation

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @EnvironmentObject var locationDataManager: LocationDataManager
    @State var timer: Timer = Timer()
    
    //    var speed = CLLocationSpeed()
    @State private var speed: Double = 0
    
    let locationManager = CLLocationManager()

    var body: some View {
        VStack {
            Text("\(speed) kmh")
            
            Button(action: {
                // Get the current location
                if let currentLocation = self.locationManager.location {
                    print("Speed")
                    print("\(currentLocation.speed)")
                    print("\(currentLocation.timestamp)")
                    print("\(currentLocation.coordinate.latitude)")
                    print("\(currentLocation.coordinate.longitude)")
                    // Get the speed in meters per second
                    let speed = currentLocation.speed
                    // Convert the speed to kilometers per hour
                    self.speed = speed * 3.6
                }
            }) {
                Text("Get Speed")
            }
        }
        .padding()
        .onAppear {
            workoutManager.requestAuthorization()
            locationDataManager.requestAccessPermission()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WorkoutManager())
        .environmentObject(LocationDataManager())
}
