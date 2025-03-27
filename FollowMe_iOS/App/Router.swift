//
//  Router.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation
import SwiftUICore

@MainActor
struct Router{
    let dependencies: AppDependencies
    
    func makeLandingView() -> some View {
        LandingView(
            viewModel: LandingViewModel(
                repository: dependencies.authRepository
            ),
            router: self
        )
    }
    
    func makeTripLeadView() -> some View {
        TripLeadView()
    }
}
