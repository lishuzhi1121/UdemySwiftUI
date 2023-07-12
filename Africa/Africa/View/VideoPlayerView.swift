//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sands on 2023/7/10.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoSelected: String
    let videoTitle: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//                Text ("Video Overlay")
            }
            .overlay(alignment: .topLeading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
                    .padding(EdgeInsets(top: 6, leading: 8, bottom: 0, trailing: 8))
            }
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "zebra", videoTitle: "Zebra")
        }
    }
}
