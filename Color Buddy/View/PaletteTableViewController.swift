//
//  ViewController.swift
//  Color Buddy
//
//  Created by Max McKinney on 9/23/17.
//  Copyright © 2017 Manifold Digital. All rights reserved.
//

import UIKit

class PaletteTableViewController: UITableViewController {
    
    // This has to be a lazy var since you can't reference self (or other properties) during initialization
    var colorPalettes : [ColorPalette]?

    override func viewDidLoad() {
        super.viewDidLoad()

        getColorPalettes()
        print("View Did Load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavBar()
        setupTabBar()
        
        //getColorPalettes()
        print("View Did Appear")
    }
    
    func setupNavBar() {
        // Set the nav bar to have large titles. This is on a per instance basis
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupTabBar() {
        tabBarController?.tabBar.barTintColor = UIColor.white
    }
    
    func getColorPalettes() {
        let cp1 = ColorPalette(colorsInPalette: [ColorView(color: UIColor.red, frame: CGRect.zero),
                                                 ColorView(color: UIColor.purple, frame: CGRect.zero),
                                                 ColorView(color: UIColor.gray, frame: CGRect.zero),
                                                 ColorView(color: UIColor.green, frame: CGRect.zero)])
        
        let cp2 = ColorPalette(colorsInPalette: [ColorView(color: UIColor.black, frame: CGRect.zero),
                                                 ColorView(color: UIColor.blue, frame: CGRect.zero),
                                                 ColorView(color: UIColor.brown, frame: CGRect.zero),
                                                 ColorView(color: UIColor.red, frame: CGRect.zero),
                                                 ColorView(color: UIColor.yellow, frame: CGRect.zero)])
        
        colorPalettes = [cp1, cp2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = colorPalettes?.count ?? 0
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "paletteCell", for: indexPath) as! PaletteTableViewCell
        
        print("table view cell for row at")
        
        // Get the current color palette
        let currentPalete = colorPalettes?[indexPath.row]
        
        // From the current palette loop through all the color views and add them to the cell's color stack view
        if let colors = currentPalete?.colors {
            for colorView in colors {
                cell.colorStackView.addArrangedSubview(colorView)
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the detailviewcontroller from this current storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailPaletteViewController") as? DetailPaletteViewController {
            // Get the currently selected color palette and set that as the main color palette for the detail view
            detailViewController.colorPalette = colorPalettes?[indexPath.row]
            
            // Push the detail view controller onto the nav bar view stack
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

class PaletteTableViewCell: UITableViewCell {
    @IBOutlet weak var colorStackView: UIStackView!
}
