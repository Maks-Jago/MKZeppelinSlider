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

    private var transition: AnyTransition {
        AnyTransition
            .move(edge: .top)
//            .combined(with: .opacity)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: -30) {
            if showChoose {
                Text("Choose")
                    .accentColor(.black)
                    .font(Font.system(size: 40).weight(.semibold))
                    .transition(.opacity)
            }

            Text("quantity.")
                .accentColor(.black)
                .font(Font.system(size: 80).weight(.medium))
//                .transition(transition)
        }
        .onAppear {
            withAnimation(Animation.linear.delay(1.5)) {
                self.showChoose.toggle()
            }
        }
    }
}

struct MKTitleView_Previews: PreviewProvider {

    static var previews: some View {
        MKTitleView()
            .previewLayout(.fixed(width: 500, height: 500))
    }
}
