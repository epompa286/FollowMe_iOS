//
//  Router.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation
import SwiftUICore

struct Router: View {
    @EnvironmentObject var dependencies: AppDependencies

    var body: some View {
        LandingView(
            viewModel: LandingViewModel(
                repository: dependencies.authRepository
            )
        )
    }
}
