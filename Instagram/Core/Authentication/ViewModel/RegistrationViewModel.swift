//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var emailError: String?
    @Published var usernameError: String?
    @Published var passwordError: String?

    func validateEmail() {
        if email.isEmpty {
            emailError = "Email cannot be empty."
        } else if !isValidEmail(email) {
            emailError = "Invalid email format."
        } else {
            emailError = nil
        }
    }

    func validateUsername() {
        if username.isEmpty {
            usernameError = "Username cannot be empty."
        } else if username.count < 3 {
            usernameError = "Username must be at least 3 characters."
        } else {
            usernameError = nil
        }
    }

    func validatePassword() {
        if password.isEmpty {
            passwordError = "Password cannot be empty."
        } else if password.count < 6 {
            passwordError = "Password must be at least 6 characters."
        } else {
            passwordError = nil
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
