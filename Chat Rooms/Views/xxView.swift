//
//  xxView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/27.
//

import SwiftUI

struct xxView: View {
    @State private var email = ""
        @FocusState private var nameIsFocused: Bool

        var body: some View {
            VStack {
                    TextField("Email address", text: $email)
                    Button(action: {
                    }) {
                            Text("Sign in")
                                    .fontWeight(.semibold)
                    }
                }
                .onTapGesture {
                        hideKeyboard()
                }
        }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

#Preview {
    xxView()
}
