//
//  LoginView.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                // image
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 120)
                    .padding(.vertical,32)
                
                // form Fields
                
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                //sign in button
                Button{
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                    
                }label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                          }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                       }
                .background(Color(.systemBlue))
                .disabled(!formISvalid)
                .opacity(formISvalid ? 1.0: 0.5)
                .cornerRadius(10)
                .padding(.top, 50)
                }
                
                
                Spacer()
                // sing up button
            
            NavigationLink{
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            }
            
        label:{
            HStack(spacing: 3){
                Text("Don't have an account? ")
                Text("Sign Up")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 }
            .font(.system(size: 14))
              }
            }
        }
    }
// MARK: - Authntication Form Prototol

extension LoginView: AuthenticationFormProtocol {
    var formISvalid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}



