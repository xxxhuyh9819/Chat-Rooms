//
//  RoomsView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import SwiftUI

struct RoomsListView: View {
    
    @State var showCreateRoomView: Bool = false
    @State var showEditProfileView: Bool = false
    @StateObject var viewModel = RoomsViewModel()
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    // src: https://forums.developer.apple.com/forums/thread/683177
    func updateRoomsLive() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Task {
                try await viewModel.getRooms()
            }
            updateRoomsLive()
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                ScrollView {
                    ForEach(viewModel.rooms) {room in
                        RoomView(room: room, user: user)
                            .navigationBarBackButtonHidden()
                    }
                }
                .onAppear {
                    updateRoomsLive()
                }
                .padding(.top)
                .navigationTitle("Rooms")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            if let user = user {
                                EditProfileView(user: user)
                                    .navigationBarBackButtonHidden()
                            } else {
                                LoginView()
                                    .navigationBarBackButtonHidden()
                            }
                        } label: {
                            UserIndicator(user: user)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsView(user: user)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundStyle(.app)
                        }
                    }
                }
                
                if user != nil {
                    Button {
                        showCreateRoomView.toggle()
                    } label: {
                        CreateNewRoomLabel()
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity, maxHeight: .infinity/*@END_MENU_TOKEN@*/, alignment: .bottomTrailing)
                    .padding()
                } else {
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        CreateNewRoomLabel()
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity, maxHeight: .infinity/*@END_MENU_TOKEN@*/, alignment: .bottomTrailing)
                    .padding()
                }
            }
        }
        .refreshable {
            Task {try await viewModel.getRooms()}
        }
        .sheet(isPresented: $showCreateRoomView, content: {
            CreateRoomView()
        })
    }
    
}

#Preview {
    RoomsListView()
}
