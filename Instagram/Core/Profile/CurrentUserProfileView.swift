//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/13/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var post: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                // header
                ProfileHeaderView(user: user)
                
                // grid view
                PostGridView(post: post)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
