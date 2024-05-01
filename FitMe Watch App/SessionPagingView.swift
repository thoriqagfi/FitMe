//
//  SessionPagingView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

struct SessionPagingView: View {
    @State private var selection: Tab = .speedometerVelocity
    
    enum Tab {
        case startPage, speedometerVelocity, kilometerProgress, runningVisualization
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            ContentView()
                .tag(Tab.startPage)
            SpeedometerVelocityView().tag(Tab.speedometerVelocity)
            KilometerProgressView().tag(Tab.kilometerProgress)
            RunningVisualizationView().tag(Tab.runningVisualization)
        })
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    SessionPagingView()
}
