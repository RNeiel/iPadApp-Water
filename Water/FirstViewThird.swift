//
//  FirstViewThird.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 28/06/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import MapKit
import Charts
import Alamofire
import Foundation

class FirstViewThird: UIViewController,ChartViewDelegate,MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var consumptionChart: BarChartView!
    @IBOutlet weak var flowChart: LineChartView!
    
    var consumption: [Double] = []
    var flow: [Int] = []
    let months = ["Dec", "Jan" , "Feb", "Mar", "Apr", "May", "June"]
    let time = ["12:00","12:15","12:30","12:45","01:00","01:15","01:30"]
   
    var timer: dispatch_source_t!
    
//    func startTimer() {
//        let queue = dispatch_queue_create("com.domain.app.timer", nil)
//        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
//        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 1 * NSEC_PER_SEC) // every 60 seconds, with leeway of 1 second
//        dispatch_source_set_event_handler(timer) {
//            // do whatever you want here
//            
//
//            
//            
//        }
//        dispatch_resume(timer)
//    }
//    
//    func stopTimer() {
//        dispatch_source_cancel(timer)
//        timer = nil
//    }

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let GLocation = Location.sharedInstance
        
         mapView.delegate = self
        
        print ("I am in second")
        print( GLocation )
        
        
        let Hydet = MKCoordinateRegionMake(GLocation.Position,MKCoordinateSpanMake(0.02, 0.02))
        
        mapView.setRegion(Hydet , animated: true)
        
        readConsumption()
        readFlow()
        
        addRoute()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRoute() {
        let thePath = NSBundle.mainBundle().pathForResource("EntranceToGoliathRoute", ofType: "plist")
        let pointsArray = NSArray(contentsOfFile: thePath!)
        
        let pointsCount = pointsArray!.count
        
        var pointsToUse: [CLLocationCoordinate2D] = []
        
        for i in 0...pointsCount-1 {
            let p = CGPointFromString(pointsArray![i] as! String)
            pointsToUse += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }
        
        let myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsCount)
        
        
        mapView.addOverlay(myPolyline)
    }
    
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = UIColor.redColor()
            
            return lineView
        }
        
        return nil
    }
    
    func readConsumption()
    {
        
        
        Alamofire.request(.GET, "https://hydsmartcity.azurewebsites.net/api/Consumption", parameters: ["foo" : "bar"]) .responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                
                print("Details:\(JSON[0]["ConsumptioninLitres"])")
                print("Details:\(JSON[1]["ConsumptioninLitres"])")
                print("Details:\(JSON[2]["ConsumptioninLitres"])")
        

                for index in JSON as! [AnyObject]{
                    
                   guard let id = index["ConsumptioninLitres"] as? Double
                    else
                    {
                        return
                    }
                    
                    
                    print(id)

                    self.consumption.append(id)
                    
                }
            }
            self.setConsumptionChartData(self.months, values: self.consumption)
            
        }
        

    }
    
    func readFlow()
    {
        
        
        Alamofire.request(.GET, "https://hydsmartcity.azurewebsites.net/api/Flow", parameters: ["foo" : "bar"]) .responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                for index2 in JSON as! [AnyObject]{

                    
                    guard let id2 = index2["FlowActual"] as? Int
                        else
                    {
                        return
                    }
                    
                    
                    print(id2)
                    
                    self.flow.append(id2)
                    
                }
            }
         
         self.setFlowChartData(self.time, values: self.flow)
        }
        
        
    }
    
    
    func setConsumptionChartData(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        if(values.count == 0){return}
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: (values[i]), xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Consumption in gallons")
        
        chartDataSet.colors = [UIColor.orangeColor()]
        
        let dataSets: [BarChartDataSet] = [chartDataSet]
        
        let chartData = BarChartData(xVals: months, dataSets: dataSets)
        consumptionChart.data = chartData
        consumptionChart.leftAxis.drawGridLinesEnabled = false
        consumptionChart.rightAxis.drawGridLinesEnabled = false
        consumptionChart.xAxis.drawGridLinesEnabled = false
        consumptionChart.drawGridBackgroundEnabled = false
        consumptionChart.descriptionText = ""
        consumptionChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        
    }
    
    
    func setFlowChartData(time : [String], values: [Int]) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        
        
        if(values.count == 0)
        {
            return
        }
        for i in 0 ..< time.count {
            yVals1.append(ChartDataEntry(value: Double(values[i]), xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "Flow Rate")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        //set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        //set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.blueColor()
        set1.highlightColor = UIColor.whiteColor()
        //set1.drawCircleHoleEnabled = true
        set1.drawCubicEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: time, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        flowChart.descriptionText = "in kiloLitres"
        flowChart.leftAxis.drawGridLinesEnabled = false
        flowChart.rightAxis.drawGridLinesEnabled = false
        flowChart.xAxis.drawGridLinesEnabled = false
        flowChart.drawGridBackgroundEnabled = false
        
        //5 - finally set our data
        self.flowChart.data = data
        
       
    }
    
   
    

}
