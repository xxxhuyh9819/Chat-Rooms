//
//  CurrentUserIndicator.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct UserIndicator: View {
    
    let user: User?
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color(.systemGray3))
            if let user = user {
                Text(user.username.prefix(1).capitalized)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
            } else {
                Image(systemName: "person")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .imageScale(.large)
            }
        }
    }
}

#Preview {
    UserIndicator(user: nil)
}
