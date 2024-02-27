//
//  CreateRoomViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

class CreateRoomViewModel: ObservableObject {
    
    @Published var roomName = ""
    
    @MainActor
    func createRoom() async throws {
        try await RoomService.shared.createRoom(roomName: roomName)
    }
}
