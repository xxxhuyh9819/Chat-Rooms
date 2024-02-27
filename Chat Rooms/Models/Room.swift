//
//  Room.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Room: Identifiable, Codable {
    @DocumentID private var roomId: String?
    let roomName: String
    let createdTimestamp: String
    
    var id: String {
        return roomId ?? NSUUID().uuidString
    }
}
