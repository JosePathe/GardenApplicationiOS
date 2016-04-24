//
//  MapAnnotation.swift
//  TPFinal_JohannBerthet
//
//  Created by Johann Berthet on 23/02/2016.
//  Copyright © 2016 Johann Berthet. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var internalIdentifier: Int
    
    init(title: String, coordinate: CLLocationCoordinate2D, id: Int) {
        self.title = title
        self.coordinate = coordinate
        self.internalIdentifier = id
    }
    
    init(title: String, latitude: String, longitude: String, id: Int) {
        self.title = title
        self.internalIdentifier = id
        
        let latitude:CLLocationDegrees = CLLocationDegrees.init(latitude)!
        let longitude:CLLocationDegrees = CLLocationDegrees.init(longitude)!
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        self.coordinate = location
    }
}
