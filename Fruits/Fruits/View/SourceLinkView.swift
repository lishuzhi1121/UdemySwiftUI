//
//  SourceLinkView.swift
//  Fruits
//
//  Created by Sands on 2023/7/3.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox {
            HStack {
                Text("Content source")
                Spacer()
                Link(destination: URL(string: "https://www.wikipedia.com")!) {
                    Text("Wikipedia")
                    Image(systemName: "arrow.up.right.square")
                }
            }
            .font(.footnote)
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
