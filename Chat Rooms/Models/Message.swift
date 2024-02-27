//
//  Message.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Codable {
    @DocumentID private var messageId: String?
    let roomId: String
    let senderId: String
    let createdTimestamp: String
    let body: String
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
}
