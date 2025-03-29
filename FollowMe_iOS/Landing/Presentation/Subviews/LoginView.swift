//
//  LoginView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/25/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: LandingViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Please login to continue")) {
                    TextField("Email", text: $viewModel.state.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

                    SecureField("Password", text: $viewModel.state.password)
                    
                    Toggle("Save credentials", isOn: $viewModel.state.isSaveLoginChecked)
                        
                }

                Section {
                    Button("Sign In") {
                        viewModel.send(.AuthenticateUser)
                    }
                    
                    Button("Register") {
                        viewModel.send(.OpenRegistrationScreen)
                    }
                }
            }
            .navigationTitle("Login")
            .sheet(isPresented: $viewModel.state.isRegistrationScreenPresented) {
                RegistrationView()
            }
            .alert(viewModel.state.errorMessage ?? "Unknown Error", isPresented: $viewModel.state.isErrorAlertPresented) {
                Button("Ok") {
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LandingViewModel())
}
