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
    internal static let allCitiesUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/cities"
    internal static let allParcelsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/parcels"
    internal static let allAssociationsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/associations"
    internal static let allVegetablesUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/vegetables"
    internal static let allParcelHasVegetables: String = "http://wica.esy.es/advanced/frontend/web/index.php/parcelhasvegetables"
    internal static let allUsersUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/users"
    internal static let allWaitLists: String = "http://wica.esy.es/advanced/frontend/web/index.php/waitlists"
    internal static let loginConnection: String = "http://wica.esy.es/advanced/frontend/web/index.php/logins"
    internal static let allTrocsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/trocs"
    internal static let allHelpsUrl: String = "http://wica.esy.es/advanced/frontend/web/index.php/helps"
    
    // Singleton initalization
    static let sharedInstance: WebServiceHandler = WebServiceHandler()
    var user:User?
    
    // MARK: - GET All Items Methods
    
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
    
    // Method to get all vegetables
    func getAllVegetables(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allVegetablesUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all the waitlists
    func getAllWaitList(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allWaitLists)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
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
    
    // Method to get all trocs
    func getAllTrocs(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allTrocsUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all helps
    func getAllHelps(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allHelpsUrl)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    // Method to get all parcelhasvegetables
    func getAllParcelHasVegetables(completionHandler : ((response: NSArray) -> Void) ) {
        Alamofire.request(.GET, WebServiceHandler.allParcelHasVegetables)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSArray)
                } else {
                    return completionHandler(response: [])
                }
        }
    }
    
    
    // MARK: - GET Item By ID Methods
    
    // Method to get a garden by ID
    func getGardenById(url: String, gardenId: Int, completionHandler : ((response: NSDictionary
        ) -> Void) ) {
        Alamofire.request(.GET, "\(url)/\(gardenId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to get a city by ID
    func getCityById(url: String, cityId: Int, completionHandler : ((response: NSDictionary) -> Void) ) {
        Alamofire.request(.GET, "\(url)/\(cityId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to get an association by ID
    func getAssociationById(url: String, associationId: Int, completionHandler : ((response: NSDictionary) -> Void) ) {
        Alamofire.request(.GET, "\(url)/\(associationId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to get an user by ID
    func getUserById(url: String, userId: Int, completionHandler : ((response: NSDictionary) -> Void) ) {
        Alamofire.request(.GET, "\(url)/\(userId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to get a parcelhasvegetables by ID
    func getParcelHasVegetablesById(url: String, parcelhasvegetablesId: Int, completionHandler : ((response: NSDictionary) -> Void) ) {
        Alamofire.request(.GET, "\(url)/\(parcelhasvegetablesId)")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    
    
    // MARK: - POST Methods
    
    // Method to add vegetables to a parcel
    func addVegetablesToParcel(url: String, key: String, parameters: [String: AnyObject], completionHandler : ((response: NSDictionary) -> Void)){
        Alamofire.request(.POST, "\(url)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            
            if let JSON = response.result.value {
                return completionHandler(response: JSON as! NSDictionary)
            } else {
                return completionHandler(response: [:])
            }
        }
    }
    
    // Method to subcribe in garden
    func addSubscribe(url: String, key: String, parameters: [String: AnyObject], completionHandler : ((response: NSDictionary) -> Void)){
        Alamofire.request(.POST,  "\(url)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            
            if let JSON = response.result.value {
                return completionHandler(response: JSON as! NSDictionary)
            } else {
                return completionHandler(response: [:])
            }
            
        }
    }
    
    // Method to connect
    func connectionLogin(url: String, parameters: [String: AnyObject], completionHandler : ((response: NSDictionary) -> Void) ) {
        Alamofire.request(.POST, WebServiceHandler.loginConnection, parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to add user
    func addUser(url: String, parameters: [String: AnyObject]){
        Alamofire.request(.POST, WebServiceHandler.allUsersUrl, parameters: parameters, encoding: .JSON).responseJSON { response in
            print(response)
        }
    }
    
    // Method to add troc
    func addTroc(url: String, key: String, parameters: [String: AnyObject]){
        Alamofire.request(.POST, "\(url)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            print(response)
        }
    }
    
    // Method to add help
    func addHelp(url: String, key: String, parameters: [String: AnyObject]){
        Alamofire.request(.POST, "\(url)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            print(response)
        }
    }
    
    
    // MARK: - PUT Methods
    
    // Method to update vegetables to a parcel
    func updateVegetablesFromParcel(url: String, id:Int, key: String, parameters: [String: AnyObject], completionHandler : ((response: NSDictionary) -> Void)){
        Alamofire.request(.PUT, "\(url)/\(id)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            
                if let JSON = response.result.value {
                    return completionHandler(response: JSON as! NSDictionary)
                } else {
                    return completionHandler(response: [:])
                }
        }
    }
    
    // Method to update & accept help
    func updateAcceptHelp(url: String, id:Int, key: String, parameters: [String: AnyObject]){
        Alamofire.request(.PUT, "\(url)/\(id)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            print(response)
        }
    }
    
    // Method to update & accept troc
    func updateAcceptTroc(url: String, id:Int, key: String, parameters: [String: AnyObject]){
        Alamofire.request(.PUT, "\(url)/\(id)?key=\(key)", parameters: parameters, encoding: .JSON).responseJSON { response in
            print(response)
        }
    }
    
    
    // MARK: - DELETE Methods
    
    // Method to delete vegetables on a parcel
    func deleteVegetablesFromParcel(url: String, id: Int, key: String, completionHandler : ((response: Bool) -> Void)){
        Alamofire.request(.DELETE, "\(url)/\(id)?key=\(key)", encoding: .JSON).responseJSON { response in
            if response.result.value != nil {
                return completionHandler(response: response.result.isSuccess)
            } else {
                return completionHandler(response: response.result.isFailure)
            }
        }
    }
}
