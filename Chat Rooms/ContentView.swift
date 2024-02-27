//
//  ContentView.swift
//  Chat Rooms
//
//  Created by Yunhao Hu on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if (viewModel.currentUser != nil) {
            RoomsListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
