//
//  MessageBubble.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct MessageBubble: View {
    
    let text: String
    let backgroundColor: Color
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
            .padding(8)
            .background(backgroundColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    MessageBubble(text: "dasd", backgroundColor: .red)
}
