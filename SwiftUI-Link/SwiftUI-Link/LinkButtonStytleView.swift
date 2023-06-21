//
//  LinkButtonStytleView.swift
//  SwiftUI-Link
//
//  Created by Sands on 2023/6/21.
//

import SwiftUI

struct LinkButtonStytleView: View {
    var body: some View {
        VStack(spacing: 30) {
            Link("Go to WS", destination: URL(string: "https://www.ilovews.com:88/")!)
                .buttonStyle(.borderless)
            
            Link("Call to Action", destination: URL(string: "tel:15757870542")!)
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.regular)
            
            Link("Send an Email", destination: URL(string: "mailto://lishuzhi1121@163.com")!)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(.pink)
            
            Link("Credo Academy", destination: URL(string: "https://credo.academy")!)
                .buttonStyle(.plain)
                .padding()
                .border(.primary, width: 2)
        }
        .font(.largeTitle)
    }
}

struct LinkButtonStytleView_Previews: PreviewProvider {
    static var previews: some View {
        LinkButtonStytleView()
    }
}
