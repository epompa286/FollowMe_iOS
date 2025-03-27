//
//  FirebaseAuthRepository.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation
import FirebaseAuth

class FirebaseAuthRepository: AuthRepository {
    var currentUserEmail: String? = nil
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                self.currentUserEmail = user.email
                completion(.success(user.isEmailVerified))
            }
        }
    }

    func signUp(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user.isEmailVerified))
            }
        }
    }
}
