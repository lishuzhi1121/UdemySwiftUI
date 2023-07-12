//
//  CoverImageView.swift
//  Africa
//
//  Created by Sands on 2023/7/5.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    @State private var tabViewSelection = 1
    // 定时轮播
    let timmer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $tabViewSelection) {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .tag(item.id)
            }
        }
        .tabViewStyle(.page)
        .onReceive(timmer, perform: { fireDate in
            withAnimation(.easeOut) {
                if tabViewSelection < coverImages.count {
                    tabViewSelection += 1
                } else {
                    tabViewSelection = 1
                }
            }
        })
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
