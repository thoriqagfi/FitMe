//
//  AccelerometerManager.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import Foundation
import CoreMotion

class AccelerometerManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var isRunning = false
    @Published var pace = 0.0
    
    init() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: .main) { data, error in
                if let acceleration = data?.acceleration {
                    let accelerationMagnitude = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z)
                    self.isRunning = accelerationMagnitude > 1.0
                    // Calculate pace based on acceleration data
                    self.pace = accelerationMagnitude // Implement your pace calculation logic here
                }
            }
        }
    }
}
