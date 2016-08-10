//
//  FirstViewSecond.swift
//  WaterManagement
//
//  Created by IE3PMDP000046 on 28/06/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import MapKit

class FirstViewSecond: UIViewController,MKMapViewDelegate {

 
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let GLocation = Location.sharedInstance
        
       // mapView.delegate = self
       
        print ("I am in second")
        print( GLocation )
        
        
        let Hydet = MKCoordinateRegionMake(GLocation.Position,MKCoordinateSpanMake(0.02, 0.02))
        
        
        mapView.setRegion(Hydet , animated: true)
        
        mapView.delegate = self
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
