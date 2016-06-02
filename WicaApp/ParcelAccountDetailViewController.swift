//
//  ParcelAccountDetailViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 31/05/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class ParcelAccountDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MyCustomCellDelegator {
    // UI items
    @IBOutlet weak var gardenNameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var associationLabel: UILabel!
    @IBOutlet weak var buttonAddVegetable: UIButton!
    @IBOutlet weak var vegetablesTableView: UITableView!
    
    // Class attributes
    var user:User = User(json: nil)
    var parcel:Parcel = Parcel(json: nil)
    var garden:Garden?
    var city:City?
    var association:Association?
    var parcelhasvegetablesList:[Parcelhasvegetables]! = [Parcelhasvegetables]()
    var vegetableList: NSMutableArray = []
    var selectedVegetable:Int = 0
    
    // Loader
    var overlayView:UIView = UIView(frame: UIScreen.mainScreen().bounds)
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Button style
        //self.buttonAddVegetable.layer.cornerRadius = 4;
        
        // Set this ViewController as list datasource and list delegate
        self.vegetablesTableView.dataSource = self
        self.vegetablesTableView.delegate = self
        
        // Loader and overlay init
        self.initLoading()
        
        // Initialize and provide info to text labels
        self.gardenNameLabel.text = ""
        self.areaLabel.text = "\(self.parcel.parcelSurface!) m²"
        self.cityLabel.text = ""
        self.associationLabel.text = ""

        // Get current garden
        WebServiceHandler.sharedInstance.getGardenById(WebServiceHandler.allGardensUrl, gardenId: self.parcel.parcelRefGarden!, completionHandler: {(response) -> Void in
            let dictionary:NSDictionary = response
            self.garden = Garden(object: dictionary)
            self.gardenNameLabel.text = self.garden?.gardenAddress!
            
            // Get current city
            WebServiceHandler.sharedInstance.getCityById(WebServiceHandler.allCitiesUrl, cityId: self.garden!.gardenRefCity!, completionHandler: {(response) -> Void in
                let dictionary:NSDictionary = response
                self.city = City(object: dictionary)
                self.cityLabel.text = self.city?.cityName!
                
                // Get current asscociation
                WebServiceHandler.sharedInstance.getAssociationById(WebServiceHandler.allAssociationsUrl, associationId: (self.garden?.gardenRefAssociation)!, completionHandler: {(response) -> Void in
                    let dictionary:NSDictionary = response
                    self.association = Association(object: dictionary)
                    
                    if self.garden!.gardenRefAssociation == self.association?.associationId {
                        self.associationLabel.text = self.association?.associationName!
                    } else {
                        self.associationLabel.text = "Mairie de \(self.city?.cityName)"
                    }
                    
                    // Loader end
                    self.completeLoading()
                })
            })
        })
        
        // Webservice call
        WebServiceHandler.sharedInstance.getAllParcelHasVegetables({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let parcelhasvegetables:Parcelhasvegetables = Parcelhasvegetables(object: element)
                if parcelhasvegetables.parcelHasVegetableParcel! == self.parcel.parcelId! {
                    self.parcelhasvegetablesList.append(parcelhasvegetables)
                }
            }
            
            WebServiceHandler.sharedInstance.getAllVegetables({(response) -> Void in
                let array:NSArray = response
                for currentParcel in self.parcelhasvegetablesList {
                    //let currentParcelhasvegetables:Parcelhasvegetables = Parcelhasvegetables(object: currentParcel)
                    for element in array {
                        let vegetable:Vegetable = Vegetable(object: element)
                        if vegetable.vegetableId! == currentParcel.parcelHasVegetableVegetable {
                            self.vegetableList.addObject(vegetable)
                        }
                    }
                }
                    
                self.vegetablesTableView.reloadData()
            })
        })
        
        // Remove empty cells
        self.vegetablesTableView.tableFooterView = UIView()//frame: CGRect.zero
    }
    
    override func viewWillAppear(animated: Bool) {
        self.vegetablesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Click listener
    
    @IBAction func onClickButtonAddVegetable(sender: UIButton) {
        self.performSegueWithIdentifier("toAddVegetable", sender: self)
    }
    
    // MARK: - TableView Datasource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vegetableList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VegetableCell", forIndexPath: indexPath) as! VegetableTableViewCell
        let vegetable:Vegetable = self.vegetableList[indexPath.row] as! Vegetable
        cell.delegate = self
        cell.parcelhasvegetablesId = self.parcelhasvegetablesList[indexPath.row].parcelHasVegetableId!
        cell.parcelhasvegetables = self.parcelhasvegetablesList[indexPath.row]
        cell.parcelhasvegetablesIndex = indexPath.row
        cell.quantityLabel.text = String(self.parcelhasvegetablesList[indexPath.row].parcelHasVegetableQuantity!)
        cell.vegetableNameLabel.text = vegetable.vegetableName!
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedVegetable = indexPath.row
        //self.performSegueWithIdentifier("toAddVegetable", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addVegetableViewController = segue.destinationViewController as! AddVegetableViewController
        addVegetableViewController.parcel = self.parcel
        addVegetableViewController.user = self.user
    }
    
    func initLoading() -> Void {
        self.overlayView = UIView(frame: UIScreen.mainScreen().bounds)
        self.overlayView.backgroundColor = UIColor(white: 255, alpha: 1)
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        self.activityIndicator.center = overlayView.center
        self.overlayView.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
        view.addSubview(overlayView)
    }
    
    func completeLoading() -> Void {
        self.activityIndicator.stopAnimating()
        self.overlayView.removeFromSuperview()
    }
    
    // MARK: - Protocol method
    func callSegueFromCell(segueId: String) {
        self.performSegueWithIdentifier(segueId, sender: self)
    }
    
    func reloadData() {
        self.vegetablesTableView.reloadData()
    }
    
    func updateParcelhasvegetablesAtIndex(parcelhasvegetablesIndex: Int, newQuantity: Int) {
        self.parcelhasvegetablesList[parcelhasvegetablesIndex].parcelHasVegetableQuantity! = newQuantity
    }
    
    func removeParcelhasvegetablesAtIndex(parcelhasvegetablesIndex: Int) {
        self.parcelhasvegetablesList.removeAtIndex(parcelhasvegetablesIndex)
        self.vegetableList.removeObjectAtIndex(parcelhasvegetablesIndex)
    }

}

protocol MyCustomCellDelegator {
    func callSegueFromCell(segueId: String)
    func reloadData()
    func updateParcelhasvegetablesAtIndex(parcelhasvegetablesIndex: Int, newQuantity: Int)
    func removeParcelhasvegetablesAtIndex(parcelhasvegetablesIndex: Int)
}
