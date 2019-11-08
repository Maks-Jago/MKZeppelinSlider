//
//  Image.swift
//  MKZeppelinSlider
//
//  Created by Max Kuznetsov on 08.11.2019.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import SwiftUI

extension Image {
    static var cloud: Image { Image("cloud").resizable() }
}

//extension Image {
//    func aspectFit() -> Self {
//        let image = self.resizable()
//        image.aspectRatio(contentMode: .fit)
//        return image
//    }
//}
