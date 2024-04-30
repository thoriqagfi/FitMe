//
//  StartView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

struct StartView: View {
    @State var progress: CGFloat = 0
    @State var width: CGFloat = 175
    @State var angle: Angle = .degrees(0)
    
    var radians = 0.0
    
    func onChanged(value: DragGesture.Value) {
        let temAngle = radians * 180 / .pi
        let angle = temAngle < 10 ? 360 + temAngle : temAngle
        
        if angle <= 200 {
            _ = angle / 288
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(content: {
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Color.white.opacity(0.6), lineWidth: 20)
                    .frame(width: width, height: width)
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Color.white, lineWidth: 20)
                    .frame(width: width, height: width)
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 25, height: 25)
                    .offset(x: width/2)
                    .rotationEffect(.init(degrees: progress))
                    .gesture(DragGesture().onChanged(onChanged(value:)))
            })
            .rotationEffect(.init(degrees: 126))
        }
    }
}

#Preview {
    StartView()
}
