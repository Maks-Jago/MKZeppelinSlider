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
    @State private var showAirship: Bool = false

    var airshipAppearingDelay: Double = 0

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
                        Spacer().aspectFit().frame(height: 89)
                        if self.showAirship {
                            ZStack {
                                Image.airship
                                    .aspectFit()
                                    .frame(width: 150)
                                    .layoutPriority(1)

                                Text("\(self.sliderTitle)")
                                    .font(Font.largeTitle.bold())
                                    .foregroundColor(Color.white)
                                    .offset(x: -20, y: -5)
                            }.transition(AnyTransition.scale.combined(with: .move(edge: .bottom)))
                        }
                    }
                    .padding(.bottom, 20)
                    .offset(x: CGFloat(self.animationValue) * (proxy.size.width / 20.0) - 55)

                Slider(value: self.sliderBinding, in: 0...20, step: 1)
                    .accentColor(.zSliderTrackColor)
                    .foregroundColor(.zSliderTrackColor)
            }
        }
        .onAppear {
            withAnimation(Animation.easeOut.delay(self.airshipAppearingDelay)) {
                self.showAirship.toggle()
            }
        }
    }
}

struct MKZeppelinSlider_Previews: PreviewProvider {

    static var values: [Int] = Array(0...10)

    static var previews: some View {
        Group {
            ForEach(values, id: \.self) { value in
                MKZeppelinSliderView(animationValue: .constant(Double(value * 2)))
            }
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
