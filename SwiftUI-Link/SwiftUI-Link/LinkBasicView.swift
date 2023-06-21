//
//  LinkBasicView.swift
//  SwiftUI-Link
//
//  Created by Sands on 2023/6/21.
//

import SwiftUI

struct LinkBasicView: View {
    var body: some View {
        Link("Go to WS", destination: URL(string: "https://www.ilovews.com:88/")!)
            .font(.largeTitle)
    }
}

struct LinkBasicView_Previews: PreviewProvider {
    static var previews: some View {
        LinkBasicView()
    }
}
