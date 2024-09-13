//
//  ProfileView.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-07-27.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
        var body: some View {
            if let user = viewModel.currentUser{
                List{
                    Section{
                        HStack{
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(user.fullname)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                    }
                    Section("General"){
                        HStack{
                            SettingRowView(imageName: "gear",
                                           title: "Version",
                                           tintColor: Color(.systemGray))
                            
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Section("Add Paition"){
                        HStack{
                            SettingRowView(imageName: "user",
                                           title: "Add Paition",
                                           tintColor: Color(.systemBlue))
                        }
                    }
                    Section("Account"){
                        Button{
                            viewModel.signOut()
                            
                        }label: {
                            SettingRowView(imageName: "arrow.left.circle.fill",
                                           title: "Sign Out",
                                           tintColor: .orange)
                        }
                        
                     
                        Button{
                            print("Delete Account...")
                            
                        }label: {
                            SettingRowView(imageName: "xmark.circle.fill",
                                           title: "Delete Account",
                                           tintColor: .red)
                        }
                        
                    }
                }
                
            }
        }
    }
    
    
        
  
        

struct ProfileView_Preview:PreviewProvider {
    static var previews: some View{
        ProfileView()
    }
}
