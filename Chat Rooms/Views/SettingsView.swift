//
//  SettingsView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct SettingsView: View {
    
    let user: User?
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.dismiss) var dismiss
    @State var showLoginView = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                    if user != nil {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            ButtonLabel(buttonColor: .red, textColor: .white, text: "Log out")
                        }
                    } else {
                        NavigationLink {
                            LoginView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            ButtonLabel(buttonColor: .red, textColor: .white, text: "Log in")
                        }
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.gray)
                            .imageScale(.medium)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(user: Chat_RoomsApp.previewUser)
}
