//
//  ButtonLabel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct ButtonLabel: View {
    
    let buttonColor: Color
    let textColor: Color
    let text: String

    init(buttonColor: Color = Color(.app), textColor: Color = Color(.buttonText), text: String) {
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.text = text
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 352, height: 40)
            .foregroundStyle(buttonColor)
            .overlay {
                Text(text)
                    .foregroundStyle(textColor)
            }
    }
}

#Preview {
    ButtonLabel(text: "text")
}
