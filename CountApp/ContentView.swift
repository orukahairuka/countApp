//
//  ContentView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/05/31.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var isShowSheet = false
    var body: some View {
        NavigationStack {
            VStack {
//                FlipClockTextEffect(
//                    value:count,
//                    size: CGSize(width: 100, height: 150),
//                    fontSize: 70,
//                    cornerRadius: 10,
//                    foreground: .white,
//                    background: .red
//                )
//
//                Button("Update") {
//                    count += 1
//                }
//                .padding(.top, 45)
                Button {
                    isShowSheet.toggle()
                } label: {
                    Text("日時の変更")
                        .foregroundStyle(.black)
                        .frame(width: 120, height: 100)
                        .background(.red)
                }
                .sheet(isPresented: $isShowSheet) {
                    HalfDetailView(isShowSheet: $isShowSheet)
                        .presentationDetents([.medium])
                }
            }
            .padding()

        }
    }
}

#Preview {
    ContentView()
}
