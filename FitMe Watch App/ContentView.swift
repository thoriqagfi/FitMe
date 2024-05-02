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
    @EnvironmentObject var accelerometerManager: AccelerometerManager
    @State var timer: Timer = Timer()
    
    //    var speed = CLLocationSpeed()
    @State private var speed: Double = 0
    
    let locationManager = CLLocationManager()

    var body: some View {
        VStack {
//            Text("\(accelerometerManager.pace) kmh")
//            
//            Button(action: {
//                // Get the current location
//                if let currentLocation = self.locationManager.location {
//                    print("Speed")
//                    print("\(currentLocation.speed)")
//                    // Get the speed in meters per second
//                    let speed = currentLocation.speed
//                    // Convert the speed to kilometers per hour
//                    self.speed = speed * 3.6
//                }
//            }) {
//                Text("Get Speed")
//            }
//            StartView()
            StartView()
                .environmentObject(workoutManager)
                .environmentObject(accelerometerManager)
//            NavigationLink(destination: {
//                StartView()
//            }, label: {
//                Text("Start View")
//            })
        }
//        .padding()
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
        .environmentObject(AccelerometerManager())
}
