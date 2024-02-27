//
//  AuthService.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    static let shared = AuthService()
    @Published var currentUser: FirebaseAuth.User?
    
    private init() {
        self.currentUser = Auth.auth().currentUser
        Task { try await UserService.shared.getCurrentUser() }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await uploadUserData(id: result.user.uid, username: username, email: email)
            self.currentUser = result.user
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func uploadUserData(id: String, username: String, email: String) async throws {
        let user = User(id: id, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.currentUser = result.user
            print("USER \(result.user.uid)")
            try await UserService.shared.getCurrentUser()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out")
        }
    }
}
