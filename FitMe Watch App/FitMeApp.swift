//
//  FitMeApp.swift
//  FitMe Watch App
//
//  Created by Agfi on 29/04/24.
//

import SwiftUI
import HealthKit
import CoreMotion

@main
struct FitMe_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutManager)
                .environmentObject(locationDataManager)
        }
    }
}
