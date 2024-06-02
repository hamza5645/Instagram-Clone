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
        .init(id: NSUUID().uuidString, username: "hamza", profileImageUrl: nil, fullname: "Hamza Abdelrahman", bio: "Software Dev", email: "hamza@gmail.com"),
        .init(id: NSUUID().uuidString, username: "salman", profileImageUrl: nil, fullname: "Salman Abdelrahman", bio: "Loves Coconust", email: "salman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "malika", profileImageUrl: nil, fullname: "Malika Abdelrahman", bio: "Ayam goreng", email: "malika@gmail.com"),
        .init(id: NSUUID().uuidString, username: "dad", profileImageUrl: nil, fullname: "Abdelrahman Osama", bio: "Cartoon Expert", email: "abdo@gmail.com"),
        .init(id: NSUUID().uuidString, username: "mom", profileImageUrl: nil, fullname: "Mother", bio: "professional cook", email: "mom@gmail.com"),
    ]
}
