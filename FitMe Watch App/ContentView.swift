//
//  ContentView.swift
//  FitMe Watch App
//
//  Created by Agfi on 29/04/24.
//

import SwiftUI
import HealthKit
//import CoreLocation

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
//    var speed = CLLocationSpeed()
    @State private var speed: Double = 0
    let locationManager = CLLocationManager()
    
    var body: some View {
        VStack {
            Text("\(speed)")
            
            Button(action: {
                // Get the current location
                if let currentLocation = self.locationManager.location {
                    print("Speed")
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
//            workoutManager.requestAuthorization()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WorkoutManager())
}
