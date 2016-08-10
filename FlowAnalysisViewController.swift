//
//  FlowAnalysisViewController.swift
//  Water
//
//  Created by Richard Neiel on 03/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Charts

class FlowAnalysisViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var flowChart: LineChartView!
    
    @IBOutlet weak var Dismiss: UIButton!
    
    
    @IBAction func DismissFn(sender: AnyObject) {
        if((self.presentingViewController) != nil){
            self.dismissViewControllerAnimated(false, completion: nil)
            print("done")
        }
    }
    
    let months = ["00:00" , "04:00", "08:00", "12:00", "16:00", "20:00", "00:00", "04:00", "08:00", "12:00", "16:00", "20:00"]
    
    let dollars1 = [5.8,6,5.2,5.4,5.8,5.3,5.7,5.3,5.4,5.4,5.3,5.4]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.flowChart.delegate = self
        // 2
        self.flowChart.descriptionText = "Tap node for details"
        // 3
        self.flowChart.descriptionTextColor = UIColor.whiteColor()
        self.flowChart.gridBackgroundColor = UIColor.darkGrayColor()
        // 4
        self.flowChart.noDataText = "No data provided"
        // 5
        setChartData(months)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChartData(months : [String]) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(value: dollars1[i], xIndex: i))
        }
        
        // 2 - create a data set with our array
        let color: UIColor =  UIColor(red: 123/255, green: 220/255, blue: 242/255, alpha: 1.0) /* #7bdcf2 */

        
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "Flow Rate")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(color) // our line's opacity is 50%
       // set1.setCircleColor(UIColor.blueColor()) // our circle will be dark red
        set1.lineWidth = 4.0
        set1.circleRadius = 0.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.whiteColor()
        set1.highlightColor = UIColor.blueColor()
        set1.drawCircleHoleEnabled = false
        set1.drawCubicEnabled = true
        
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        //data.setValueTextColor(UIColor.whiteColor())
        data.setDrawValues(false)
        
        
        flowChart.leftAxis.drawGridLinesEnabled = false
        flowChart.rightAxis.drawGridLinesEnabled = false
        flowChart.xAxis.drawGridLinesEnabled = false
        flowChart.drawGridBackgroundEnabled = false
        flowChart.rightAxis.enabled = false
        
        
        //5 - finally set our data
        self.flowChart.data = data
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
