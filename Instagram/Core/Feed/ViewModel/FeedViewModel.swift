//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Hamza Osama on 6/4/24.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for post in posts {
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
        }
    }
}
