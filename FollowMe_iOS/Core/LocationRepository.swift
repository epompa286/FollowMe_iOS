//
//  TripPointRepository.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import Foundation

protocol LocationRepository {
    associatedtype Point
    func getLatestTripPoint(id: String, completion: @escaping (Result<Point, Error>) -> Void)
    func getAllTripPoints(id: String, completion: @escaping (Result<[Point], Error>) -> Void)
}

protocol LocationLeadRepository: LocationRepository {
    associatedtype Reference
    func addTripPoint(_ point: TripPoint, id: String, completion: @escaping (Result<Void, Error>) -> Void)
    func startTrip(email: String, completion: @escaping (Result<Reference, Error>) -> Void)
    func pauseTrip(id: String, completion: @escaping (Result<Void, Error>) -> Void)
    func endTrip(id: String, completion: @escaping (Result<Void, Error>) -> Void)
}

protocol LocationFollowerRepository: LocationRepository {
    associatedtype Status
    associatedtype DateTimeFormat
    func getStatus(id: String, completion: @escaping (Result<Status, Error>) -> Void)
    func getStartTime(id: String, completion: @escaping (Result<DateTimeFormat, Error>) -> Void)
    func getEndTime(id: String, completion: @escaping (Result<DateTimeFormat, Error>) -> Void)
}
