//
//  MKZeppelinSlider.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKZeppelinSliderView: View {
    @Binding var value: Double

    var body: some View {
        VStack {
            Text("\(value)")
            Slider(value: $value, in: 0...20, step: 1)
                .accentColor(.zSliderTrackColor)
                .foregroundColor(.zSliderTrackColor)
        }
    }
}

struct MKZeppelinSlider_Previews: PreviewProvider {
    @State static var sliderValue: Double = 5

    static var previews: some View {
        MKZeppelinSliderView(value: $sliderValue)
    }
}
