//
//  Trip.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import Foundation

struct Trip: Codable {
    var email: String
    var startTime: Date = Date()
    var endTime: Date? = nil
    var status: String = "active"
    
    init(with email: String) {
        self.email = email
    }
}
