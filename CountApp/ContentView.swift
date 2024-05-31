//
//  ContentView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/05/31.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    var body: some View {
        NavigationStack {
            VStack {
                FlipClockTextEffect(
                    value:count,
                    size: CGSize(width: 100, height: 150),
                    fontSize: 70,
                    cornerRadius: 10,
                    foreground: .white,
                    background: .red
                )

                Button("Update") {
                    count += 1
                }
                .padding(.top, 45)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
