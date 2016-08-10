//
//  AgentTableViewController.swift
//  Water
//
//  Created by Honeywell TS on 18/07/16.
//  Copyright © 2016 Honeywell. All rights reserved.
//

import UIKit

class AgentTableViewController: UITableViewController {
    
    
    var agentNames:[String] = ["NATARAJ", "KUMAR", "JONES", "NAGESH", "AMIR"]
    var distance:[Double] = [ 0.2,0.7,1.3,1.7,2.9 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "AgentDetails")
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //let cell = tableView.dequeueReusableCellWithIdentifier("AgentDetails", forIndexPath: indexPath)
            
            let reuseIdentifier = "AgentDetails"
            
            var cell:UITableViewCell? =
            (tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? UITableViewCell?)!
            if (cell != nil)
            {
                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                                       reuseIdentifier: reuseIdentifier)
            }
            
//            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as UITableViewCell?
//            if (cell == nil) {
//                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
//            }
            
            
            cell!.textLabel?.text = self.agentNames[indexPath.row]
            
            cell!.detailTextLabel?.text = String(self.distance[indexPath.row])+" KM"
            
            //print(cell.detailTextLabel)
            
            return cell!
    }

   
}
