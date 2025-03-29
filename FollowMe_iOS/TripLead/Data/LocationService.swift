//
//  LocationService.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var userLocation: CLLocation?
    var locationManager: CLLocationManager?
    var isAuthorized = false
    
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.activityType = .automotiveNavigation
    }
    
    func start() {
        if let locationManager = locationManager, isAuthorized {
            print("Starting location updates...")
            locationManager.startUpdatingLocation()
        } else if let locationManager = locationManager {
            print("Requesting location authorization...")
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Location service: \(userLocation?.coordinate)")
            self.userLocation = location
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocationAuthorization()
    }
    
    private func requestLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("Location restricted")
        case .denied:
            print("Location denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("is authorized")
            isAuthorized = true
        @unknown default:
            break
        }
    }
}
