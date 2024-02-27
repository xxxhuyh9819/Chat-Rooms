//
//  SignupView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var viewModel = SignupViewModel()
    
    private var isDisabled: Bool {
        return viewModel.username.isEmpty || viewModel.email.isEmpty || viewModel.password.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                Spacer()
                
                Logo()
                
                InputWithClearButton(text: $viewModel.username, titleKey: "Enter your username", isForText: true)
                    .modifier(TextfieldModifier())
                
                InputWithClearButton(text: $viewModel.email, titleKey: "Enter your email", isForText: true)
                    .modifier(TextfieldModifier())

                
                InputWithClearButton(text: $viewModel.password, titleKey: "Enter your password", isForText: false)
                    .modifier(TextfieldModifier())
                
                Button {
                    Task {
                        try await viewModel.signUp()
                    }
                } label: {
                    ButtonLabel(text: "Register")
                }
                .disabled(isDisabled)
                .opacity(isDisabled ? 0.5 : 1)
                
                Spacer()
                
                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        Text("Log in")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.app)
                    .font(.footnote)
                }
                
                
            }
        }
        
    }
}
#Preview {
    SignupView()
}
