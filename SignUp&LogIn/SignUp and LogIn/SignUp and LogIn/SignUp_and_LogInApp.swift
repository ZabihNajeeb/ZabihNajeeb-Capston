//
//  SignUp_and_LogInApp.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-26.
//
import SwiftUI
import Firebase
@main

struct SingUp_and_LoginApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene{
        WindowGroup{
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
