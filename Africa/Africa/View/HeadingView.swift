//
//  HeadingView.swift
//  Africa
//
//  Created by Sands on 2023/7/6.
//

import SwiftUI

struct HeadingView: View {
    let headingImage: String
    let headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(
            headingImage: "photo.on.rectangle.angled",
            headingText: "Wilderness in Pictures"
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
