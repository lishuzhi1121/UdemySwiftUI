//
//  ContentView.swift
//  Africa
//
//  Created by Sands on 2023/7/5.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    // 第一次切换时不需要改变布局
    @State private var needSwitch: Bool = false
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Column: \(gridColumn)")
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
        case 2:
            toolbarIcon = "square.grid.2x2"
        case 3:
            toolbarIcon = "square.grid.3x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }

                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // List
                    Button {
                        isGridViewActive = false
                        needSwitch = false
                        haptics.impactOccurred()
                    } label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    }
                    // Grid
                    Button {
                        isGridViewActive = true
                        haptics.impactOccurred()
                        if needSwitch {
                            gridSwitch()
                        } else {
                            needSwitch = true
                        }
                    } label: {
                        Image(systemName: toolbarIcon)
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
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
