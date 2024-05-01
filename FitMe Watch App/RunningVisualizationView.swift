//
//  RunningVisualizationView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI
import SDWebImageLottieCoder

let runBackgroundColor = LinearGradient(colors: [Color.lightBlue, Color.white], startPoint: .top, endPoint: .bottom)

//var background = Color(.black)

struct RunningVisualizationView: View {
    @State var speed = 9
    
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        
        ZStack {
            runBackgroundColor
            
            VStack {
                Circle()
                    .fill(Color(.darkGreen))
                    .frame(width: 200, height: 200)
                    .offset(y: 165)
            }
            
            Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                                   self.viewModel.loadAnimationFromFile(filename: "personRun")
                            if speed >= 7 {
                                self.viewModel.speed = 2
                            } else if speed >= 4 {
                                self.viewModel.speed = 1.0
                            } else if speed >= 1 {
                                self.viewModel.speed = 0.7
                            } else {
                                self.viewModel.speed = 0
                            }
                               }
            Text("\(String(format: "%.2f", speed))")
        }
        .ignoresSafeArea()
        .scaledToFill()
    }
}

#Preview {
    RunningVisualizationView()
}
