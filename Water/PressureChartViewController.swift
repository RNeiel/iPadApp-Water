//
//  PressureChartViewController.swift
//  Water
//
//  Created by IE3PMDP000046 on 04/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Charts

class PressureChartViewController: UIViewController,ChartViewDelegate {

    @IBOutlet var pressureChart: BarChartView!
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    
    let dollars1 = [67,67.5,68,67,67,66.8,68,67,65,66,67,68]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConsumptionChartData(months, values: dollars1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setConsumptionChartData(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Consumption in gallons")
        
        chartDataSet.colors = [UIColor(red: 151/255, green: 128/255, blue: 163/255, alpha: 1.0)]
        
        let dataSets: [BarChartDataSet] = [chartDataSet]
        
        let chartData = BarChartData(xVals: months, dataSets: dataSets)
        pressureChart.data = chartData
        pressureChart.leftAxis.drawGridLinesEnabled = false
        pressureChart.rightAxis.drawGridLinesEnabled = false
        pressureChart.xAxis.drawGridLinesEnabled = false
        pressureChart.drawGridBackgroundEnabled = false
        pressureChart.descriptionText = ""
        pressureChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        pressureChart.rightAxis.enabled = false
        pressureChart.drawValueAboveBarEnabled = false
        
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
