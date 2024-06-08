//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/10/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @StateObject var authService = AuthService.shared
    
    @State private var navigateToNextView = false
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Password", text: $viewModel.password)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .modifier(IGTextFieldModifier())
                .padding(.top)
                .onChange(of: viewModel.password) { _ in
                    viewModel.validatePassword()
                }
            
            // Display error message
            if let errorMessage = viewModel.passwordError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                viewModel.validatePassword()
                if viewModel.passwordError == nil {
                    navigateToNextView = true
                }
            }) {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .cornerRadius(10)
                    .background(viewModel.passwordError == nil ? Color(.systemBlue) : Color.gray)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            .disabled(viewModel.passwordError != nil)
            
            // NavigationLink with condition
            NavigationLink(destination: CompleteSignUpView().navigationBarBackButtonHidden(true), isActive: $navigateToNextView) {
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
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
