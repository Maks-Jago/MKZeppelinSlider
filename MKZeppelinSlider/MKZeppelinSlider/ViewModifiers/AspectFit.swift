//
//  AspectFit.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

struct AspectFit: ViewModifier {

    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
    }
}

