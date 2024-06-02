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
    var animationDuration: CGFloat = 0.8

    @State private var nextValue: Int = 0
    @State private var currentValue: Int = 0
    @State private var rotation: CGFloat = 0
    var body: some View {
        let halfHeight = size.height * 0.5
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.shadow(.inner(radius: 1)))
                .frame(height: halfHeight)
                .overlay(alignment: .top) {
                    TextView(nextValue)
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .top)


            UnevenRoundedRectangle(topLeadingRadius: cornerRadius, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: cornerRadius)
                .fill(background.shadow(.inner(radius: 1)))
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
                    anchorZ: 0,
                    perspective: 0.4
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .zIndex(10)

            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: cornerRadius, bottomTrailingRadius: cornerRadius, topTrailingRadius: 0)
                .fill(background.shadow(.inner(radius: 0)))
                .frame(height: halfHeight)
                .overlay(alignment: .bottom) {
                    TextView(currentValue)
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: size.width, height: size.height)

        .frame(width: size.width, height: size.height)
        .onChange(of: value, initial: true) { oldValue, newValue in
            currentValue = oldValue
            nextValue = newValue

            guard rotation == 0 else {
                currentValue = newValue
                return
            }

            guard oldValue != newValue else { return }

            withAnimation(.easeInOut(duration: animationDuration), completionCriteria: .logicallyComplete) {
                rotation = -180
            } completion: {
                rotation = 0
                currentValue = newValue
            }
        }
    }


    @ViewBuilder
    func TextView(_ value: Int) -> some View {
        Text("\(value)")
            .font(.system(size: fontSize).bold())
            .foregroundStyle(foreground)
            .lineLimit(1)
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
                            .lineLimit(1)
                    } else {
                        Text("\(currentValue)")
                            .font(.system(size: fontSize).bold())
                            .foregroundStyle(foregroud)
                            .transition(.identity)
                            .lineLimit(1)
                    }
                }
                .frame(width: size.width, height: size.height)
                .drawingGroup()
            }
    }
}

//#Preview {
//    ContentView()
//}
