//
//  ControlImageView.swift
//  Pinch
//
//  Created by Sands on 2023/6/28.
//

import SwiftUI

struct ControlImageView: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
