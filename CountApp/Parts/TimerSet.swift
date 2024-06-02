//
//  TimerSetView.swift
//  CountApp
//
//  Created by 櫻井絵理香 on 2024/06/01.
//

import SwiftUI

struct TimerSet: View {
    @Binding var selectionDate: Date
    var body: some View {
        VStack {
            /// ラベル
            HStack {
                Image(systemName: "timer")
                Text("日時設定")
            }
            .font(.title)
            .bold()
            /// DatePicker
            DatePicker("出国日時", selection: $selectionDate)
                .labelsHidden()
        }
    }
}

#Preview {
    TimerSet(selectionDate: .constant(Date()))
        .environment(\.locale, Locale(identifier: "ja_JP"))    // 追加
}
