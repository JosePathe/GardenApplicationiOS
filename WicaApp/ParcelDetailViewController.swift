//
//  ParcelDetailViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 18/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit

class ParcelDetailViewController: UIViewController {
    // UI items
    @IBOutlet weak var gardenNameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var isFreeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var associationLabel: UILabel!
    
    
    // Class attributes
    var parcel:Parcel = Parcel(json: nil)
    var garden:Garden?
    var city:City?
    var association:Association?
    
    // Loader
    var overlayView:UIView = UIView(frame: UIScreen.mainScreen().bounds)
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loader and overlay init
        self.initLoading()
        
        // Initialize and provide info to text labels
        self.gardenNameLabel.text = ""
        self.areaLabel.text = "\(self.parcel.parcelSurface!) m²"
        if self.parcel.parcelIsFree == 1 {
            self.isFreeLabel.text = "Libre"
        } else {
            self.isFreeLabel.text = "Occupée"
        }
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initLoading() -> Void {
        //self.overlayView = UIView(frame: UIScreen.mainScreen().bounds)
        self.overlayView.backgroundColor = UIColor(white: 255, alpha: 1)
        //self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        self.activityIndicator.center = overlayView.center
        self.overlayView.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
        view.addSubview(overlayView)
    }
    
    func completeLoading() -> Void {
        self.activityIndicator.stopAnimating()
        self.overlayView.removeFromSuperview()
    }

}
