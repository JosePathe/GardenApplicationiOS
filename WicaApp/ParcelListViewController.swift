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
    
    // Class attributes
    var garden:Garden = Garden(json: nil)
    var parcelList: NSMutableArray = []
    var selectedParcel:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    // MARK: - TableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parcelList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //let parcel:Parcel = self.parcelList[indexPath.row] as! Parcel
        cell.textLabel!.text = String.init("Parcelle n°\(String(indexPath.row+1))")
        
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
