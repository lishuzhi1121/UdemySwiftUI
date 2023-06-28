//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Sands on 2023/6/26.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "circle.circle")
                .resizable()
                .symbolRenderingMode(.hierarchical)
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1.0) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1.0 : 0)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1.0, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
