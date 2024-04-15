//
//  AuthService.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        print("Email is \(email)")
        print("password is \(password)")
        print("username is \(username)")
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
