//
//  SignupViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation
class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func signUp() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}
