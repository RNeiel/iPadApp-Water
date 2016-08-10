//
//  QualityChartViewController.swift
//  Water
//
//  Created by IE3PMDP000046 on 04/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Charts

class QualityChartViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var qualityChart: LineChartView!
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dollars1 = [20,22,24,21,24,26,20,23,22,24,23,25]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setChartData(months)
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
    
    func setChartData(months : [String]) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< months.count {
            yVals1.append(ChartDataEntry(value: Double(dollars1[i]), xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.greenColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.greenColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.greenColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = false
        set1.drawCubicEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        
        qualityChart.leftAxis.drawGridLinesEnabled = false
        qualityChart.rightAxis.drawGridLinesEnabled = false
        qualityChart.xAxis.drawGridLinesEnabled = false
        qualityChart.drawGridBackgroundEnabled = false
        
        //5 - finally set our data
        self.qualityChart.data = data
    }
    


}
