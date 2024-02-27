//
//  EditProfileView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/26.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel: EditProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Update your nickname")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        InputWithClearButton(text: $viewModel.newUsername, titleKey: "", isForText: true)
                        .modifier(TextfieldModifier())
                        
                        Button {
                            dismiss()
                            Task {
                                try await viewModel.updateUserData()
                            }
                        } label: {
                            ButtonLabel(text: "Update")
                        }
                    }
                    .padding(.top)
                    
                }
                .navigationTitle("Update Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            RoomsListView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Cancel")
                                .foregroundStyle(.app)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: Chat_RoomsApp.previewUser)
}
