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
    
    // Singleton initalization
    static let sharedInstance: WebServiceHandler = WebServiceHandler()
    
    // Method to get all the gardens
    func getAllGardens(url: String, completionHandler : ((response: NSArray) -> Void) ) {
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
