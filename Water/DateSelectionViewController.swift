//
//  DateSelectionViewController.swift
//  Water
//
//  Created by Honeywell TS on 27/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit

class DateSelectionViewController: UIViewController {

    @IBOutlet weak var dateSelected: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var Done: UIButton!
    @IBOutlet weak var date2Selected: UILabel!
   
    @IBAction func onClick(sender: AnyObject) {
        if((self.presentingViewController) != nil){
            self.dismissViewControllerAnimated(false, completion: nil)
            print("done")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func datePickerAction(sender: AnyObject) {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        self.dateSelected.text = strDate
        
    }
   
    @IBOutlet weak var datePicker2Action: UIDatePicker!
    
    
    @IBAction func DatePicker2Action(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        self.date2Selected.text = strDate
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
