//
//  RoomDetailViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation

class RoomDetailViewModel: ObservableObject {
    
    let room: Room
    @Published var messages = [Message]()
    @Published var body = ""
    
    init(room: Room) {
        self.room = room
        Task {
            try await getMessagesByRoomId(roomId: room.id)
        }
    }
    
    @MainActor
    func getMessages() async throws {
        try await self.messages = MessageService.shared.getMessages()
    }
    
    @MainActor
    func getMessagesByRoomId(roomId: String) async throws {
        let messages = try await MessageService.shared.getMessagesByRoomId(roomId: room.id)
        self.messages = messages.sorted { msg1, msg2 in
            msg1.createdTimestamp < msg2.createdTimestamp
        }
    }
    
    func createMessage(room: Room) async throws {
        try await MessageService.shared.createMessage(room: room, body: body)
    }
}
