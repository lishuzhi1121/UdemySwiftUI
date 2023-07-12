//
//  LocationModel.swift
//  Africa
//
//  Created by Sands on 2023/7/11.
//

import Foundation
import CoreLocation

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
