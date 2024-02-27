//
//  Modifiers.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import Foundation
import SwiftUI

struct TextfieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .padding()
            .frame(width: 352, height: 40)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
