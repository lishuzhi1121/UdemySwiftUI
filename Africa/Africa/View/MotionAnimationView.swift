//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Sands on 2023/7/11.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    func randomPosition(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        CGFloat.random(in: 10...300.0)
    }
    
    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        Double.random(in: 0...2.0)
    }
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), alignment: .center)
                        .position(
                            x: randomPosition(max: geometry.size.width),
                            y: randomPosition(max: geometry.size.height)
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1.0)
                        .animation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
                
//                Text("Width: \(Int(geometry.size.width)), Height: \(Int(geometry.size.height))")
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
