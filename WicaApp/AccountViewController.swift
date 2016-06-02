//
//  AccountViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 02/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UI items
    @IBOutlet weak var accountTableView: UITableView!
    
    // Class attributes
    var accountMenuList: NSArray = ["Mes listes d'attente", "Ma parcelle", "Mon compte", "Mes trocs & aides"]
    var user:User = User(json: nil)
    var parcel:Parcel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this ViewController as list datasource and list delegate
        self.accountTableView.dataSource = self
        self.accountTableView.delegate = self
        
        // Remove empty cells
        self.accountTableView.tableFooterView = UIView()//frame: CGRect.zero
        
        if WebServiceHandler.sharedInstance.user?.internalIdentifier != nil {
            self.user = WebServiceHandler.sharedInstance.user!
        }
        
        // Check if user is connected
        if self.user.internalIdentifier == nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let connectionViewController = storyBoard.instantiateViewControllerWithIdentifier("ConnectionViewController") as! ConnectionViewController
            self.presentViewController(connectionViewController, animated: true, completion: nil)
        }
        
        // Webservice call
        WebServiceHandler.sharedInstance.getAllParcels({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let parcel:Parcel = Parcel(object: element)
                print(WebServiceHandler.sharedInstance.user?.internalIdentifier!)
                if (parcel.parcelRefUser != nil) && (WebServiceHandler.sharedInstance.user?.internalIdentifier! == String(parcel.parcelRefUser!)) {
                    self.parcel = parcel
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accountMenuList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = self.accountMenuList[indexPath.row] as? String
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("toWaitlistListAccount", sender: self)
        }
        
        if indexPath.row == 1 {
            self.performSegueWithIdentifier("toParcelAccountDetail", sender: self)
        }
        
        if indexPath.row == 2 {
            self.performSegueWithIdentifier("toAccountDetail", sender: self)
        }
        
        if indexPath.row == 2 {
            self.performSegueWithIdentifier("toAccountTrocAndHelp", sender: self)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "toWaitlistListAccount" == segue.identifier! {
            let myWaitListListViewController = segue.destinationViewController as! MyWaitListListViewController
            myWaitListListViewController.user = self.user
        }
        
        if "toParcelAccountDetail" == segue.identifier! {
            let parcelAccountDetailViewController = segue.destinationViewController as! ParcelAccountDetailViewController
            parcelAccountDetailViewController.parcel = self.parcel!
            parcelAccountDetailViewController.user = self.user
        }
        
        if "toAccountDetail" == segue.identifier! {
            let accountDetailViewController = segue.destinationViewController as! AccountDetailViewController
            accountDetailViewController.user = self.user
        }
        
        if "toAccountTrocAndHelp" == segue.identifier! {
            //let myTrocsAndHelpsViewController = segue.destinationViewController as! MyTrocsAndHelpsViewController
        }
    }

}
