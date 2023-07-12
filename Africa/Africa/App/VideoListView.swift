//
//  VideoListView.swift
//  Africa
//
//  Created by Sands on 2023/7/5.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    // 触感反馈
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: {
                    VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                }, label: {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                })
            }
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
