//
//  Association.swift
//
//  Created by Johann Berthet on 18/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Association: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kAssociationAssociationNameKey: String = "association_name"
	internal let kAssociationAssociationPictureKey: String = "association_picture"
	internal let kAssociationAssociationDateCreationKey: String = "association_date_creation"
	internal let kAssociationAssociationDateUpdateKey: String = "association_date_update"
	internal let kAssociationAssociationIdKey: String = "association_id"
	internal let kAssociationAssociationDescriptionKey: String = "association_description"


    // MARK: Properties
	public var associationName: String?
	public var associationPicture: String?
	public var associationDateCreation: String?
	public var associationDateUpdate: String?
	public var associationId: Int?
	public var associationDescription: String?


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
		associationName = json[kAssociationAssociationNameKey].string
		associationPicture = json[kAssociationAssociationPictureKey].string
		associationDateCreation = json[kAssociationAssociationDateCreationKey].string
		associationDateUpdate = json[kAssociationAssociationDateUpdateKey].string
		associationId = json[kAssociationAssociationIdKey].int
		associationDescription = json[kAssociationAssociationDescriptionKey].string

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if associationName != nil {
			dictionary.updateValue(associationName!, forKey: kAssociationAssociationNameKey)
		}
		if associationPicture != nil {
			dictionary.updateValue(associationPicture!, forKey: kAssociationAssociationPictureKey)
		}
		if associationDateCreation != nil {
			dictionary.updateValue(associationDateCreation!, forKey: kAssociationAssociationDateCreationKey)
		}
		if associationDateUpdate != nil {
			dictionary.updateValue(associationDateUpdate!, forKey: kAssociationAssociationDateUpdateKey)
		}
		if associationId != nil {
			dictionary.updateValue(associationId!, forKey: kAssociationAssociationIdKey)
		}
		if associationDescription != nil {
			dictionary.updateValue(associationDescription!, forKey: kAssociationAssociationDescriptionKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.associationName = aDecoder.decodeObjectForKey(kAssociationAssociationNameKey) as? String
		self.associationPicture = aDecoder.decodeObjectForKey(kAssociationAssociationPictureKey) as? String
		self.associationDateCreation = aDecoder.decodeObjectForKey(kAssociationAssociationDateCreationKey) as? String
		self.associationDateUpdate = aDecoder.decodeObjectForKey(kAssociationAssociationDateUpdateKey) as? String
		self.associationId = aDecoder.decodeObjectForKey(kAssociationAssociationIdKey) as? Int
		self.associationDescription = aDecoder.decodeObjectForKey(kAssociationAssociationDescriptionKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(associationName, forKey: kAssociationAssociationNameKey)
		aCoder.encodeObject(associationPicture, forKey: kAssociationAssociationPictureKey)
		aCoder.encodeObject(associationDateCreation, forKey: kAssociationAssociationDateCreationKey)
		aCoder.encodeObject(associationDateUpdate, forKey: kAssociationAssociationDateUpdateKey)
		aCoder.encodeObject(associationId, forKey: kAssociationAssociationIdKey)
		aCoder.encodeObject(associationDescription, forKey: kAssociationAssociationDescriptionKey)

    }

}
