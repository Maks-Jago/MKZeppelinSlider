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

    private var sliderBinding: Binding<Double> {
        .init(get: { () -> Double in
            self.animationValue
        }) { newValue in
            self.sliderTitle = "\(Int(newValue))"
            self.animationValue = newValue
        }
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                ZStack {
                    Image.airship
                        .aspectFit()
                        .frame(width: 150)

                    Text("\(self.sliderTitle)")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(Color.white)
                        .offset(x: -20, y: -5)
                }
                .offset(x: max(CGFloat(self.animationValue) * (proxy.size.width / 20.0) - 75, 0))

                Slider(value: self.sliderBinding, in: 0...20, step: 1)
                    .accentColor(.zSliderTrackColor)
                    .foregroundColor(.zSliderTrackColor)
            }
        }
    }
}

struct MKZeppelinSlider_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            MKZeppelinSliderView(animationValue: .constant(1))
            MKZeppelinSliderView(animationValue: .constant(2))
            MKZeppelinSliderView(animationValue: .constant(3))
            MKZeppelinSliderView(animationValue: .constant(4))
            MKZeppelinSliderView(animationValue: .constant(5))
            MKZeppelinSliderView(animationValue: .constant(6))
            MKZeppelinSliderView(animationValue: .constant(7))
            MKZeppelinSliderView(animationValue: .constant(8))
            MKZeppelinSliderView(animationValue: .constant(9))
        }
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
