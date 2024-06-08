//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation

//@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var emailError: String?
    
    func validateEmail() {
            if email.isEmpty {
                emailError = "Email cannot be empty."
            } else if !isValidEmail(email) {
                emailError = "Invalid email format."
            } else {
                emailError = nil
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
