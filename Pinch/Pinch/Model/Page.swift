//
//  Page.swift
//  Pinch
//
//  Created by Sands on 2023/6/28.
//

import Foundation

struct Page: Identifiable {
    var id: Int
    var imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}
