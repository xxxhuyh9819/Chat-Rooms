//
//  RoomsService.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RoomService {
    @Published var currentUser: User?
    
    static let shared = RoomService()
    
    @MainActor
    func getRooms() async throws -> [Room] {
        // see if currentUser is there
//        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        // get current user info from database by user id
        do {
            let snapshot = try await Firestore.firestore().collection("rooms").getDocuments()
            let rooms = snapshot.documents.compactMap({ try? $0.data(as: Room.self) })
            return rooms
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @MainActor
    func createRoom(roomName: String) async throws {
        do {
            let room = Room(roomName: roomName, createdTimestamp: formattedDate(date: Date()))
            guard let encodedRoom = try? Firestore.Encoder().encode(room) else { return }
            try await Firestore.firestore().collection("rooms").document().setData(encodedRoom)
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
