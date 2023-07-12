//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Sands on 2023/7/6.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipadia")
                
                Spacer()
                
                Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) {
                    Text(animal.name)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
