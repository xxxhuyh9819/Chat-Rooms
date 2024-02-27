//
//  messageViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class MessageViewModel: ObservableObject {
    
    @Published var user: User?
    let message: Message
    @Published var sentByCurrentUser: Bool?
    
    init(message: Message) {
        self.message = message
        Task {
            try await getUserWithId(message: message)
            try await sentByCurrentUser = isSentByCurrentUser()
        }
    }
    
    @MainActor
    func getUserWithId(message: Message) async throws {
        try await self.user = UserService.shared.getUserWithId(withUid: message.senderId)
    }
    
    @MainActor
    func isSentByCurrentUser() async throws -> Bool? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        let currentUser = try await UserService.shared.getUserWithId(withUid: currentUid)
        print(user == currentUser)
        return user == currentUser
    }
}
