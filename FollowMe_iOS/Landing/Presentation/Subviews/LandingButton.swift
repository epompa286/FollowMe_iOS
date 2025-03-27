//
//  LandingButton.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import SwiftUI

struct LandingButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 64)
                    .fill(backgroundColor)
                    .frame(maxWidth: .infinity, maxHeight: 80)
                Text(title)
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .bold()
            }
        }
    }
}

#Preview {
    LandingButton(title: "Button", backgroundColor: .blue, action: { })
}
