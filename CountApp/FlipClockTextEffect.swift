//
//  ContentView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/05/30.
//

import SwiftUI

struct FlipClockTextEffect: View {
    var value: Int
    var size: CGSize
    var fontSize: CGFloat
    var cornerRadius: CGFloat
    var foreground: Color
    var background: Color

    @State private var nextValue: Int = 1
    @State private var currentValue: Int = 0
    var body: some View {
        let halfHeight = size.height * 0.5
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.gradient.shadow(.inner(radius: 1)))
                .frame(height: halfHeight)
                .overlay(alignment: .top) {
                    TextView(nextValue)
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .top)
                .zIndex(10)

            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.gradient.shadow(.inner(radius: 1)))
                .frame(height: halfHeight)
                .overlay(alignment: .top) {
                    TextView(currentValue)
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .rotation3DEffect(
                    .init(degrees: -165),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .bottom,
                    perspective: 0.4
                )
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .frame(width: size.width, height: size.height)
    }

    @ViewBuilder
    func TextView(_ value: Int) -> some View {
        Text("\(value)")
            .font(.system(size: fontSize).bold())
            .foregroundStyle(foreground)
    }
}

fileprivate struct RotationModifire: ViewModifier, Animatable {
    var rotation: CGFloat
    var currentValue: Int
    var nextValue: Int
    var fontSize: CGFloat
    var foregroud: Color
    var animatableData: CGFloat {
        get { rotation }
        set { rotation = newValue }
    }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if -rotation > 90 {

                } else {
                    
                }
            }
    }
}

#Preview {
    ContentView()
}
