//
//  User.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import Foundation

struct User: Codable, Equatable {
    let id: String
    var username: String
    let email: String
}
