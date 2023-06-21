//
//  LinkCustomView.swift
//  SwiftUI-Link
//
//  Created by Sands on 2023/6/21.
//

import SwiftUI

struct LinkCustomView: View {
    var body: some View {
        Link(destination: URL(string: "https://www.ilovews.com:88")!) {
            HStack(spacing: 16) {
                Image(systemName: "apple.logo")
                Text("WS")
            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(
                Capsule()
                    .fill(.blue)
            )
        }
    }
}

struct LinkCustomView_Previews: PreviewProvider {
    static var previews: some View {
        LinkCustomView()
    }
}
