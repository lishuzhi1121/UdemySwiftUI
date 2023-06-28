//
//  ContentView.swift
//  Pinch
//
//  Created by Sands on 2023/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1.0
    @State private var imageOffset: CGSize = .zero
    @State private var lastImageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    var pages = pagesData
    @State private var pageIndex: Int = 1
    
    // MARK: - Current Page
    private var currentPage: String {
        pages[pageIndex - 1].imageName
    }
    
    // MARK: - ResetImage
    func resetImageState() {
        withAnimation(.spring()) {
            imageScale = 1.0
            imageOffset = .zero
            lastImageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // FIX: 透明背景为了充满ZStack布局
                Color.clear
                
                Image(currentPage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.4), radius: 12 ,x: 4, y: 4)
                    .opacity(isAnimating ? 1.0 : 0)
                    .scaleEffect(imageScale)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .onTapGesture(count: 2) {
                        if imageScale == 1.0 {
                            withAnimation(.spring()) {
                                imageScale = 5.0
                            }
                        } else {
//                            withAnimation(.spring()) {
//                                imageScale = 1.0
//                                imageOffset = .zero
//                            }
                            resetImageState()
                        }
                    }
                    // MARK: - DRAG
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.linear(duration: 1.0)) {
                                    imageOffset = CGSize(width: lastImageOffset.width + gesture.translation.width, height: lastImageOffset.height + gesture.translation.height)
                                }
                            })
                            .onEnded({ gesture in
                                if imageScale <= 1.0 {
//                                    withAnimation(.spring()) {
//                                        imageScale = 1.0
//                                        imageOffset = .zero
//                                    }
                                    resetImageState()
                                } else {
                                    lastImageOffset = imageOffset
                                }
                            })
                    )
                    // MARK: - MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1.0)) {
                                    imageScale = value
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.spring()) {
                                    if imageScale > 5.0 {
                                        imageScale = 5.0
                                    } else if imageScale < 1.0 {
                                        resetImageState()
                                    }
                                }
                            })
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1.0)) {
                    isAnimating = true
                }
            }
            // MARK: - INFO
            .overlay(alignment: .top) {
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
            }
            // MARK: - CONTROLS
            .overlay(alignment: .bottom) {
                Group {
                    HStack {
                        // scale down
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1.0 {
                                    imageScale -= 0.5
                                } else {
                                    imageScale = 0.5
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // reset
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }

                        // scale up
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5.0 {
                                    imageScale += 0.5
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1.0 : 0)
                }
                .padding(.bottom, 30)
            }
            // MARK: - DRAWER
            .overlay(alignment: .topTrailing) {
                HStack(spacing: 12) {
                    // DRAWER HANDLER
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .padding(8)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }
                    
                    // THUMBNAILS
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
//                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1.0 : 0)
                            .animation(.easeOut(duration: 0.25), value: isDrawerOpen)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    pageIndex = page.id
                                }
                            }
                    }
                    
                    Spacer()
                    
                }
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimating ? 1.0 : 0)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .offset(x: isDrawerOpen ? 20 : UIScreen.main.bounds.width * 0.7 - 44)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
