//
//  UploadPostView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/15/24.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    
    var body: some View {
        VStack {
            
            // action toolbar
            HStack {
                Button {
                    print("Cancel upload")
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack(spacing: 8) {
                Image("amg-2")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
