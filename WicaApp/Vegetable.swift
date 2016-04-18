//
//  Vegetable.swift
//
//  Created by Johann Berthet on 18/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Vegetable: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kVegetableVegetableNameKey: String = "vegetable_name"
	internal let kVegetableVegetablePictureKey: String = "vegetable_picture"
	internal let kVegetableVegetableIdKey: String = "vegetable_id"
	internal let kVegetableVegetableDateUpdateKey: String = "vegetable_date_update"
	internal let kVegetableVegetableDateCreationKey: String = "vegetable_date_creation"


    // MARK: Properties
	public var vegetableName: String?
	public var vegetablePicture: String?
	public var vegetableId: Int?
	public var vegetableDateUpdate: String?
	public var vegetableDateCreation: String?


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
		vegetableName = json[kVegetableVegetableNameKey].string
		vegetablePicture = json[kVegetableVegetablePictureKey].string
		vegetableId = json[kVegetableVegetableIdKey].int
		vegetableDateUpdate = json[kVegetableVegetableDateUpdateKey].string
		vegetableDateCreation = json[kVegetableVegetableDateCreationKey].string

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if vegetableName != nil {
			dictionary.updateValue(vegetableName!, forKey: kVegetableVegetableNameKey)
		}
		if vegetablePicture != nil {
			dictionary.updateValue(vegetablePicture!, forKey: kVegetableVegetablePictureKey)
		}
		if vegetableId != nil {
			dictionary.updateValue(vegetableId!, forKey: kVegetableVegetableIdKey)
		}
		if vegetableDateUpdate != nil {
			dictionary.updateValue(vegetableDateUpdate!, forKey: kVegetableVegetableDateUpdateKey)
		}
		if vegetableDateCreation != nil {
			dictionary.updateValue(vegetableDateCreation!, forKey: kVegetableVegetableDateCreationKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.vegetableName = aDecoder.decodeObjectForKey(kVegetableVegetableNameKey) as? String
		self.vegetablePicture = aDecoder.decodeObjectForKey(kVegetableVegetablePictureKey) as? String
		self.vegetableId = aDecoder.decodeObjectForKey(kVegetableVegetableIdKey) as? Int
		self.vegetableDateUpdate = aDecoder.decodeObjectForKey(kVegetableVegetableDateUpdateKey) as? String
		self.vegetableDateCreation = aDecoder.decodeObjectForKey(kVegetableVegetableDateCreationKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(vegetableName, forKey: kVegetableVegetableNameKey)
		aCoder.encodeObject(vegetablePicture, forKey: kVegetableVegetablePictureKey)
		aCoder.encodeObject(vegetableId, forKey: kVegetableVegetableIdKey)
		aCoder.encodeObject(vegetableDateUpdate, forKey: kVegetableVegetableDateUpdateKey)
		aCoder.encodeObject(vegetableDateCreation, forKey: kVegetableVegetableDateCreationKey)

    }

}
