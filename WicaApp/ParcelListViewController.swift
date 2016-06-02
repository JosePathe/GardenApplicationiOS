//
//  ParcelListViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 18/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class ParcelListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UI items
    @IBOutlet weak var parcelTableView: UITableView!
    @IBOutlet weak var subscribeButton: UIButton!
    
    // Class attributes
    var garden:Garden = Garden(json: nil)
    var parcelList:NSMutableArray = []
    var selectedParcel:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button style
        //self.subscribeButton.layer.cornerRadius = 4;

        // Set this ViewController as list datasource and list delegate
        self.parcelTableView.dataSource = self
        self.parcelTableView.delegate = self
        
        // Webservice call
        WebServiceHandler.sharedInstance.getAllParcels({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let parcel:Parcel = Parcel(object: element)
                if self.garden.gardenId == parcel.parcelRefGarden {
                    self.parcelList.addObject(parcel)
                }
            }
            
            self.parcelTableView.reloadData()
        })
        
        // Remove empty cells
        self.parcelTableView.tableFooterView = UIView()//frame: CGRect.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickSubscribeButton(sender: UIButton) {
        // Check if user is connected
        if WebServiceHandler.sharedInstance.user?.internalIdentifier == nil {
            let alert = UIAlertController(title: "Erreur", message: "Vous devez être connecté pour vous inscrire", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let parameters : [ String : NSString] = [
                "wait_list_ref_garden": "\(self.garden.gardenId!)",
                "wait_list_ref_user": "\(7)"
            ]
            
            WebServiceHandler.sharedInstance.addSubscribe(WebServiceHandler.allWaitLists, key: "hBwVkMMSzaUkwJNhpk3i_yNimjrtyH5R", parameters: parameters)
        }
    }
    
    // MARK: - TableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parcelList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ParcelCell", forIndexPath: indexPath) as! ParcelTableViewCell
        let parcel:Parcel = self.parcelList[indexPath.row] as! Parcel
        cell.parcelLabel.text = String.init("Parcelle n°\(String(indexPath.row+1))")
        if parcel.parcelIsFree == 1 {
            cell.isFreeLabel.text = "Libre"
            cell.isFreeLabel.textColor = UIColor.greenColor()
        } else {
            cell.isFreeLabel.text = "Occupée"
            cell.isFreeLabel.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedParcel = indexPath.row
        self.performSegueWithIdentifier("toParcelDetail", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let parceDetailViewController = segue.destinationViewController as! ParcelDetailViewController
        parceDetailViewController.parcel = self.parcelList[self.selectedParcel] as! Parcel
    }

}
