//
//  halfModalView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/06/02.
//

import SwiftUI

struct HalfDetailView: View {
    @Binding var isShowSheet: Bool
    @State private var selectionDate = Date()
    var body: some View {
        TimerSet(selectionDate: $selectionDate)
    }
}

#Preview {
    HalfDetailView(isShowSheet: .constant(true))
}
