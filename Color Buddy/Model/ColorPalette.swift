//
//  ColorPalette.swift
//  Color Buddy
//
//  Created by Max McKinney on 11/24/17.
//  Copyright © 2017 Manifold Digital. All rights reserved.
//
// This class is to hold several ColorViews to be displayed as one color palette

import UIKit

class ColorPalette: NSObject {
    
    // List of color views
    var colors : [ColorView]?
    
    // When creating a palette init all the colors to be used
    init(colorsInPalette colors: [ColorView]) {
        self.colors = colors
    }

}
