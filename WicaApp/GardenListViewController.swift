//
//  GardenListViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 13/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class GardenListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UI items
    @IBOutlet weak var gardenTableView: UITableView!
    
    // Class attributes
    var city:City = City(json: nil)
    var gardenList: NSMutableArray = []
    var selectedGarden:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this ViewController as list datasource and list delegate
        self.gardenTableView.dataSource = self
        self.gardenTableView.delegate = self

        // Webservice call
        WebServiceHandler.sharedInstance.getAllGardens({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let garden:Garden = Garden(object: element)
                if self.city.cityId == garden.gardenRefCity {
                    self.gardenList.addObject(garden)
                }
            }
            
            self.gardenTableView.reloadData()
        })
        
        // Remove empty cells
        self.gardenTableView.tableFooterView = UIView()//frame: CGRect.zero
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gardenList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let garden:Garden = self.gardenList[indexPath.row] as! Garden
        cell.textLabel!.text = garden.gardenAddress

        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedGarden = indexPath.row
        self.performSegueWithIdentifier("toGardenDetail", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let parceListViewController = segue.destinationViewController as! ParcelListViewController
        parceListViewController.garden = self.gardenList[self.selectedGarden] as! Garden
    }

}
