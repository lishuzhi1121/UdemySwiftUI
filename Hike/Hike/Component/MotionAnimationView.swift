//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Sands on 2023/6/29.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    func randomPosition() -> CGFloat {
        CGFloat.random(in: 0...256.0)
    }
    
    func randomSize() -> CGFloat {
        CGFloat.random(in: 4.0...80.0)
    }
    
    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    
    func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }
    
    func randomDelay() -> Double {
        Double.random(in: 0...2.0)
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                .opacity(0.25)
                .frame(width: randomSize())
                .position(
                    x: randomPosition(),
                    y: randomPosition()
                )
                .scaleEffect(isAnimating ? randomScale() : 1.0)
                .onAppear {
                    withAnimation(
                        .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    ) {
                        isAnimating = true
                    }
                }
            }
        }
        .frame(width: 256, height: 256)
        .mask {
            Circle()
        }
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .background(
                Circle().fill(.teal)
            )
    }
}
