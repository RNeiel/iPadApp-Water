//
//  SystemHealthViewController.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 01/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Alamofire

class SystemHealthViewController: UIViewController {

    @IBOutlet weak var healthPercent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://honwaterserviceapi.azurewebsites.net/api/OverallHealth", parameters: ["foo" : "bar"]) .responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                self.healthPercent.text = String(JSON)+"%"
            }
            
        }
        
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
