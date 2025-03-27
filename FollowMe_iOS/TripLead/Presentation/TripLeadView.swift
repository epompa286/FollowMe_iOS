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
        VStack (spacing: 0) {
            ZStack(alignment: .bottom) {
                ZStack (alignment: .top) {
                    Map {
                        MapPolyline(coordinates: walkingRoute)
                            .stroke(.red, lineWidth: 5)
                        Marker("Start", coordinate: walkingRoute.first!)
                            .tint(.green)
                        Marker("Start", coordinate: walkingRoute.last!)
                            .tint(.red)
                    }
                    .mapControlVisibility(.hidden)
                    
                    
                    HStack{
                        Text("Trip Lead")
                            .font(.largeTitle)
                            .padding(.trailing)
                        
                        Button {
                            // TODO: Implement on click
                        } label: {
                            Image("share_icon")
                                .resizable()
                                .scaledToFit()
                                .padding(.bottom, 4)
                                .frame(maxWidth: 32, maxHeight: 32)
                        }
                        Spacer()
                        Image("broadcast")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 4)
                            .frame(maxWidth: 32, maxHeight: 32)
                    }
                    .padding([.horizontal, .bottom])
                    .background(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity)
                }
                
                HStack{
                    Button {
                        // TODO: Implement on click
                    } label: {
                        Image("pause")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 64, maxHeight: 64)
                    }
                    
                    Spacer()
                    Button {
                        // TODO: Implement on click
                    } label: {
                        Image("stop_sign")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 64, maxHeight: 64)
                    }
                }
                .padding(.bottom, 48)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
            
            VStack {
                Text("Trip ID: 12345")
                    .padding(.top, 8)
                
                HStack {
                    Text("Distance:")
                    Spacer()
                    Text("Elapsed")
                }
                
                Text("Trip Start:")
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    TripLeadView()
}
