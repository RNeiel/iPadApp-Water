//
//  DateViewController.swift
//  Water
//
//  Created by Honeywell TS on 20/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit

class DateViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate  {

   
    @IBOutlet weak var fromYear: UIPickerView!
    @IBOutlet weak var toYear: UIPickerView!
    
    @IBOutlet weak var fromMonth: UIPickerView!
    @IBOutlet weak var toMonth: UIPickerView!
    
    
    @IBOutlet weak var fromDate: UIPickerView!
    @IBOutlet weak var toDate: UIPickerView!
    
    
    @IBAction func CompletedClick(sender: AnyObject){
//        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AnalysisPage") as! SecondViewController
//        self.presentViewController(vc, animated: true, completion: nil)
        
        let vc = SecondViewController() //change this to your class name
        self.presentViewController(vc, animated: true, completion: nil)
        
        }
    var years = ["2013","2014","2015","2016","2017","2018"]
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dates_31 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    let dates_30 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"]

    let dates_29 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"]
    
    
    var selectedFromYear: String = "2016"
    var selectedFromMonth: String = "Jul"
    var selectedFromDate: String = "Jul"

    
    var selectedToYear: String = "2016"
    var selectedToMonth: String = "Jul"
    var selectedToDate: String = "Jul"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fromYear.selectedRowInComponent(4)
        toYear.selectedRowInComponent(4)
        
        fromMonth.selectedRowInComponent(7)
        toMonth.selectedRowInComponent(7)
        
        fromDate.selectedRowInComponent(20)
        toDate.selectedRowInComponent(20)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == self.fromYear || pickerView == self.toYear)
        { return years.count}
        
        else if(pickerView == self.fromMonth || pickerView == self.toMonth)
        { return months.count}
        
        else
        {
            return 30
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == self.fromYear || pickerView == self.toYear)
        {
        return years[row]
        }
        else if(pickerView == self.fromMonth || pickerView == self.toMonth)
        {
            return months[row]
        }
        else{ return dates_30[row]}
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == self.fromYear)
        { selectedFromYear = years[row] }
        
        if(pickerView == self.toYear)
        { selectedToYear = years[row] }
        
        print(selectedFromYear)
        
        selectedFromMonth = months[row]
        
    }
    
    func getDays(month: String, year: String) -> [String]
    {
        var days = 0
        
        if (month == "4" || month == "6" || month == "9" || month == "11")
        {
            days = 30
        }
    
        else if (month == "2")
        {
            var leapyear:Bool = (Int(year)! % 4 == 0 && Int(year)! % 100 != 0) || (Int(year)! % 400 == 0)
    
            if (leapyear == false)
            {
				days = 28
            }
            else
            {
				days = 29
            }
        }
    
        else
        {
            days = 31
        }
        
       
    if(days == 30)
        { return dates_30}
    else if(days == 31)
        { return dates_31}
    else
        { return dates_29}
   
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
