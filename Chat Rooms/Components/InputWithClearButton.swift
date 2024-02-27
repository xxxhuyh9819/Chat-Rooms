//
//  TextFieldWithClearButton.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct InputWithClearButton: View {
    
    @Binding var text: String
    let titleKey: String
    let isForText: Bool
    
    var body: some View {
        HStack {
            if (isForText) {
                TextField(titleKey, text: $text)
            } else {
                SecureField(titleKey, text: $text)
                    .textContentType(.password)
            }
            if !text.isEmpty {
                Button {
                    text = ""
                }label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundStyle(.app)
                }
            }
        }
    }
}

#Preview {
    InputWithClearButton(text: .constant("dasd"), titleKey: "", isForText: false)
}
