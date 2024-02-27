//
//  RoomView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct RoomView: View {
    
    let room: Room
    let user: User?
    
    var body: some View {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(room.roomName)
                        HStack(spacing: 4) {
                            Text("Created at")
                            Text("\(room.createdTimestamp)")
                        }
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    }
                    .padding(.leading, 30)
                    Spacer()
                    
                    NavigationLink {
                        if user != nil {
                            RoomDetailView(room: room)
                                .navigationBarBackButtonHidden()
                        } else {
                            LoginView()
                                .navigationBarBackButtonHidden()
                        }
                    } label: {
                        Circle()
                            .frame(width: 32)
                            .foregroundStyle(.clear)
                            .overlay {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                                    .imageScale(.medium)
                            }
                    }
                    .padding(.trailing, 30)
                }
                
                
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
                    .fill(.clear)
                    .frame(width: 352, height: 50)
                    
            }
        }
    
}

#Preview {
    RoomView(room: Chat_RoomsApp.previewRoom, user: Chat_RoomsApp.previewUser)
}
