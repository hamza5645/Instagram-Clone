//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/10/24.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @StateObject var authService = AuthService.shared
    
    @State private var navigateToNextView = false
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create a username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this username to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text: $viewModel.username)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .modifier(IGTextFieldModifier())
                .onChange(of: viewModel.username) { _ in
                    viewModel.validateUsername()
                }
            
            // Display error message
            if let errorMessage = viewModel.usernameError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                viewModel.validateUsername()
                if viewModel.usernameError == nil {
                    navigateToNextView = true
                }
            }) {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .cornerRadius(10)
                    .background(viewModel.usernameError == nil ? Color(.systemBlue) : Color.gray)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            .disabled(viewModel.usernameError != nil)
            
            // NavigationLink with condition
            NavigationLink(destination: CreatePasswordView().navigationBarBackButtonHidden(true), isActive: $navigateToNextView) {
                EmptyView()
            }
            
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

#Preview {
    CreateUsernameView()
        .environmentObject(RegistrationViewModel())
}
