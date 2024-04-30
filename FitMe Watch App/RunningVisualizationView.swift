//
//  RunningVisualizationView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

let runBackgroundColor = LinearGradient(colors: [Color.lightBlue, Color.white], startPoint: .top, endPoint: .bottom)

//var background = Color(.black)

struct RunningVisualizationView: View {
    var body: some View {
        
        ZStack {
            runBackgroundColor
            
            VStack {
                Circle()
                    .fill(Color(.darkGreen))
                    .frame(width: 200, height: 200)
                    .offset(y: 165)
            }
        }
        .ignoresSafeArea()
        .scaledToFill()
    }
}

#Preview {
    RunningVisualizationView()
}
