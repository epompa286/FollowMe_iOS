//
//  TripLeadRepository.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import Foundation
import FirebaseFirestore

typealias Reference = DocumentReference
typealias Point = TripPoint
class FirestoreRepository {
    let db = Firestore.firestore()
    
    func startTrip(email: String, completion: @escaping (Result<DocumentReference, any Error>) -> Void) {
        do {
            let data = try Firestore.Encoder().encode(Trip(with: email))
            let documentReference = db.collection("trips").addDocument(data: data) { error in
                if let error = error {
                    completion(.failure(error))
                }
            }
            
            completion(.success((documentReference)))
        } catch {
            completion(.failure(error))
        }
    }
    
    func addTripPoint(_ point: TripPoint, id: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        do {
            let data = try Firestore.Encoder().encode(point)
            db.collection(id).addDocument(data: data) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    func pauseTrip(id: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        fatalError()
        #warning("Implement pauseTrip")
    }
    
    func endTrip(id: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        fatalError()
        #warning("Implement endTrip")
    }
    
    func getLatestTripPoint(id: String, completion: @escaping (Result<TripPoint, any Error>) -> Void) {
        fatalError()
        #warning("Implement getLatestTripPoint")
    }
    
    func getAllTripPoints(id: String, completion: @escaping (Result<[TripPoint], any Error>) -> Void) {
        fatalError()
        #warning("Implement getAllTripPoints")
    }
    
    
}
