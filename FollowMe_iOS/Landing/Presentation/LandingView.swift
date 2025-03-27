//
//  ContentView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/25/25.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel: LandingViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.state.isVerifyingPermissions { ProgressView() }
                
                VStack {
                    LandingTitleView()
                    
                    LandingButton(title: "Start Trip", backgroundColor: .blue) {
                        viewModel.send(.VerifyUser)
                    }
                    
                    LandingButton(title: "Follow Trip", backgroundColor: .red) {
                        // TODO: Implement function
                    }
                }
            }
            .padding()
            .background(Color("BackgroundColor"))
            .opacity(viewModel.state.isVerifyingPermissions ? 0.3 : 1)
            .sheet(isPresented: $viewModel.state.isLoginScreenPresented) {
                LoginView(viewModel: viewModel)
            }
            .navigationDestination(isPresented: $viewModel.state.activeDestination) {
                TripLeadView()
            }
        }
    }
}

#Preview {
    @Previewable @EnvironmentObject var viewModel: LandingViewModel
    LandingView(viewModel: viewModel)
}
