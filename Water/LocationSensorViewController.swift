//
//  LocationSensorViewController.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 01/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit

class LocationSensorViewController: UIViewController {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var totalSensorCount: UILabel!
    @IBOutlet weak var faultySensorCount: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var faultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let GLocation = Location.sharedInstance
        
        locationName.text = GLocation.name
        totalSensorCount.text = "20"
        
        faultySensorCount.hidden = true
        totalSensorCount.hidden = true
        totalLabel.hidden = true
        faultLabel.hidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
