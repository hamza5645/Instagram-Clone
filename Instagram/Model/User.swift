//
//  User.swift
//  Instagram
//
//  Created by Hamza Osama on 4/12/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "hamza", profileImageUrl: "pfp-1", fullname: "Hamza Abdelrahman", bio: "Software Dev", email: "hamza@gmail.com"),
        .init(id: NSUUID().uuidString, username: "salman", profileImageUrl: "pfp-2", fullname: "Salman Abdelrahman", bio: "Loves Coconust", email: "salman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "malika", profileImageUrl: "porsche-1", fullname: "Malika Abdelrahman", bio: "Ayam goreng", email: "malika@gmail.com"),
        .init(id: NSUUID().uuidString, username: "dad", profileImageUrl: "porsche-2", fullname: "Abdelrahman Osama", bio: "Cartoon Expert", email: "abdo@gmail.com"),
        .init(id: NSUUID().uuidString, username: "mom", profileImageUrl: "porsche-3", fullname: "Mother", bio: "professional cook", email: "mom@gmail.com"),
    ]
}
