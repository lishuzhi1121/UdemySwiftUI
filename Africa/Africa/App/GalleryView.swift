//
//  GalleryView.swift
//  Africa
//
//  Created by Sands on 2023/7/5.
//

import SwiftUI

struct GalleryView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal: Animal?
    @State private var gridColumn: Double = 3.0
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3) // [GridItem(.flexible())]
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 30) {
                // image
                Image(selectedAnimal?.image ?? "lion")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 8)
                    }
                
                // slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                // grid
                LazyVGrid(columns: gridLayout, alignment: .center) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(Color.white, lineWidth: 1)
                            }
                            .onTapGesture {
                                withAnimation(.easeIn) {
                                    selectedAnimal = item
                                    hapticImpact.impactOccurred()
                                }
                            }
                    }
                }
                .animation(.easeIn)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
        .onAppear {
            selectedAnimal = animals[0]
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
