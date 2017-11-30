//
//  CardView.swift
//  A custom view to be applied to a UIView to create a customizable 'card' appearence
//
//  Created by Max McKinney on 11/23/17.
//  Copyright © 2017 Manifold Digital. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBInspectable var cornerRadius : CGFloat = 3.0
    
    // layoutSubviews is called when view is created
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        
        layer.masksToBounds = true // Set the false to see shadows. TODO: Figure out how to clip subviews and allow a shadow
        
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 9.0
        layer.shadowOpacity = 0.12
    }

}
