//
//  ContentView.swift
//  Fruits
//
//  Created by Sands on 2023/6/30.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings = false
    var fruits: [Fruit] = fruitsData
    
    var body: some View {
        NavigationView {
            List(fruits.shuffled(), id: \.id, rowContent: { fruit in
                NavigationLink {
                    FruitDetailView(fruit: fruit)
                } label: {
                    FruitRowView(fruit: fruit)
                        .padding(.vertical, 4)
                        .adjustListRowSeparatorLeading()
                }
            })
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
