//
//  KilometerProgressView.swift
//  FitMe Watch App
//
//  Created by Agfi on 30/04/24.
//

import SwiftUI

struct KilometerProgressView: View {
    
    let background = Color(.white)
    
    @State private var progressPercent = 25.0
    @State private var barOffset = Angle(degrees: 0)
    
    var body: some View {
        ZStack {
            background
            // progress bar
            ProgressBar(offset: Angle(degrees: barOffset.degrees), percent:  progressPercent)
                .fill(Color.orange)
                .ignoresSafeArea(.all)
            
            // distance label
            Text("\(Int(progressPercent))%")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.black)
            
            // invisible slider
        }
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.barOffset = Angle(degrees: 360)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    KilometerProgressView()
}

struct ProgressBar: Shape {
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue)}
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowestPoint = 0.01
        let highestPoint = 1.00
        
        let newProgress = (highestPoint - lowestPoint) * (percent / 100)
        let yOffSet = CGFloat(1 - newProgress) * rect.height
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360 + 10)
        
        p.move(to: CGPoint(x: 0, y: yOffSet))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees)) / 360 * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffSet))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        
        p.closeSubpath()
        
        return p
    }
}
