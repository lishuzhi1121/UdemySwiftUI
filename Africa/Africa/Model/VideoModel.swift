//
//  VideoModel.swift
//  Africa
//
//  Created by Sands on 2023/7/10.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
