//
//  Parcelhasvegetables.swift
//
//  Created by Johann Berthet on 18/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Parcelhasvegetables: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kParcelhasvegetablesParcelHasVegetableIdKey: String = "parcel_has_vegetable_id"
	internal let kParcelhasvegetablesParcelHasVegetableParcelKey: String = "parcel_has_vegetable_parcel"
	internal let kParcelhasvegetablesParcelHasVegetableVegetableKey: String = "parcel_has_vegetable_vegetable"


    // MARK: Properties
	public var parcelHasVegetableId: Int?
	public var parcelHasVegetableParcel: Int?
	public var parcelHasVegetableVegetable: Int?


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
		parcelHasVegetableId = json[kParcelhasvegetablesParcelHasVegetableIdKey].int
		parcelHasVegetableParcel = json[kParcelhasvegetablesParcelHasVegetableParcelKey].int
		parcelHasVegetableVegetable = json[kParcelhasvegetablesParcelHasVegetableVegetableKey].int

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if parcelHasVegetableId != nil {
			dictionary.updateValue(parcelHasVegetableId!, forKey: kParcelhasvegetablesParcelHasVegetableIdKey)
		}
		if parcelHasVegetableParcel != nil {
			dictionary.updateValue(parcelHasVegetableParcel!, forKey: kParcelhasvegetablesParcelHasVegetableParcelKey)
		}
		if parcelHasVegetableVegetable != nil {
			dictionary.updateValue(parcelHasVegetableVegetable!, forKey: kParcelhasvegetablesParcelHasVegetableVegetableKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.parcelHasVegetableId = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableIdKey) as? Int
		self.parcelHasVegetableParcel = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableParcelKey) as? Int
		self.parcelHasVegetableVegetable = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableVegetableKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(parcelHasVegetableId, forKey: kParcelhasvegetablesParcelHasVegetableIdKey)
		aCoder.encodeObject(parcelHasVegetableParcel, forKey: kParcelhasvegetablesParcelHasVegetableParcelKey)
		aCoder.encodeObject(parcelHasVegetableVegetable, forKey: kParcelhasvegetablesParcelHasVegetableVegetableKey)

    }

}
