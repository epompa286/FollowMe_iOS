//
//  TripPoint.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation

struct TripPoint: Codable {
    var latitude: Double
    var longitude: Double
    var bearing: Double?
    var timestamp: Date
}
