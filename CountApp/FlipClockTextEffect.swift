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
    @State private var rotation: CGFloat = 0
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


            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.gradient.shadow(.inner(radius: 1)))
                .frame(height: halfHeight)
                .modifier(RotationModifire(
                    rotation: rotation,
                    currentValue: currentValue,
                    nextValue: nextValue,
                    fontSize: fontSize,
                    foregroud: foreground,
                    size: size
                    )
                )
                .clipped()
                .rotation3DEffect(
                    .init(degrees: rotation),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .bottom,
                    perspective: 0.4
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .zIndex(10)

            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: cornerRadius, bottomTrailingRadius: cornerRadius, topTrailingRadius: 0)
                .fill(background.gradient.shadow(.inner(radius: 1)))
                .frame(height: halfHeight)
                .overlay(alignment: .bottom) {
                    TextView(currentValue)
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: size.width, height: size.height)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 3)) {
                rotation = -180
            }
        }
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
    var size: CGSize
    var animatableData: CGFloat {
        get { rotation }
        set { rotation = newValue }
    }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                Group {
                    if -rotation > 90 {
                        Text("\(nextValue)")
                            .font(.system(size: fontSize).bold())
                            .foregroundStyle(foregroud)
                            .scaleEffect(x: 1, y: -1)
                            .transition(.identity)
                    } else {
                        Text("\(currentValue)")
                            .font(.system(size: fontSize).bold())
                            .foregroundStyle(foregroud)
                            .transition(.identity)
                    }
                }
                .frame(width: size.width, height: size.height)
            }
    }
}

#Preview {
    ContentView()
}
