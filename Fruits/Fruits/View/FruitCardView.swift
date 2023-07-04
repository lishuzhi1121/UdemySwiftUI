//
//  FruitCardView.swift
//  Fruits
//
//  Created by Sands on 2023/6/30.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: - properties
    var fruit: Fruit
    @State private var isAnimating: Bool = false
    @AppStorage("isOnboarding") var isOnbarding: Bool?
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Image
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
//                    .animation(.spring(), value: isAnimating)
                
                // Title
                Text(fruit.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                
                // Headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                // Start button
                Button {
                    isOnbarding = false
                } label: {
                    Text("Start")
                    Image(systemName: "arrow.right.circle")
                        .imageScale(.large)
                }
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                .background(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1.25)
                )
                .tint(.white)

            }
        }
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(
                    .easeOut(duration: 0.5)
                ) {
                    isAnimating = true
                }
            }
        }
        .onDisappear {
            isAnimating = false
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(
                colors: fruit.gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(20)
        
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData.last!)
            .previewLayout(.fixed(width: 320, height: 640))
            .padding()
    }
}
