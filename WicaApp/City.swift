//
//  City.swift
//
//  Created by Johann Berthet on 14/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class City: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCityCityZipCodeKey: String = "city_zip_code"
	internal let kCityCityNameKey: String = "city_name"
	internal let kCityCityLatitudeKey: String = "city_latitude"
	internal let kCityCityIdKey: String = "city_id"
	internal let kCityCityLongitudeKey: String = "city_longitude"
	internal let kCityCityDateCreationKey: String = "city_date_creation"
	internal let kCityCityDateUpdateKey: String = "city_date_update"


    // MARK: Properties
	public var cityZipCode: String?
	public var cityName: String?
	public var cityLatitude: String?
	public var cityId: Int?
	public var cityLongitude: String?
	public var cityDateCreation: String?
	public var cityDateUpdate: String?


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
		cityZipCode = json[kCityCityZipCodeKey].string
		cityName = json[kCityCityNameKey].string
		cityLatitude = json[kCityCityLatitudeKey].string
		cityId = json[kCityCityIdKey].int
		cityLongitude = json[kCityCityLongitudeKey].string
		cityDateCreation = json[kCityCityDateCreationKey].string
		cityDateUpdate = json[kCityCityDateUpdateKey].string

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if cityZipCode != nil {
			dictionary.updateValue(cityZipCode!, forKey: kCityCityZipCodeKey)
		}
		if cityName != nil {
			dictionary.updateValue(cityName!, forKey: kCityCityNameKey)
		}
		if cityLatitude != nil {
			dictionary.updateValue(cityLatitude!, forKey: kCityCityLatitudeKey)
		}
		if cityId != nil {
			dictionary.updateValue(cityId!, forKey: kCityCityIdKey)
		}
		if cityLongitude != nil {
			dictionary.updateValue(cityLongitude!, forKey: kCityCityLongitudeKey)
		}
		if cityDateCreation != nil {
			dictionary.updateValue(cityDateCreation!, forKey: kCityCityDateCreationKey)
		}
		if cityDateUpdate != nil {
			dictionary.updateValue(cityDateUpdate!, forKey: kCityCityDateUpdateKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.cityZipCode = aDecoder.decodeObjectForKey(kCityCityZipCodeKey) as? String
		self.cityName = aDecoder.decodeObjectForKey(kCityCityNameKey) as? String
		self.cityLatitude = aDecoder.decodeObjectForKey(kCityCityLatitudeKey) as? String
		self.cityId = aDecoder.decodeObjectForKey(kCityCityIdKey) as? Int
		self.cityLongitude = aDecoder.decodeObjectForKey(kCityCityLongitudeKey) as? String
		self.cityDateCreation = aDecoder.decodeObjectForKey(kCityCityDateCreationKey) as? String
		self.cityDateUpdate = aDecoder.decodeObjectForKey(kCityCityDateUpdateKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(cityZipCode, forKey: kCityCityZipCodeKey)
		aCoder.encodeObject(cityName, forKey: kCityCityNameKey)
		aCoder.encodeObject(cityLatitude, forKey: kCityCityLatitudeKey)
		aCoder.encodeObject(cityId, forKey: kCityCityIdKey)
		aCoder.encodeObject(cityLongitude, forKey: kCityCityLongitudeKey)
		aCoder.encodeObject(cityDateCreation, forKey: kCityCityDateCreationKey)
		aCoder.encodeObject(cityDateUpdate, forKey: kCityCityDateUpdateKey)

    }

}
