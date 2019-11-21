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
    static var airship: Image { Image(uiImage: UIImage(named: "airship")!).resizable() }
}
