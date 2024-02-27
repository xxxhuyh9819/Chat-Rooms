//
//  ContentViewModel.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var currentUser: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
//    private func setupSubscribers() {
//        AuthService.shared.$currentUser.sink { [weak self] session in
//            self?.currentUser = session
//        }.store(in: &cancellables)
//    }
    
    private func setupSubscribers() {
        AuthService.shared.$currentUser.sink { user in
            self.currentUser = user
        }.store(in: &cancellables)
    }
}
