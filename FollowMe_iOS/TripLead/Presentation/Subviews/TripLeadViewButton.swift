//
//  TripLeadViewButton.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/27/25.
//

import SwiftUI

struct TripLeadViewButton: View {
    var source: String = "map"
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Image(source)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 64, maxHeight: 64)
        }
    }
}

#Preview {
    TripLeadViewButton()
}
