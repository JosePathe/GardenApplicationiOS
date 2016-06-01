//
//  Parcelhasvegetables.swift
//
//  Created by Johann Berthet on 31/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Parcelhasvegetables: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kParcelhasvegetablesParcelHasVegetableParcelKey: String = "parcel_has_vegetable_parcel"
	internal let kParcelhasvegetablesParcelHasVegetableVegetableKey: String = "parcel_has_vegetable_vegetable"
	internal let kParcelhasvegetablesParcelHasVegetableIdKey: String = "parcel_has_vegetable_id"
	internal let kParcelhasvegetablesParcelHasVegetableQuantityKey: String = "parcel_has_vegetable_quantity"


    // MARK: Properties
	public var parcelHasVegetableParcel: Int?
	public var parcelHasVegetableVegetable: Int?
	public var parcelHasVegetableId: Int?
	public var parcelHasVegetableQuantity: Int?


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
		parcelHasVegetableParcel = json[kParcelhasvegetablesParcelHasVegetableParcelKey].int
		parcelHasVegetableVegetable = json[kParcelhasvegetablesParcelHasVegetableVegetableKey].int
		parcelHasVegetableId = json[kParcelhasvegetablesParcelHasVegetableIdKey].int
		parcelHasVegetableQuantity = json[kParcelhasvegetablesParcelHasVegetableQuantityKey].int

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if parcelHasVegetableParcel != nil {
			dictionary.updateValue(parcelHasVegetableParcel!, forKey: kParcelhasvegetablesParcelHasVegetableParcelKey)
		}
		if parcelHasVegetableVegetable != nil {
			dictionary.updateValue(parcelHasVegetableVegetable!, forKey: kParcelhasvegetablesParcelHasVegetableVegetableKey)
		}
		if parcelHasVegetableId != nil {
			dictionary.updateValue(parcelHasVegetableId!, forKey: kParcelhasvegetablesParcelHasVegetableIdKey)
		}
		if parcelHasVegetableQuantity != nil {
			dictionary.updateValue(parcelHasVegetableQuantity!, forKey: kParcelhasvegetablesParcelHasVegetableQuantityKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.parcelHasVegetableParcel = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableParcelKey) as? Int
		self.parcelHasVegetableVegetable = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableVegetableKey) as? Int
		self.parcelHasVegetableId = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableIdKey) as? Int
		self.parcelHasVegetableQuantity = aDecoder.decodeObjectForKey(kParcelhasvegetablesParcelHasVegetableQuantityKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(parcelHasVegetableParcel, forKey: kParcelhasvegetablesParcelHasVegetableParcelKey)
		aCoder.encodeObject(parcelHasVegetableVegetable, forKey: kParcelhasvegetablesParcelHasVegetableVegetableKey)
		aCoder.encodeObject(parcelHasVegetableId, forKey: kParcelhasvegetablesParcelHasVegetableIdKey)
		aCoder.encodeObject(parcelHasVegetableQuantity, forKey: kParcelhasvegetablesParcelHasVegetableQuantityKey)

    }

}
