//
//  MapView.swift
//  Africa
//
//  Created by Sands on 2023/7/5.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0))
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: locations) { item in
            // 1. 老式大头针📌
//            MapPin(coordinate: item.location, tint: .accentColor)
            // 2. 新版标记🏷️
//            MapMarker(coordinate: item.location, tint: .accentColor)
            // 3. 自定义标记(可交互)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(alignment: .top) {
            MapHeaderView(region: region)
                .padding()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
