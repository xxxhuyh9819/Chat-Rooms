//
//  EditProfileViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var newUsername: String
    
    init(user: User) {
        self.user = user
        self.newUsername = user.username
        Task {
            try await loadUserData()
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        let user = try await UserService.shared.getUserWithId(withUid: user.id)
        self.newUsername = user.username
        self.user.username = newUsername
    }
    
    func updateUserData() async throws {
        let snapshot = try await Firestore.firestore().collection("users").document(user.id).getDocument()
        let user = try snapshot.data(as: User.self)
        print("user fetched: \(user.username) \(user.email)")
        print("changing nickname to: \(newUsername)")
        try await Firestore.firestore().collection("users").document(user.id).updateData([
            "username": newUsername
        ])
        try await loadUserData()
        print("Data updated!")
    }
}
