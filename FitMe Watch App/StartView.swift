//
//  StartView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

struct StartView: View {
    @State var progress: CGFloat = 0.0
    @State var width: CGFloat = 150
    @State var angle: Double = 0.0
    @State var scale: CGFloat = 1.0
    
    func onChanged(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy - 25, vector.dx - 25)
        var angle = radians * 180 / .pi
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)) {
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
            
            self.scale = 1.4
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack(content: {
                Circle()
                    .stroke(Color.white.opacity(0.6), lineWidth: 20)
                    .frame(width: width, height: width)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.white, lineWidth: 20)
                    .frame(width: width, height: width)
                    .rotationEffect(Angle(degrees: -90))
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 25, height: 25)
                    .scaleEffect(scale)
                    .offset(x: width/2)
                    .rotationEffect(Angle(degrees: angle))
                    .gesture(DragGesture().onChanged(onChanged(value:)).onEnded({
                        _ in
                        withAnimation {
                            scale = 1.0
                        }
                    }))
                    .rotationEffect(Angle(degrees: -89))
                
                Button(action: {
                    print("halo")
                }, label: {
                    Circle()
                        .foregroundColor(.yellow)
                        .frame(width: 100, height: 100)
                        .overlay(alignment: .center, content: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.7)
                        })
                })
                .clipShape(Circle())
            })
            
            Text("\(String(format: "%.0f", progress * 20)) km")
                .padding()
        }
    }
}

#Preview {
    StartView()
}
