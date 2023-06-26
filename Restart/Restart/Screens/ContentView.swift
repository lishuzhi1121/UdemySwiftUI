//
//  ContentView.swift
//  Restart
//
//  Created by Sands on 2023/6/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onbarding") var isOnbardingViewActive: Bool = true
    var body: some View {
        ZStack {
            if isOnbardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
