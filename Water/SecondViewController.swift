//
//  SecondViewController.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 27/06/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import DropDown


class SecondViewController: UIViewController{
    
    @IBOutlet weak var LocationDrop: NiceButton!
    
    let LocationDropBtn = DropDown()
    
    lazy var dropDowns: [DropDown] = {return [self.LocationDropBtn]}()
    
    //MARK: - Actions
    
    @IBAction func LocnDropFn(sender: AnyObject) {
        LocationDropBtn.show()
    }
   
       
    @IBAction func showKeyboard(sender: AnyObject) {
 //       textField.becomeFirstResponder()
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        view.endEditing(false)
    }
    
    
    func customizeDropDown(sender: AnyObject) {
        let appearance = DropDown.appearance()
        
        appearance.cellHeight = 60
        appearance.backgroundColor = UIColor(white: 1, alpha: 1)
        appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
        //		appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
        appearance.cornerRadius = 10
        appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
        appearance.shadowOpacity = 0.9
        appearance.shadowRadius = 25
        appearance.animationduration = 0.25
        appearance.textColor = .darkGrayColor()
        //		appearance.textFont = UIFont(name: "Georgia", size: 14)
    }

    
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationDropDown()
        dropDowns.forEach { $0.dismissMode = .OnTap }
        dropDowns.forEach { $0.direction = .Any }
        
        var Locations = ["Gachibowli",
                         "Nankram Guda",
                         "Golconda fort",
                         "Ghansi Bazaar",
                         "Mehdipatnam",
                         "kachiguda",
                         "Medowli",
                         "Miyapur",
                         "Nizampet",
                         "Manikonda",
                         "Madhapur",
                         "HMT Colony",
                         "Secunderabad",
                         "Kothapet Village",
                         "Nadergul",
                         "ECIL",
                         "Shamshabad",
                         "Saidabad",
                         "Jubilee hills",
                         "Gandhi nagar"]
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupLocationDropDown() {
        LocationDropBtn.anchorView = LocationDrop
        
        // Will set a custom with instead of anchor view width
        //		dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        LocationDropBtn.bottomOffset = CGPoint(x: 0, y: LocationDrop.bounds.height)
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        LocationDropBtn.dataSource = ["Gachibowli",
                                      "Nankram Guda",
                                      "Golconda fort",
                                      "Ghansi Bazaar",
                                      "Mehdipatnam",
                                      "kachiguda",
                                      "Medowli",
                                      "Miyapur",
                                      "Nizampet",
                                      "Manikonda",
                                      "Madhapur",
                                      "HMT Colony",
                                      "Secunderabad",
                                      "Kothapet Village",
                                      "Nadergul",
                                      "ECIL",
                                      "Shamshabad",
                                      "Saidabad",
                                      "Jubilee hills",
                                      "Gandhi nagar"]
        
        // Action triggered on selection
        LocationDropBtn.selectionAction = { [unowned self] (index, item) in
            self.LocationDrop.setTitle(item, forState: .Normal)
        }
        
        // Action triggered on dropdown cancelation (hide)
        //		dropDown.cancelAction = { [unowned self] in
        //			// You could for example deselect the selected item
        //			self.dropDown.deselectRowAtIndexPath(self.dropDown.indexForSelectedRow)
        //			self.actionButton.setTitle("Canceled", forState: .Normal)
        //		}
        
        // You can manually select a row if needed
        //		dropDown.selectRowAtIndex(3)
    }
   

}

