//
//  ColorView.swift
//  Color Buddy
//
//  Created by Max McKinney on 11/23/17.
//  Copyright © 2017 Manifold Digital. All rights reserved.
//

import UIKit

class ColorView: UIView {
    
    var color : UIColor
    
    init(color clr : UIColor, frame: CGRect) {
        self.color = clr
        // Call the init of UIView with frame. We have to call all the intializers of the UIView class
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        // Set this view's background color to the one defined as an instance var
        layer.backgroundColor = self.color.cgColor
    }

}
