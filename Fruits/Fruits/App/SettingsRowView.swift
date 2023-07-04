//
//  SettingsRowView.swift
//  Fruits
//
//  Created by Sands on 2023/7/4.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String?
    var linkText: String?
    var linkURL: String?
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkText != nil && linkURL != nil) {
                    Link(linkText!, destination: URL(string: linkURL!)!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Sands / Lee")
                .previewLayout(.sizeThatFits)
                .padding()
            
            SettingsRowView(name: "Website", linkText: "SwiftUI Masterclass", linkURL: "https://swiftuimasterclass.com")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
            
            SettingsRowView(name: "Tester")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
