//
//  Post.swift
//  Instagram
//
//  Created by Hamza Osama on 4/14/24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Caption 1", likes: 10, imageUrl: "porsche-1", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Caption 2", likes: 20, imageUrl: "porsche-2", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Caption 3", likes: 30, imageUrl: "porsche-3", timestamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Caption 4", likes: 40, imageUrl: "amg-1", timestamp: Date(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Caption 5", likes: 50, imageUrl: "amg-2", timestamp: Date(), user: User.MOCK_USERS[4])
    ]
}
