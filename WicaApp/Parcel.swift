//
//  Parcel.swift
//
//  Created by Johann Berthet on 18/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Parcel: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kParcelParcelDateCreationKey: String = "parcel_date_creation"
	internal let kParcelParcelIdKey: String = "parcel_id"
	internal let kParcelParcelDateObtainmentKey: String = "parcel_date_obtainment"
	internal let kParcelParcelLatitudeKey: String = "parcel_latitude"
	internal let kParcelParcelRefUserKey: String = "parcel_ref_user"
	internal let kParcelParcelDateUpdateKey: String = "parcel_date_update"
	internal let kParcelParcelIsFreeKey: String = "parcel_is_free"
	internal let kParcelParcelRefGardenKey: String = "parcel_ref_garden"
	internal let kParcelParcelSurfaceKey: String = "parcel_surface"
	internal let kParcelParcelLongitudeKey: String = "parcel_longitude"


    // MARK: Properties
	public var parcelDateCreation: String?
	public var parcelId: Int?
	public var parcelDateObtainment: String?
	public var parcelLatitude: String?
	public var parcelRefUser: Int?
	public var parcelDateUpdate: String?
	public var parcelIsFree: Int?
	public var parcelRefGarden: Int?
	public var parcelSurface: String?
	public var parcelLongitude: String?


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
		parcelDateCreation = json[kParcelParcelDateCreationKey].string
		parcelId = json[kParcelParcelIdKey].int
		parcelDateObtainment = json[kParcelParcelDateObtainmentKey].string
		parcelLatitude = json[kParcelParcelLatitudeKey].string
		parcelRefUser = json[kParcelParcelRefUserKey].int
		parcelDateUpdate = json[kParcelParcelDateUpdateKey].string
		parcelIsFree = json[kParcelParcelIsFreeKey].int
		parcelRefGarden = json[kParcelParcelRefGardenKey].int
		parcelSurface = json[kParcelParcelSurfaceKey].string
		parcelLongitude = json[kParcelParcelLongitudeKey].string

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if parcelDateCreation != nil {
			dictionary.updateValue(parcelDateCreation!, forKey: kParcelParcelDateCreationKey)
		}
		if parcelId != nil {
			dictionary.updateValue(parcelId!, forKey: kParcelParcelIdKey)
		}
		if parcelDateObtainment != nil {
			dictionary.updateValue(parcelDateObtainment!, forKey: kParcelParcelDateObtainmentKey)
		}
		if parcelLatitude != nil {
			dictionary.updateValue(parcelLatitude!, forKey: kParcelParcelLatitudeKey)
		}
		if parcelRefUser != nil {
			dictionary.updateValue(parcelRefUser!, forKey: kParcelParcelRefUserKey)
		}
		if parcelDateUpdate != nil {
			dictionary.updateValue(parcelDateUpdate!, forKey: kParcelParcelDateUpdateKey)
		}
		if parcelIsFree != nil {
			dictionary.updateValue(parcelIsFree!, forKey: kParcelParcelIsFreeKey)
		}
		if parcelRefGarden != nil {
			dictionary.updateValue(parcelRefGarden!, forKey: kParcelParcelRefGardenKey)
		}
		if parcelSurface != nil {
			dictionary.updateValue(parcelSurface!, forKey: kParcelParcelSurfaceKey)
		}
		if parcelLongitude != nil {
			dictionary.updateValue(parcelLongitude!, forKey: kParcelParcelLongitudeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.parcelDateCreation = aDecoder.decodeObjectForKey(kParcelParcelDateCreationKey) as? String
		self.parcelId = aDecoder.decodeObjectForKey(kParcelParcelIdKey) as? Int
		self.parcelDateObtainment = aDecoder.decodeObjectForKey(kParcelParcelDateObtainmentKey) as? String
		self.parcelLatitude = aDecoder.decodeObjectForKey(kParcelParcelLatitudeKey) as? String
		self.parcelRefUser = aDecoder.decodeObjectForKey(kParcelParcelRefUserKey) as? Int
		self.parcelDateUpdate = aDecoder.decodeObjectForKey(kParcelParcelDateUpdateKey) as? String
		self.parcelIsFree = aDecoder.decodeObjectForKey(kParcelParcelIsFreeKey) as? Int
		self.parcelRefGarden = aDecoder.decodeObjectForKey(kParcelParcelRefGardenKey) as? Int
		self.parcelSurface = aDecoder.decodeObjectForKey(kParcelParcelSurfaceKey) as? String
		self.parcelLongitude = aDecoder.decodeObjectForKey(kParcelParcelLongitudeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(parcelDateCreation, forKey: kParcelParcelDateCreationKey)
		aCoder.encodeObject(parcelId, forKey: kParcelParcelIdKey)
		aCoder.encodeObject(parcelDateObtainment, forKey: kParcelParcelDateObtainmentKey)
		aCoder.encodeObject(parcelLatitude, forKey: kParcelParcelLatitudeKey)
		aCoder.encodeObject(parcelRefUser, forKey: kParcelParcelRefUserKey)
		aCoder.encodeObject(parcelDateUpdate, forKey: kParcelParcelDateUpdateKey)
		aCoder.encodeObject(parcelIsFree, forKey: kParcelParcelIsFreeKey)
		aCoder.encodeObject(parcelRefGarden, forKey: kParcelParcelRefGardenKey)
		aCoder.encodeObject(parcelSurface, forKey: kParcelParcelSurfaceKey)
		aCoder.encodeObject(parcelLongitude, forKey: kParcelParcelLongitudeKey)

    }

}
