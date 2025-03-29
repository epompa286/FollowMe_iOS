//
//  TripLeadViewModel.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import CoreLocation
import MapKit
import Combine
import SwiftUI

struct TripLeadState {
    var coordinates: [CLLocationCoordinate2D] = []
    var course: Double = 0.0
    var tripId: String? = nil
    var distance: Double = 0.0
    var elapsedTime: Int = 0
    var startTime: Date? = nil
    
    var isTripPaused: Bool = false
    var isTripStopped: Bool = false
    var isAutoCenterEnabled: Bool = true
    
    var zoomLevel: Double = 15
}

enum TripLeadAction {
    case ShareTrip
    case PauseTrip
    case StopTrip
    case AutoCenterToggle
    case ZoomLevelChanged(Double)
}


@Observable
class TripLeadViewModel: ObservableObject {
    var state: TripLeadState = .init()
    private let locationService: LocationService
    private var cancellable: AnyCancellable?

    init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    func send(_ action: TripLeadAction) {
        switch action {
        case .ShareTrip:
            #warning("Implement sharing trip functionality")
        case .PauseTrip:
            #warning("Implement pausing trip functionality")
        case .StopTrip:
            #warning("Implement stopping trip functionality")
        case .AutoCenterToggle:
            #warning("Implement auto center toggle functionality")
        case .ZoomLevelChanged(_):
            #warning("Implement zoom level change functionality")
        }
    }
    
    func observeLocationUpdates() {
        locationService.start()
        cancellable = locationService.$userLocation.sink { [weak self] location in
            if let location = location {
                self?.state.coordinates.append(location.coordinate)
                self?.state.course = location.course
//                self?.state.cameraPosition = self?.returnCamera(coordinate: location.coordinate) ?? self!.state.cameraPosition
            }
        }
    }
    
    func returnCamera(coordinate: CLLocationCoordinate2D) -> MapCameraPosition {
        return MapCameraPosition.region(.init(center: coordinate, span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    func getFormattedDistance() -> String {
        if state.distance < 1000 {
            return String(format: "%.1f m", state.distance)
        } else {
            return String(format: "%.1f km", state.distance / 1000)
        }
    }
    
    func getFormattedStartTime() -> String {
        guard let startTime = state.startTime else { return "N/A" }
        return DateFormatter.localizedString(from: startTime, dateStyle: .medium, timeStyle: .short)
    }
    
    func getFormattedElapsedTime() -> String {
        let totalSeconds = state.elapsedTime
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
