//
//  MapHeaderView.swift
//  Africa
//
//  Created by Sands on 2023/7/11.
//

import SwiftUI
import MapKit

struct MapHeaderView: View {
    var region: MKCoordinateRegion
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            
            VStack(alignment: .leading, spacing: 3) {
                MapHeaderTextView(titleText: "Latitude:", degreesValue: region.center.latitude)
                Divider()
                MapHeaderTextView(titleText: "Longitude:", degreesValue: region.center.longitude)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(
            Color.black
                .cornerRadius(8)
                .opacity(0.6)
        )
    }
}

struct MapHeaderTextView: View {
    let titleText: String
    var degreesValue: Double
    
    var body: some View {
        HStack {
            Text(titleText)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
            Spacer()
            Text("\(degreesValue)")
                .font(.footnote)
                .foregroundColor(.white)
        }
    }
}

struct MapHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MapHeaderView(region: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
            span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        ))
        .previewLayout(.sizeThatFits)
        .padding()
        .background(
            Color.white
        )
    }
}


