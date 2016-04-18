//
//  WebServiceHandler.swift
//  WicaApp
//
//  Created by Johann Berthet on 11/04/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceHandler: NSObject {
    // List of Urls form the webservice
    internal static let allGardensUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/gardens"
    internal static let allCitiesUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/city"
    internal static let allParcelsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/parcel"
    internal static let allAssociationsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/associations"
    // Singleton initalization
    static let sharedInstance: WebServiceHandler = WebServiceHandler()
    
    // MARK: - Get All Items Methods
    
    // Method to get all the gardens
    func getAllGardens(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allGardensUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all the cities
    func getAllCities(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allCitiesUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all the parcels
    func getAllParcels(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allParcelsUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all the associations
    func getAllAssociations(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allAssociationsUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // MARK: - Get Item By ID Methods
    
    // Method to get all the gardens from a city
    func getAllGardensFromCity(url: String, cityId: Int, completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, url)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
}
