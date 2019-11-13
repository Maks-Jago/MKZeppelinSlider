//
//  MKTitleView.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct MKTitleView: View {
    @State var showChoose: Bool = false

    let appearingDelay: Double

    private var transition: AnyTransition {
        AnyTransition
            .move(edge: .bottom)
            .combined(with: .opacity)
    }

    var body: some View {
        ZStack(alignment: .leading) {
            if showChoose {
                Text("Choose")
                    .accentColor(.black)
                    .font(Font.system(size: 40).weight(.semibold))
                    .transition(transition)
                    .offset(y: -40)
            }

            Color.zPink.frame(height: 50)

            Text("quantity.")
                .accentColor(.black)
                .font(Font.system(size: 80).weight(.medium))
                .transition(.move(edge: .top))
        }
        .clipped()
        .transition(.move(edge: .top))
        .onAppear {
            withAnimation(Animation.easeOut.delay(self.appearingDelay)) {
                self.showChoose.toggle()
            }
        }
    }
}

struct MKTitleView_Previews: PreviewProvider {

    static var previews: some View {
        MKTitleView(appearingDelay: 0.5)
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
