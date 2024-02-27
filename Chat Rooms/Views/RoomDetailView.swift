//
//  RoomDetailView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct RoomDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let room: Room
    @State private var showCreateMessageView = false
    @StateObject var viewModel: RoomDetailViewModel
    @FocusState private var isFocused: Bool
    
    init(room: Room) {
        self.room = room
        self._viewModel = StateObject(wrappedValue: RoomDetailViewModel(room: room))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if (viewModel.messages.isEmpty) {
                    GeometryReader { geometry in
                        ScrollView {
                            VStack {
                                Logo()
                                Text("Be the first one to leave a message!")
                            }
                            .padding(.bottom, 100)
                            .frame(width: geometry.size.width)
                            .frame(height: geometry.size.height)
                        }
                    }
                } else {
                    ScrollView {
                        ForEach(viewModel.messages) { msg in
                            HStack {
                                MessageView(message: msg)
                                    .padding(.bottom)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.top)
                }
                
                ZStack {
                    
                    Rectangle()
                        .foregroundStyle(.buttonText)
                        .background(.buttonText)
                        .frame(height: 50)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .overlay(Rectangle()
                            .fill(.clear).padding([.top], 1))

                    HStack {
                        TextField("Say something...", text: $viewModel.body)
                            .modifier(TextfieldModifier())
                            .focused($isFocused)
                            .onSubmit {
                                Task {
                                    try await viewModel.createMessage(room: room)
                                    try await viewModel.getMessagesByRoomId(roomId: room.id)
                                    viewModel.body = ""
                                }
                            }
                        Button {
                            isFocused = false
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.medium)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            .navigationTitle(viewModel.room.roomName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.gray)
                            .imageScale(.medium)
                    }
                }
            }
        }
        .refreshable {
            Task {try await viewModel.getMessagesByRoomId(roomId: room.id)}
        }
    }
}

#Preview {
    RoomDetailView(room: Chat_RoomsApp.previewRoom)
}
