//
//  UserService.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    
    init() {
        Task {
            try await getCurrentUser()
        }
    }
    
    static let shared = UserService()
    
    @MainActor
    func getCurrentUser() async throws {
        // see if currentUser is there
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        // get current user info from database by user id
        let snapshot = try await Firestore.firestore().collection("users").document(currentUserId).getDocument()
        // decode the snapshot to User instance
        let user = try snapshot.data(as: User.self)
        // update current user
        self.currentUser = user
    }
    
    func getUserWithId(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        
//        if let userData = try? JSONEncoder().encode(user) {
//            userCache.setObject(userData as NSData, forKey: uid as NSString)
//        }
        return user
    }
    
    
}
