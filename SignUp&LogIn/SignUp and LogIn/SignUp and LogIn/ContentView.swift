//
//  ContentView.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }
            else{
                LoginView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
