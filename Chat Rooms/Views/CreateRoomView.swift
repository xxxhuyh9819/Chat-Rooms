//
//  CreateRoomView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/25.
//

import SwiftUI

struct CreateRoomView: View {
    
    @StateObject var viewModel = CreateRoomViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                VStack {
                    InputWithClearButton(text: $viewModel.roomName, titleKey: "What's the name of your new room?", isForText: true)
                        .modifier(TextfieldModifier())
                }
                
                Button {
                    Task {
                        try await viewModel.createRoom()
                        dismiss()
                    }
                } label: {
                    ButtonLabel(text: "Create Room")
                }
                .disabled(viewModel.roomName.isEmpty)
                .opacity(viewModel.roomName.isEmpty ? 0.5 : 1)

                Spacer()
                
            }
            .navigationTitle("Create Room")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.app)
                    }
                }
            }
        }
    }
}

#Preview {
    CreateRoomView()
}
