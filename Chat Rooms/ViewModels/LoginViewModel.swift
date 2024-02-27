//
//  LoginViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
