//
//  MKCloudView.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKCloudView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Image.cloud
                    .aspectFit()
                    .frame(height: 66)
                Image.cloud
                    .aspectFit()
                    .frame(height: 200)
            }

            Image.cloud
                .aspectFit()
                .frame(height: 100)
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
