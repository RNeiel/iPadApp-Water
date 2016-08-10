//
//  AgentStatusViewController.swift
//  Water
//
//  Created by Honeywell TS on 19/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class AgentStatusViewController: UIViewController {
    
    
    var ticket = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var AssignStatus: UIButton!
    
    
    
    
    @IBAction func onClickAssign(sender: AnyObject) {
        
        let comments: [String:AnyObject] = [
            "LocId": 1,
            "Status": "Open",
            "AssignedTo": "Natarajan",
            "Reason": "abc",
            "SensorId": 21
        ]
        
        
        var ticketId = 1
        
        //Alamofire.request(.POST,"https://honwaterserviceapi.azurewebsites.net/api/Ticket", parameters: comments)
        
        Alamofire.request(.POST,"https://honwaterserviceapi.azurewebsites.net/api/Ticket", parameters: comments,encoding:.JSON).responseJSON
            { response in
                
                if response.result.value != nil {
                    print(response.result.value)
                    
                    //ticketId = Int(response.result.value)
                    guard let id2 = response.result.value as? Int
                        else
                    {
                        return
                    }
                    
                    ticketId = id2
                }
                
                self.showMessage(ticketId)
                
        }
       
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMessage(ticketId: Int)
    {
        
        let alertView = UIAlertController(title: "STATUS", message: "Task has been assigned to Nataraj at 09:30 am. Ticket ID: \(ticketId)", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    
    }
    
    func saveName(name: String) {
        //1
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Ticket",
                                                        inManagedObjectContext:managedContext)
        
        let ticketStuff = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        
        //3
        ticketStuff.setValue(name, forKey: "ticketid")
        
        //4
        do {
            try managedContext.save()
            //5
            ticket.append(ticketStuff)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func sendData(Val : String)
    {
        Alamofire.request(.POST, "http://mywebsite.com/post-request", parameters: [:], encoding: .Custom({
            (convertible, params) in
            var mutableRequest = convertible.URLRequest.copy() as! NSMutableURLRequest
            mutableRequest.HTTPBody = Val.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
            return (mutableRequest, nil)
        }))
    }


}
