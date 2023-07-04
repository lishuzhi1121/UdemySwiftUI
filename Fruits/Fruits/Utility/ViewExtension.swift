//
//  ViewExtension.swift
//  Fruits
//
//  Created by Sands on 2023/7/3.
//

import Foundation
import SwiftUI

extension View {
    
    /// 调整List 行分割线头部间距
    /// - Parameters:
    ///   - padding: 间距大小, 默认 0
    /// - Returns: View
    func adjustListRowSeparatorLeading(_ padding: CGFloat = 0) -> some View {
        modifier(AdjustListRowSeparatorModifier(padding: padding))
    }
}

struct AdjustListRowSeparatorModifier: ViewModifier {
    var padding: CGFloat
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    return padding - 20
                }
        } else {
            content
        }
    }
}
