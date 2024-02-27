//
//  RoomsViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RoomsViewModel: ObservableObject {
    @Published var rooms = [Room]()
    @Published var currentUser: User?
    
    init() {
        Task {
            try await getCurrentUser()
            try await getRooms()
        }
    }
    
    @MainActor
    func getRooms() async throws {
        try await rooms = RoomService.shared.getRooms()
    }
    
    @MainActor
    func getCurrentUser() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        Task {
            try await self.currentUser = UserService.shared.getUserWithId(withUid: currentUid)
            print("rooms view model get user: \(currentUser?.username ?? "xxx")")
        }
    }
}
