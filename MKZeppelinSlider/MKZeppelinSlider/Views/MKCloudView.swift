//
//  MKCloudView.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKCloudView: View {
    private let mainCloudHeight: CGFloat = 140

    @Binding var sliderValue: Double
    let sliderMaxValue: Double

    private var paddingPercent: CGFloat {
        CGFloat(sliderValue / sliderMaxValue)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight * 0.33)
                    .padding(.leading, 140 * paddingPercent)
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight)
                    .padding(.leading, 30 + 60 * paddingPercent)
            }

            Image.cloud
                .aspectFit()
                .frame(height: mainCloudHeight * 0.5)
                .padding(.leading, 80 + 90 * paddingPercent)
        }
    }
}

struct MKCloudView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0), sliderMaxValue: 20.0)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0.2), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0.4), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0.6), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0.8), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(1.0), sliderMaxValue: 20)
            }
        }
        .previewLayout(.fixed(width: 800, height: 600))
    }
}
