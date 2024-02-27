//
//  MessageService.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MessageService {
//    @Published var room: Room?
    
    static let shared = MessageService()
    
    
    @MainActor
    func getMessages() async throws -> [Message] {
        // see if currentUser is there
//        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        // get current user info from database by user id
        do {
            let snapshot = try await Firestore.firestore().collection("messages").getDocuments()
            let messages = snapshot.documents.compactMap({ try? $0.data(as: Message.self) })
            return messages
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @MainActor
    func getMessagesByRoomId(roomId: String) async throws -> [Message] {
        do {
            let query = Firestore.firestore().collection("messages").whereField("roomId", isEqualTo: roomId)
            let snapshot = try await query.getDocuments()
            let messages = snapshot.documents.compactMap({ try? $0.data(as: Message.self) })
            return messages
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @MainActor
    func createMessage(room: Room, body: String) async throws {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }

        do {
            let message = Message(roomId: room.id, senderId: currentUserId, createdTimestamp: formattedDate(date: Date()), body: body)
            guard let encodedMessage = try? Firestore.Encoder().encode(message) else { return }
            try await Firestore.firestore().collection("messages").document().setData(encodedMessage)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func formattedDate(date: Date) -> String {
        let formatterInput = DateFormatter()
        formatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let formatterOutput = DateFormatter()
        formatterOutput.dateStyle = .long
        let prettyDate = formatterOutput.string(from: date)
        return prettyDate
    }
}
