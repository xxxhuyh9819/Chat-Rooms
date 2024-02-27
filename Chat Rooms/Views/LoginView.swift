//
//  LoginView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    private var isDisabled: Bool {
        return viewModel.email.isEmpty || viewModel.password.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Logo()
                
                InputWithClearButton(text: $viewModel.email, titleKey: "Enter your email", isForText: true)
                    .modifier(TextfieldModifier())
                
                InputWithClearButton(text: $viewModel.password, titleKey: "Enter your password", isForText: false)
                    .modifier(TextfieldModifier())
                
                
                Button {
                    Task {
                        try await viewModel.login()
                    }
                } label: {
                    ButtonLabel(text: "Login")
                }
                .disabled(isDisabled)
                .opacity(isDisabled ? 0.5 : 1)
                
                NavigationLink {
                    RoomsListView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Continue as a guest?")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding(.trailing, 20)
                .foregroundColor(.app)
                .font(.footnote)
                
                Spacer()
                
                NavigationLink {
                    SignupView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
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
    LoginView()
}
