//
//  MKZeppelinSlider.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKZeppelinSliderView: View {
    @Binding var animationValue: Double
    @State private var sliderTitle: String = "5"

    var body: some View {
        VStack {
            ZStack {
                Image.airship
                    .aspectFit()
                    .frame(width: 150)

                Text("\(self.sliderTitle)")
                    .font(Font.largeTitle.bold())
                    .foregroundColor(Color.white)
                    .offset(x: -20, y: -5)
            }

            Slider(value: Binding<Double>(get: { () -> Double in
                self.animationValue
            }, set: { newValue in
                self.sliderTitle = "\(Int(newValue))"
                self.animationValue = newValue
            }), in: 0...20, step: 1)
                .accentColor(.zSliderTrackColor)
                .foregroundColor(.zSliderTrackColor)
        }
    }
}

struct MKZeppelinSlider_Previews: PreviewProvider {

    static var previews: some View {
        MKZeppelinSliderView(animationValue: .constant(5))
            .previewLayout(.fixed(width: 500, height: 500))
    }
}

/*
 Button(action: {
 self.rotatingAngle += 90
 }) {
 Rectangle()
 .fill(Color.red)
 .frame(width: 200, height: 200)
 .rotationEffect(.degrees(rotatingAngle))
 .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 1))
 }
 */
