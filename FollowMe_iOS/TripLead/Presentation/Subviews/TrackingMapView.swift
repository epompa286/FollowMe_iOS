//
//  TrackingMapView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/29/25.
//

import SwiftUI
import MapKit

struct TrackingMapView: View {
    @State private var cameraPosition: MapCameraPosition = .userLocation(
            fallback: MapCameraPosition.region(.init(
                center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
            ))
        )
    var coordinates: [CLLocationCoordinate2D] = []
    var course: Double = 0.0
    var body: some View {
        Map(position: $cameraPosition) {
            UserAnnotation {
                Image("car")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 48, maxHeight: 48)
                    .rotationEffect(Angle(degrees: course))
            }
            
            if let firstPoint = coordinates.first {
                Marker("Start", coordinate: firstPoint)
                    .tint(.green)
            }
            
            MapPolyline(coordinates: coordinates)
                .stroke(.blue, lineWidth: 5)
        }
        .mapControls {
            MapUserLocationButton()
        }
        
    }
}

#Preview {
    TrackingMapView()
}
