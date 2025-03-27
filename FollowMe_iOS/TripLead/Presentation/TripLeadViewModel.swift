//
//  TripLeadViewModel.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import Foundation

struct TripLeadState {
    let tripPoints: [TripPoint] = []
    var TripId: String? = nil
    var distance: Double = 0
    var elapsedTime: Double = 0
    var TripStartTime: Date? = nil
    
    var isTripPaused: Bool = false
    var isTripStopped: Bool = false
    var isAutoCenterEnabled: Bool = true
    
    var ZoomLevel: Double = 15
}

enum TripLeadAction {
    case ShareTrip
    case PauseTrip
    case StopTrip
    case AutoCenterToggle
    case ZoomLevelChanged(Double)
}


@Observable
class TripLeadViewModel {
    var state: TripLeadState = .init()
    
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
}
