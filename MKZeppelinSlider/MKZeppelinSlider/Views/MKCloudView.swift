//
//  MKCloudView.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKCloudView: View {
    @State var hSpacing: CGFloat = 15
    @State var vSpacing: CGFloat = 10

    private let mainCloudHeight: CGFloat = 160

    var body: some View {
        VStack(spacing: vSpacing) {
            HStack(spacing: hSpacing) {
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight * 0.33)
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight)
            }

            Image.cloud
                .aspectFit()
                .frame(height: mainCloudHeight * 0.5)
        }
    }
}

struct MKCloudView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.zPink
            MKCloudView()
        }
        .previewLayout(.fixed(width: 800, height: 600))
    }
}
