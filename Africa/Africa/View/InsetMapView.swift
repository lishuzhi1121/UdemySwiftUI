//
//  InsetMapView.swift
//  Africa
//
//  Created by Sands on 2023/7/6.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 60.0,
            longitudeDelta: 60.0
        )
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 256)
            .cornerRadius(12)
            .overlay(alignment: .topTrailing) {
                NavigationLink {
                    MapView()
                } label: {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    
                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 8))
                .background(
                    Color.black
                        .opacity(0.4)
                        .cornerRadius(8)
                )
                .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
            }
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
