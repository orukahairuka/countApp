//
//  ContentView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/05/30.
//

import SwiftUI

struct FlipClockTextEffect: View {
    var size: CGSize
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    var foreground: Color
    var background: Color
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.gradient)
        }
        .frame(width: size.width, height: size.height)
    }
}


