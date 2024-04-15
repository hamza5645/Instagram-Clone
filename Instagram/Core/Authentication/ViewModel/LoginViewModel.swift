//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
