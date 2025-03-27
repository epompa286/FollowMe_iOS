//
//  AuthService.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation

protocol AuthRepository {
    associatedtype _User
    var currentUser: _User? { get }
    func signIn(email: String, password: String, completion: @escaping (Result<_User, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<_User, Error>) -> Void)
}
