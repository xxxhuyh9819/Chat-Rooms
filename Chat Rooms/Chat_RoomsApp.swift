//
//  Chat_RoomsApp.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Chat_RoomsApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    static let previewUser = User(id: "pre", username: "dasd", email: "dasd")
    static let previewRoom = Room(roomName: "Preview Room", createdTimestamp: "2024")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .fontDesign(.rounded)
//            xxView()
        }
    }
}
