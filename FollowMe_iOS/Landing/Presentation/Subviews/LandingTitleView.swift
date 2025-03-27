//
//  LandingTitleView.swift
//  FollowMe_iOS
//
//  Created by Edgar Pompa on 3/26/25.
//

import SwiftUI

struct LandingTitleView: View {
    var body: some View {
        VStack {
            VStack (spacing: 0) {
                HStack {
                    Text("Follow")
                        .font(.system(size: 80))
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("red_arrow")
                        .resizable()
                        .frame(maxWidth: 128, maxHeight: 72)
                    Spacer()
                    Spacer()
                    Text("Me")
                        .font(.system(size: 80))
                }
            }
            
            Spacer()
            
            Image("map_image")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 256)
            
            Spacer()
        }
    }
}

#Preview {
    LandingTitleView()
}
