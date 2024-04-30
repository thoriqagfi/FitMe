//
//  FitMeApp.swift
//  FitMe Watch App
//
//  Created by Agfi on 29/04/24.
//

import SwiftUI
import HealthKit

@main
struct FitMe_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutManager)
        }
    }
}
