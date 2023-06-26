//
//  OnboardingView.swift
//  Restart
//
//  Created by Sands on 2023/6/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onbarding") var isOnbardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    // 震动反馈
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                // MARK: - HEADER
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle) // FIX: 需要使用id来标记不同的View从而触发transition动画
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1.0 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 0.7), value: isAnimating)
                // MARK: - CENTER
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1.0)
                        .blur(radius: abs(imageOffset.width / 10))
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1.0 : 0.5)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(gesture.translation.width) <= UIScreen.main.bounds.width * 0.5 {
                                        imageOffset = gesture.translation
                                    }
                                    withAnimation(.linear(duration: 0.5)) {
                                        indicatorOpacity = 0
                                        textTitle = "Give."
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.5)) {
                                        indicatorOpacity = 1.0
                                        textTitle = "Share."
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                }
                .overlay(alignment: .bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1.0 : 0)
                        .animation(.easeOut(duration: 1.0).delay(1.0), value: isAnimating)
                        .opacity(indicatorOpacity)
                }
                
                // MARK: - FOOTER
                Spacer()
                //                Text("buttonWidth:\(buttonWidth)\nbuttonOffset:\(buttonOffset)")
                ZStack {
                    // 1. backgroud
                    ZStack {
                        Capsule()
                            .fill(.white.opacity(0.2))
                        
                        Capsule()
                            .fill(.white.opacity(0.2))
                            .padding(8)
                    }
                    // 2. call to action
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. Capsule
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80.0)
                        // FIX: 设置spacer的最小长度是0可以避免边距扩大
                        Spacer(minLength: 0)
                    }
                    // 4. Circle draggable
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 &&
                                        buttonOffset < buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ gesture in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth * 0.5 {
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound("chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnbardingViewActive = false
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        
                        Spacer(minLength: 0)
                    }
                    
                }
                .frame(width: buttonWidth ,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1.0 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1.0), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
