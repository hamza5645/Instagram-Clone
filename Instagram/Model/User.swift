//
//  User.swift
//  Instagram
//
//  Created by Hamza Osama on 4/12/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "hamza", profileImageUrl: "pfp-hamza", fullname: "Hamza Abdelrahman", bio: "Software Dev", email: "hamza@gmail.com"),
        .init(id: NSUUID().uuidString, username: "salman", profileImageUrl: "pfp-salman", fullname: "Salman Abdelrahman", bio: "Loves Coconust", email: "salman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "malika", profileImageUrl: "pfp-malika", fullname: "Malika Abdelrahman", bio: "Ayam goreng", email: "malika@gmail.com"),
        .init(id: NSUUID().uuidString, username: "dad", profileImageUrl: "pfp-dad", fullname: "Abdelrahman Osama", bio: "Cartoon Expert", email: "abdo@gmail.com"),
        .init(id: NSUUID().uuidString, username: "mom", profileImageUrl: "pfp-mom", fullname: "Mother", bio: "professional cook", email: "mom@gmail.com"),
    ]
}
