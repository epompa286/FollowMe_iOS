//
//  RegistrationView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/25/25.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: LandingViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Please register to continue")) {
                    TextField("Email", text: $viewModel.state.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

                    SecureField("Password", text: $viewModel.state.password)
                }

                Section {
                    Button("Register") {
                        viewModel.send(.CreateUser)
                    }
                }
            }
            .navigationTitle("Register")
            .alert(viewModel.state.errorMessage ?? "Unknown Error", isPresented: $viewModel.state.isErrorAlertPresented) {
                Button("Ok") {
                    
                }
            }
        }
    }
}

#Preview {
    @Previewable @EnvironmentObject var viewModel: LandingViewModel
    RegistrationView(viewModel: viewModel)
}
