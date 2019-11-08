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
//    @State var showChooseTitle: Bool = false

//    var transition: AnyTransition {
//        AnyTransition
//            .opacity
//            .combined(with: .move(edge: .top))
//            .move(edge: .top)
//            .combined(with: .opacity)
//    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.zPink
                    VStack(spacing: 0) {
                        if self.showItems {
                            HStack(spacing: 0) {
                                MKTitleView()
                                Spacer()
                                MKCloudView()
                            }//.transition(AnyTransition.move(edge: .top))
                        }

                        MKZeppelinSliderView(value: self.$sliderValue)
                    }
                    .padding(EdgeInsets(top: self.showItems ?  proxy.size.height * 0.2 : 0,
                                        leading: proxy.size.width * 0.15,
                                        bottom: proxy.size.height * 0.3,
                                        trailing: 0))

            }
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear() {
            withAnimation {
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
