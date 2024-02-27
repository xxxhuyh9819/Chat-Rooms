//
//  Logo.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image(systemName: "bubble.left")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    Logo()
}
