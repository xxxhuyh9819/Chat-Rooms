//
//  LengthIndicator.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct LengthIndicator: View {
    
    var hasHitLengthLimit: Bool
    var contents: String
    var limit: Int
    
    var body: some View {
        Group {
            if (!hasHitLengthLimit) {
                Text("\(contents.count)/\(limit)")
                    .foregroundStyle(.gray)
            } else {
                Text("Character limit exceeded!")
                    .foregroundStyle(.red)
            }
        }
        .padding(.trailing)
        .font(.footnote)
    }
}

#Preview {
    LengthIndicator(hasHitLengthLimit: false, contents: "", limit: 10)
}
