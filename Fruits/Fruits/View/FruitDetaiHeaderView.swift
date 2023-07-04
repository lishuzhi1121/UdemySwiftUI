//
//  FruitDetaiHeaderView.swift
//  Fruits
//
//  Created by Sands on 2023/7/3.
//

import SwiftUI

struct FruitDetaiHeaderView: View {
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: fruit.gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
        }
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

struct FruitDetaiHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetaiHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
