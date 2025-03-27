//
//  AppDependencies.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation

@MainActor
final class AppDependencies: ObservableObject {
    let authRepository: AuthRepository
    
    init() {
        self.authRepository = FirebaseAuthRepository()
    }
}
