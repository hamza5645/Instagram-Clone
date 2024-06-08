//
//  AddEmailView.swift
//  Instagram
//
//  Created by Hamza Osama on 4/9/24.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @StateObject var authService = AuthService.shared
    
    @State private var navigateToNextView = false
    
    var body: some View {
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
            
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .modifier(IGTextFieldModifier())
                .onChange(of: viewModel.email) { _ in
                    viewModel.validateEmail()
                }
            
            Button(action: {
                viewModel.validateEmail()
                if viewModel.emailError == nil {
                    navigateToNextView = true
                }
            }) {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .cornerRadius(10)
                    .background(viewModel.emailError == nil ? Color(.systemBlue) : Color.gray)
                    .cornerRadius(10)
            }
            .padding(.vertical)
            .disabled(viewModel.emailError != nil)
            
            // Display error message
            if let errorMessage = viewModel.emailError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            // NavigationLink with condition
            NavigationLink(destination: CreateUsernameView().navigationBarBackButtonHidden(true), isActive: $navigateToNextView) {
                EmptyView()
            }
            .hidden()
            
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
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
