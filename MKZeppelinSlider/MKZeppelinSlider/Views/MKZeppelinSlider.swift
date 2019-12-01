//
//  MKZeppelinSlider.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI
import Combine

struct MKZeppelinSliderView: View {
    @Binding var animationValue: Double
    var airshipAppearingDelay: Double = 0

    @State private var sliderTitle: String = "5"
    @State private var showAirship: Bool = false
    @State private var inclineDirection: InclineDirection = .none

    @State var previousAnimationValue: Double = 10

    private let resetInclineSubject: PassthroughSubject<Void, Never> = .init()
    private var resetInclinePublisher: AnyPublisher<InclineDirection, Never> {
        resetInclineSubject
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .map { InclineDirection.none }
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    private var sliderBinding: Binding<Double> {
        .init(get: { () -> Double in
            self.animationValue
        }) { newValue in
            self.sliderTitle = "\(Int(newValue))"
            let newInclineDirection: InclineDirection = newValue > self.previousAnimationValue ? .leading : .trailing

            withAnimation {
                self.inclineDirection = newInclineDirection
            }

            self.animationValue = newValue
            self.resetInclineSubject.send()
        }
    }

//    private var offset: CGSize {
//        let items = Array(-10...10)
//        let x = items.randomElement() ?? 0
//        let y = items.randomElement() ?? 0
//        return CGSize(width: CGFloat(x), height: CGFloat(y))
//    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                    ZStack {
                        Spacer().frame(height: 89)
                        if self.showAirship {
                            ZStack {
                                Image.airship
                                    .aspectFit()
                                    .frame(width: 150)
                                    .layoutPriority(1)
                                    .rotationEffect(.degrees(self.inclineDirection.rawValue))

                                Text("\(self.sliderTitle)")
                                    .font(Font.largeTitle.bold())
                                    .foregroundColor(Color.white)
                                    .offset(x: -20, y: -5)
                                    .rotationEffect(.degrees(self.inclineDirection.rawValue))
                            }
                            .transition(AnyTransition.scale.combined(with: .move(edge: .bottom)))
                        }
                    }
                    .addGravityMoving()
                    .padding(.bottom, 30)
                    .offset(x: CGFloat(self.animationValue) * (proxy.size.width / 20.0) - 55)

                Slider(value: self.sliderBinding, in: 0...20, step: 1) {
                    if !$0 {
                        withAnimation {
                            self.inclineDirection = .none
                        }
                    }
                }
                .onReceive(self.resetInclinePublisher) { incline in
                    withAnimation {
                        self.inclineDirection = incline
                    }
                }
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
//        Group {
//            ForEach(values, id: \.self) { value in
//                MKZeppelinSliderView(animationValue: .constant(Double(value * 2)))
//            }
//        }
        MKZeppelinSliderView(animationValue: .constant(10))
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
