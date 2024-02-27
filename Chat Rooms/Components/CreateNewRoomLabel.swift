//
//  CreateNewStuffLabel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct CreateNewRoomLabel: View {
    var body: some View {
        ZStack {
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)

            Image(systemName: "plus.circle.fill")
                .offset(x: -15, y: -20)
        }
        .foregroundStyle(.app)
    }
}

#Preview {
    CreateNewRoomLabel()
}
