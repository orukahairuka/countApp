//
//  ContentView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                FlipClockTextEffect(
                    value:0,
                    size: CGSize(width: 100, height: 150),
                    fontSize: 70,
                    cornerRadius: 10,
                    foreground: .white,
                    background: .red
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
