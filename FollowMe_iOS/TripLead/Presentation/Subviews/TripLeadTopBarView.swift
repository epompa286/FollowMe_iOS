//
//  TripLeadTopBarView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import SwiftUI

struct TripLeadTopBarView: View {
    @ObservedObject var viewModel: TripLeadViewModel = .init()
    
    var body: some View {
        HStack{
            Text("Trip Lead")
                .font(.largeTitle)
                .padding(.trailing)
            
            Button {
                viewModel.send(.ShareTrip)
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
}

#Preview {
    TripLeadTopBarView()
}
