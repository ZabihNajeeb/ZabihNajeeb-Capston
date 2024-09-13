//
//  AuthViewModel.swift
//  SignUp and LogIn
//
//  Created by MacUser on 2024-08-02.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol{
    var formISvalid: Bool { get }
}


@MainActor

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
            
        }
    }
        func signIn(withEmail email: String, password: String) async throws{
            do{
                let result = try  await Auth.auth().signIn(withEmail: email, password: password)
                self.userSession = result.user
                await fetchUser()
            }catch{
                print("Degub: failed to log in with error \(error.localizedDescription)")
            }
        }
    
        func createUser(withEmail email: String, password: String, fullname: String) async throws{
            do {
                let restul = try await Auth.auth().createUser(withEmail: email, password: password)
                self.userSession = restul.user
                let user = User(id: restul.user.uid, fullname: fullname, email: email)
                let encodeUser = try Firestore.Encoder().encode(user)
                try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
                await fetchUser()
               } catch {
                print("Debug: Failed to create user with error\(error.localizedDescription)")
            }
        }
        
        func signOut(){
            do{
                try Auth.auth().signOut()
                self.userSession = nil
                self.currentUser = nil
            } catch {
                print("Debug: failed to sign out with erorr \(error.localizedDescription)")
            }
        }
        
        func deleteAccount(){
            
        }
    func fetchUser() async {
            guard let uid = Auth.auth().currentUser?.uid else {return}
            guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
            self.currentUser = try? snapshot.data(as:User.self)
        }
    }

