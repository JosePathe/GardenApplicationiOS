//
//  CityMapViewController.swift
//  WicaApp
//
//  Created by Johann Berthet on 12/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import MapKit

class CityMapViewController: UIViewController, MKMapViewDelegate {
    // UI items
    @IBOutlet weak var mapView: MKMapView!
    
    // Class attributes
    var cityList: NSMutableDictionary = NSMutableDictionary()
    var selectedCity:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set this ViewController as map delegate
        self.mapView.delegate = self
        
        

        // Webservice call
        WebServiceHandler.sharedInstance.getAllCities({(response) -> Void in
            let array:NSArray = response
            for element in array {
                let city:City = City(object: element)
                let cityAnnotation = MapAnnotation.init(title: city.cityName!, latitude: city.cityLatitude!,longitude: city.cityLongitude!, id: city.cityId!)
                self.cityList.setObject(city, forKey: city.cityName!)
                self.mapView.addAnnotation(cityAnnotation)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MapView Delegate Methods
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        self.selectedCity = (view.annotation?.title!)!
        self.performSegueWithIdentifier("toGardenList", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let gardenListViewController = segue.destinationViewController as! GardenListViewController
        gardenListViewController.city = self.cityList.objectForKey(self.selectedCity) as! City
    }

}
