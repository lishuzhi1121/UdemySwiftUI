//
//  CircleGroupView.swift
//  Restart
//
//  Created by Sands on 2023/6/25.
//

import SwiftUI

struct CircleGroupView: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .opacity(isAnimating ? 1.0 : 0)
        .blur(radius: isAnimating ? 0 : 10)
        .scaleEffect(isAnimating ? 1.0 : 0.5)
        .animation(.easeOut(duration: 0.6), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
