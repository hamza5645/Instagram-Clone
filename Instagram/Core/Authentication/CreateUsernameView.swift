//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/10/24.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text: $username)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            // login
            Button {
                print("Go to password now")
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .cornerRadius(10)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

#Preview {
    CreateUsernameView()
}
