//
//  AuthService.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation

protocol AuthRepository {
    var currentUserEmail: String? { get }
    
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
