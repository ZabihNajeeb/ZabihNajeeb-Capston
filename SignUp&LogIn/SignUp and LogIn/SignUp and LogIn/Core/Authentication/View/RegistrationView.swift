//
//  RegistrationView.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 120)
                .padding(.vertical,32)
            
            VStack(spacing: 24){
                
                ZStack(alignment: .trailing){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                                 if email.contains("@"){
                                     Image(systemName: "checkmark.circle.fill")
                                             .imageScale(.large)
                                             .fontWeight(.bold)
                                             .foregroundColor(Color(.systemGreen))
                                     }else{
                                         Image(systemName: "xmark.circle.fill")
                                             .imageScale(.large)
                                             .fontWeight(.bold)
                                             .foregroundColor(Color(.systemRed))
                                     }
                               }
                             }
                
                InputView(text:$fullname,
                          title: "Full Name",
                          placeholder: "Enter Your Full Name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter Your Password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing){
                                 InputView(text: $confirmPassword,
                                           title: "Confirm Password",
                                           placeholder: "Confirm your password",
                                           isSecureField: true)
                                 if !password.isEmpty && !confirmPassword.isEmpty{
                                     if password == confirmPassword{
                                     Image(systemName: "checkmark.circle.fill")
                                             .imageScale(.large)
                                             .fontWeight(.bold)
                                             .foregroundColor(Color(.systemGreen))
                                     }else{
                                         Image(systemName: "xmark.circle.fill")
                                             .imageScale(.large)
                                             .fontWeight(.bold)
                                             .foregroundColor(Color(.systemRed))
                                     }
                               }
                             }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button{
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname: fullname)
                }
                
            }label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                      }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                   }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 50)
            .disabled(!formISvalid)
            .opacity(formISvalid ? 1.0: 0.5)
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sing Up")
                        .fontWeight(.bold)
                                  }
                .font(.system(size: 14))
            }
            
        }
    }


// MARK: - Authntication Form Prototol

extension RegistrationView: AuthenticationFormProtocol {
    var formISvalid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}
#Preview {
    RegistrationView()
}
