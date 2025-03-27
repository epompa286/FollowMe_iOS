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
        VStack {
            ZStack(alignment: .bottom) {
                ZStack (alignment: .top) {
                    Map {
                        MapPolyline(coordinates: walkingRoute)
                            .stroke(.red, lineWidth: 5)
                        Marker("Start", coordinate: walkingRoute.first!)
                            .tint(.green)
                        Marker("Start", coordinate: walkingRoute.last!)
                            .tint(.red)
<<<<<<< HEAD
                        
                    }
                    .mapControlVisibility(.hidden)
                    
=======
                    }
>>>>>>> main
                    
                    HStack{
                        Text("Trip Lead")
                            .font(.largeTitle)
                            .padding(.trailing)
                        
                        Button {
                            // TODO: Implement on click
                        } label: {
<<<<<<< HEAD
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
=======
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .padding(.bottom, 4)
                                .frame(maxWidth: 32, maxHeight: 32)
                        }
                        
                        Spacer()
                        Button {
                            // TODO: Implement on click
                        } label: {
                            Image(systemName: "wave.3.up")
                                .resizable()
                                .padding(.bottom, 4)
                                .frame(maxWidth: 32, maxHeight: 32)
                        }
>>>>>>> main
                    }
                    .padding([.horizontal, .bottom])
                    .background(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity)
                }
                
                HStack{
                    Button {
                        // TODO: Implement on click
                    } label: {
<<<<<<< HEAD
                        Image("pause")
                            .resizable()
                            .scaledToFit()
=======
                        Image(systemName: "pause.circle")
                            .resizable()
>>>>>>> main
                            .frame(maxWidth: 64, maxHeight: 64)
                    }
                    
                    Spacer()
                    Button {
                        // TODO: Implement on click
                    } label: {
<<<<<<< HEAD
                        Image("stop_sign")
                            .resizable()
                            .scaledToFit()
=======
                        Image(systemName: "stop.circle")
                            .resizable()
>>>>>>> main
                            .frame(maxWidth: 64, maxHeight: 64)
                    }
                }
                .padding(.bottom, 48)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
            }
            
<<<<<<< HEAD
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
=======
            Group{
                Spacer()
                Text("12:34")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
>>>>>>> main
            .background(.gray.opacity(0.4))
        }
    }
}

#Preview {
    TripLeadView()
}
