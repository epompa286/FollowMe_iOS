//
//  TripLeadStatsBarView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import SwiftUI

struct TripLeadStatsBarView: View {
    @EnvironmentObject var viewModel: TripLeadViewModel
    
    var body: some View {
        VStack {
            Text("Trip ID: \(viewModel.state.tripId ?? "N/A")")
                .padding(.top, 8)
            
            HStack {
                Text("Distance: \(viewModel.getFormattedDistance())")
                Spacer()
                Text("Elapsed: \(viewModel.getFormattedElapsedTime())")
            }
            
            Text("Trip Start: \(viewModel.getFormattedStartTime())")
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .background(.ultraThickMaterial)
    }
}

#Preview {
    TripLeadStatsBarView()
        .environmentObject(TripLeadViewModel(locationService: .init()))
}
