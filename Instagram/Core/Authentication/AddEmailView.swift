//
//  AddEmailView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/9/24.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Text("Add your email")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("You'll use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                
                // login
                Button {
                    print("login")
                } label: {
                    Text("Login")
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
        }
        }
    }
}

#Preview {
    AddEmailView()
}