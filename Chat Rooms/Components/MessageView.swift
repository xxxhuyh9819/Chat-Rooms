//
//  MessageView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct MessageView: View {
    
    let message: Message
    @StateObject var viewModel: MessageViewModel
    
    init(message: Message) {
        self.message = message
        self._viewModel = StateObject(wrappedValue: MessageViewModel(message: message))
    }
    
    var body: some View {
        VStack {
            if let sentByCurrentUser = viewModel.sentByCurrentUser {
                // message from logged in user
                if (sentByCurrentUser) {
                    HStack(alignment: .top) {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            HStack {
                                Text(message.createdTimestamp)
                                Text(viewModel.user?.username ?? "???")
                            }
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            
                            MessageBubble(text: message.body, backgroundColor: .green)
                                .overlay(alignment: .topTrailing) {
                                    Image(systemName: "arrowtriangle.right.fill")
                                        .offset(x: 7, y: 6)
                                        .foregroundStyle(.green)
                                }
                        }
                        UserIndicator(user: viewModel.user)
                    }
                    .padding(.leading, 50)
                } else {
                    // message from other user
                    HStack(alignment: .top) {
                        UserIndicator(user: viewModel.user)
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Text(viewModel.user?.username ?? "???")
                                Text(message.createdTimestamp)
                            }
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            
                            MessageBubble(text: message.body, backgroundColor: .gray)
                                .overlay(alignment: .topLeading) {
                                    Image(systemName: "arrowtriangle.left.fill")
                                        .offset(x: -7, y: 6)
                                        .foregroundStyle(.gray)
                                }
                        }
                    }
                    .padding(.trailing, 50)
                }
            }
            
        }
    }
}

//#Preview {
//    MessageView(message: Message(roomId: "", senderId: "", createdTimestamp: "", body: "dasda"))
//}
