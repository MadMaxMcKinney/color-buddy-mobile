//
//  DetailPaletteViewController.swift
//  Color Buddy
//
//  Created by Max McKinney on 11/27/17.
//  Copyright © 2017 Manifold Digital. All rights reserved.
//

import UIKit

class DetailPaletteViewController: UIViewController {
    
    var colorPalette : ColorPalette!
    @IBOutlet weak var colorStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For each color view in the current color palette, add it to the stack view for it to manage each color view equally
        if let colors = colorPalette.colors {
            for colorView in colors {
                colorStackView.addArrangedSubview(colorView)
            }
        }
        
        setupNavBar()
        
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
