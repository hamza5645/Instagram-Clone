//
//  ProfileView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/8/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var post: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        ScrollView{
            
            // header
            ProfileHeaderView(user: user)
            
            // grid view
            PostGridView(post: post)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
