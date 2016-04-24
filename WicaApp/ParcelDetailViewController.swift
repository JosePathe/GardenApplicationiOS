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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get current garden
        WebServiceHandler.sharedInstance.getAllGardens({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let garden:Garden = Garden(object: element)
                if self.parcel.parcelRefGarden == garden.gardenId {
                    self.garden = garden
                    self.gardenNameLabel.text = String(self.garden!.gardenAddress!)
                }
            }
        })
        
        // Get current city
        WebServiceHandler.sharedInstance.getAllCities({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let city:City = City(object: element)
                if self.garden?.gardenRefCity == city.cityId {
                    self.city = city
                    self.cityLabel.text = String(self.city!.cityName!)
                }
            }
        })
        
        // Get current asscociation
        WebServiceHandler.sharedInstance.getAllAssociations({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let association:Association = Association(object: element)
                if self.garden?.gardenRefAssociation == association.associationId {
                    self.association = association
                    self.associationLabel.text = String(self.association!.associationName!)
                }
            }
        })
        
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

}
