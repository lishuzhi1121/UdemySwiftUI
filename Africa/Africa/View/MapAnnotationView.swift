//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Sands on 2023/7/11.
//

import SwiftUI

struct MapAnnotationView: View {
    let location: NationalParkLocation
    @State private var animation: Double = 0
    
    var body: some View {
        ZStack {
            // background
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            // animation circle
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1.0 + animation)
                .opacity(1.0 - animation)
            // image
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2.0).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
