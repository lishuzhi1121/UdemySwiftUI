//
//  ContentView.swift
//  SwiftUI-Link
//
//  Created by Sands on 2023/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LinkBasicView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Basic Link")
                }
            
            LinkButtonStytleView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Button Stytle Link")
                }
            
            LinkCustomView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Custom Link")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
