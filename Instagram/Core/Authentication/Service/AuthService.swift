//
//  AuthService.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var errorMessage: String?
    @Published var isAuthenticated: Bool = false
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
            if result.user != nil {
                isAuthenticated = true
                errorMessage = nil
            }
        } catch {
            handleError(error)
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            errorMessage = nil
        } catch {
            handleError(error)
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    private func handleError(_ error: Error) {
        // Provide detailed error messages based on the error type
        if let errorCode = AuthErrorCode.Code(rawValue: (error as NSError).code) {
            switch errorCode {
            case .wrongPassword:
                errorMessage = "Incorrect password. Please try again."
            case .invalidEmail:
                errorMessage = "Invalid email format. Please check your email."
            case .userNotFound:
                errorMessage = "No account found with this email. Please sign up."
            case .emailAlreadyInUse:
                errorMessage = "This email is already in use. Please use a different email."
            case .weakPassword:
                errorMessage = "Your password is too weak. Please choose a stronger password."
            default:
                errorMessage = "Signup failed: \(error.localizedDescription)"
            }
        } else {
            errorMessage = "An unknown error occurred. Please try again."
        }
    }
}
