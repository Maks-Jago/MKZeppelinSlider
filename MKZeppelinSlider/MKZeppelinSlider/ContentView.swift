//
//  ContentView.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 5
    @State var showItems: Bool = false

    let showItemsDuration: Double = 1.5

    var transition: AnyTransition {
        AnyTransition
            .move(edge: .top)
            .combined(with: .opacity)
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.zPink
                Group {
                    if self.showItems {
                        HStack(spacing: 0) {
                            MKTitleView(appearingDelay: self.showItemsDuration * 0.9)
                            Spacer()
                            MKCloudView()
                        }
                        .transition(self.transition)
                        .offset(y: -50)
                    }

                    MKZeppelinSliderView(value: self.$sliderValue)
                        .offset(y: self.showItems ? 200 : 0)
                }
                .padding(EdgeInsets(top: self.showItems ?  proxy.size.height * 0.2 : 0,
                                    leading: proxy.size.width * 0.15,
                                    bottom: proxy.size.height * 0.3,
                                    trailing: 20))

            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear() {
            withAnimation(.linear(duration: self.showItemsDuration)) {
                self.showItems.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
