//
//  SpeedometerVelocityView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

let backgroundGradient = LinearGradient(colors: [Color.red, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing)

struct SpeedometerVelocityView: View {
    @EnvironmentObject var accelerometerManager: AccelerometerManager
    
    var body: some View {
        ZStack {
            backgroundGradient
                .opacity(0.7)
            ZStack {
                Text("\(String(format: "%.0f", accelerometerManager.pace))")
                        .font(.system(size: 100))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .opacity(0.3)
                        .offset(y:15)
                StyledGauge(currentSpeed: accelerometerManager.pace)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    SpeedometerVelocityView()
        .environmentObject(AccelerometerManager())
}

struct StyledGauge: View {
    @State var currentSpeed: CGFloat
    @State private var minSpeed = 0.0
    @State private var maxSpeed = 20.0
    
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])


    var body: some View {
        Gauge(value: currentSpeed, in: minSpeed...maxSpeed) {
            Image(systemName: "chevron.forward.2")
                .fontWeight(.black)
                .foregroundColor(.white)

        }
        
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
        .scaleEffect(CGSize(width: 3.0, height: 3.0))

    }
}

