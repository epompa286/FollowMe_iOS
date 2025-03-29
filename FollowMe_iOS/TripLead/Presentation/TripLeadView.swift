//
//  TripLeaderView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import SwiftUI
import MapKit

struct TripLeadView: View {
    @EnvironmentObject var viewModel: TripLeadViewModel
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack(alignment: .bottom) {
                ZStack (alignment: .top) {
                    TrackingMapView(coordinates: viewModel.state.coordinates,
                                    course: viewModel.state.course)
                    .onAppear {
                        viewModel.observeLocationUpdates()
                    }
                    
                    TripLeadTopBarView()
                }
                
                HStack{
                    TripLeadViewButton(source: "pause") {
                        viewModel.send(.PauseTrip)
                    }
                    
                    Spacer()
                    TripLeadViewButton(source: "stop_sign") {
                        viewModel.send(.StopTrip)
                    }
                }
                .padding([.bottom, .horizontal])
            }
            TripLeadStatsBarView()
        }
    }
}

#Preview {
    let router = Router(dependencies: AppDependencies())
    router.makeTripLeadView()
}
