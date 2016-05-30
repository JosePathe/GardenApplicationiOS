//
//  MyWaitListListViewController.swift
//  WicaApp
//
//  Created by Mathieu Larcher on 01/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import Alamofire

class MyWaitListListViewController: UIViewController, UITableViewDataSource {
    // UI items
    @IBOutlet weak var MyWaitListTableView: UITableView!
    
    // Class attributes
    var user:User = User(json: nil)
    var waitListArray: [Waitlist]! = [Waitlist]()
    var gardenArray: [Garden]! = [Garden]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MyWaitListTableView.dataSource = self
        
        WebServiceHandler.sharedInstance.getAllWaitList({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let waitlist: Waitlist = Waitlist(object: element)
                if let unwrapping: Int = waitlist.waitListRefUser{
                    if unwrapping == Int(self.user.internalIdentifier!) {
                        self.waitListArray.append(waitlist)
                    }
                }
            }
            
            WebServiceHandler.sharedInstance.getAllGardens({(response) -> Void in
                let array:NSArray = response
                for element in array {
                    let garden: Garden = Garden(object: element)
                    if let unwrapping: Int = garden.gardenId{
                        for rec in self.waitListArray{
                            if unwrapping == rec.waitListRefGarden {
                                self.gardenArray.append(garden)
                            }
                        }
                    }
                }
                self.MyWaitListTableView.reloadData()
            })
        })
        
        self.MyWaitListTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.waitListArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyWaitListCell", forIndexPath: indexPath)
        
        let garden:Garden = self.gardenArray[indexPath.row] 
        
        cell.textLabel?.text = garden.gardenAddress
        
        return cell
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
