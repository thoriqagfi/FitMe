//
//  SessionPagingView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

struct SessionPagingView: View {
    @State private var selection: Tab = .speedometerVelocity
    @EnvironmentObject var sessionManager: WorkoutManager
    @Environment(\.dismiss) var dismiss
    
    enum Tab {
        case speedometerVelocity, kilometerProgress, runningVisualization
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            SpeedometerVelocityView().tag(Tab.speedometerVelocity)
            KilometerProgressView().tag(Tab.kilometerProgress)
            RunningVisualizationView().tag(Tab.runningVisualization)
        })
        .tabViewStyle(.verticalPage(transitionStyle: .blur))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    sessionManager.endWorkout()
                    sessionManager.resetWorkout()
                    dismiss()
                }, label: {
                    Label("Back", systemImage: "chevron.backward.circle.fill")
                })
            }
        }
    }
}

#Preview {
    SessionPagingView()
}
