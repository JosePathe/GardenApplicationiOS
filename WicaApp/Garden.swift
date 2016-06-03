//
//  Garden.swift
//
//  Created by Johann Berthet on 03/06/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Garden: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kGardenGardenLongitudeKey: String = "garden_longitude"
	internal let kGardenGardenDateCreationKey: String = "garden_date_creation"
	internal let kGardenGardenTotalPlacesKey: String = "garden_total_places"
	internal let kGardenGardenIdKey: String = "garden_id"
	internal let kGardenGardenSurfaceKey: String = "garden_surface"
	internal let kGardenGardenPictureKey: String = "garden_picture"
	internal let kGardenGardenDateUpdateKey: String = "garden_date_update"
	internal let kGardenGardenLatitudeKey: String = "garden_latitude"
	internal let kGardenGardenRefCityKey: String = "garden_ref_city"
	internal let kGardenGardenAddressKey: String = "garden_address"
	internal let kGardenGardenRefAssociationKey: String = "garden_ref_association"


    // MARK: Properties
	public var gardenLongitude: String?
	public var gardenDateCreation: String?
	public var gardenTotalPlaces: Int?
	public var gardenId: Int?
	public var gardenSurface: String?
	public var gardenPicture: String?
	public var gardenDateUpdate: String?
	public var gardenLatitude: String?
	public var gardenRefCity: Int?
	public var gardenAddress: String?
	public var gardenRefAssociation: Int?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		gardenLongitude = json[kGardenGardenLongitudeKey].string
		gardenDateCreation = json[kGardenGardenDateCreationKey].string
		gardenTotalPlaces = json[kGardenGardenTotalPlacesKey].int
		gardenId = json[kGardenGardenIdKey].int
		gardenSurface = json[kGardenGardenSurfaceKey].string
		gardenPicture = json[kGardenGardenPictureKey].string
		gardenDateUpdate = json[kGardenGardenDateUpdateKey].string
		gardenLatitude = json[kGardenGardenLatitudeKey].string
		gardenRefCity = json[kGardenGardenRefCityKey].int
		gardenAddress = json[kGardenGardenAddressKey].string
		gardenRefAssociation = json[kGardenGardenRefAssociationKey].int

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if gardenLongitude != nil {
			dictionary.updateValue(gardenLongitude!, forKey: kGardenGardenLongitudeKey)
		}
		if gardenDateCreation != nil {
			dictionary.updateValue(gardenDateCreation!, forKey: kGardenGardenDateCreationKey)
		}
		if gardenTotalPlaces != nil {
			dictionary.updateValue(gardenTotalPlaces!, forKey: kGardenGardenTotalPlacesKey)
		}
		if gardenId != nil {
			dictionary.updateValue(gardenId!, forKey: kGardenGardenIdKey)
		}
		if gardenSurface != nil {
			dictionary.updateValue(gardenSurface!, forKey: kGardenGardenSurfaceKey)
		}
		if gardenPicture != nil {
			dictionary.updateValue(gardenPicture!, forKey: kGardenGardenPictureKey)
		}
		if gardenDateUpdate != nil {
			dictionary.updateValue(gardenDateUpdate!, forKey: kGardenGardenDateUpdateKey)
		}
		if gardenLatitude != nil {
			dictionary.updateValue(gardenLatitude!, forKey: kGardenGardenLatitudeKey)
		}
		if gardenRefCity != nil {
			dictionary.updateValue(gardenRefCity!, forKey: kGardenGardenRefCityKey)
		}
		if gardenAddress != nil {
			dictionary.updateValue(gardenAddress!, forKey: kGardenGardenAddressKey)
		}
		if gardenRefAssociation != nil {
			dictionary.updateValue(gardenRefAssociation!, forKey: kGardenGardenRefAssociationKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.gardenLongitude = aDecoder.decodeObjectForKey(kGardenGardenLongitudeKey) as? String
		self.gardenDateCreation = aDecoder.decodeObjectForKey(kGardenGardenDateCreationKey) as? String
		self.gardenTotalPlaces = aDecoder.decodeObjectForKey(kGardenGardenTotalPlacesKey) as? Int
		self.gardenId = aDecoder.decodeObjectForKey(kGardenGardenIdKey) as? Int
		self.gardenSurface = aDecoder.decodeObjectForKey(kGardenGardenSurfaceKey) as? String
		self.gardenPicture = aDecoder.decodeObjectForKey(kGardenGardenPictureKey) as? String
		self.gardenDateUpdate = aDecoder.decodeObjectForKey(kGardenGardenDateUpdateKey) as? String
		self.gardenLatitude = aDecoder.decodeObjectForKey(kGardenGardenLatitudeKey) as? String
		self.gardenRefCity = aDecoder.decodeObjectForKey(kGardenGardenRefCityKey) as? Int
		self.gardenAddress = aDecoder.decodeObjectForKey(kGardenGardenAddressKey) as? String
		self.gardenRefAssociation = aDecoder.decodeObjectForKey(kGardenGardenRefAssociationKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(gardenLongitude, forKey: kGardenGardenLongitudeKey)
		aCoder.encodeObject(gardenDateCreation, forKey: kGardenGardenDateCreationKey)
		aCoder.encodeObject(gardenTotalPlaces, forKey: kGardenGardenTotalPlacesKey)
		aCoder.encodeObject(gardenId, forKey: kGardenGardenIdKey)
		aCoder.encodeObject(gardenSurface, forKey: kGardenGardenSurfaceKey)
		aCoder.encodeObject(gardenPicture, forKey: kGardenGardenPictureKey)
		aCoder.encodeObject(gardenDateUpdate, forKey: kGardenGardenDateUpdateKey)
		aCoder.encodeObject(gardenLatitude, forKey: kGardenGardenLatitudeKey)
		aCoder.encodeObject(gardenRefCity, forKey: kGardenGardenRefCityKey)
		aCoder.encodeObject(gardenAddress, forKey: kGardenGardenAddressKey)
		aCoder.encodeObject(gardenRefAssociation, forKey: kGardenGardenRefAssociationKey)

    }

}
