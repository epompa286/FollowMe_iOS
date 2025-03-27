//
//  TripLeaderView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import SwiftUI
import MapKit

struct TripLeadView: View {
    let walkingRoute: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 40.836456,longitude: 14.307014),
        CLLocationCoordinate2D(latitude: 40.835654,longitude: 14.304346),
        CLLocationCoordinate2D(latitude: 40.836478,longitude: 14.302593),
        CLLocationCoordinate2D(latitude: 40.836936,longitude: 14.302464)
    ]
    
    var body: some View {
        Map {
            MapPolyline(coordinates: walkingRoute)
                .stroke(.red, lineWidth: 5)
            Marker("Start", coordinate: walkingRoute.first!)
                .tint(.green)
            Marker("Start", coordinate: walkingRoute.last!)
                .tint(.blue)
        }
        
    }
}

#Preview {
    TripLeadView()
}
