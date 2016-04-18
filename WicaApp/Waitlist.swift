//
//  Waitlist.swift
//
//  Created by Johann Berthet on 18/04/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Waitlist: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kWaitlistWaitListRefGardenKey: String = "wait_list_ref_garden"
	internal let kWaitlistWaitListDateUpdateKey: String = "wait_list_date_update"
	internal let kWaitlistWaitListDateCreationKey: String = "wait_list_date_creation"
	internal let kWaitlistWaitListIdKey: String = "wait_list_id"
	internal let kWaitlistWaitListRefUserKey: String = "wait_list_ref_user"


    // MARK: Properties
	public var waitListRefGarden: Int?
	public var waitListDateUpdate: String?
	public var waitListDateCreation: String?
	public var waitListId: Int?
	public var waitListRefUser: Int?


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
		waitListRefGarden = json[kWaitlistWaitListRefGardenKey].int
		waitListDateUpdate = json[kWaitlistWaitListDateUpdateKey].string
		waitListDateCreation = json[kWaitlistWaitListDateCreationKey].string
		waitListId = json[kWaitlistWaitListIdKey].int
		waitListRefUser = json[kWaitlistWaitListRefUserKey].int

    }
    
    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if waitListRefGarden != nil {
			dictionary.updateValue(waitListRefGarden!, forKey: kWaitlistWaitListRefGardenKey)
		}
		if waitListDateUpdate != nil {
			dictionary.updateValue(waitListDateUpdate!, forKey: kWaitlistWaitListDateUpdateKey)
		}
		if waitListDateCreation != nil {
			dictionary.updateValue(waitListDateCreation!, forKey: kWaitlistWaitListDateCreationKey)
		}
		if waitListId != nil {
			dictionary.updateValue(waitListId!, forKey: kWaitlistWaitListIdKey)
		}
		if waitListRefUser != nil {
			dictionary.updateValue(waitListRefUser!, forKey: kWaitlistWaitListRefUserKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.waitListRefGarden = aDecoder.decodeObjectForKey(kWaitlistWaitListRefGardenKey) as? Int
		self.waitListDateUpdate = aDecoder.decodeObjectForKey(kWaitlistWaitListDateUpdateKey) as? String
		self.waitListDateCreation = aDecoder.decodeObjectForKey(kWaitlistWaitListDateCreationKey) as? String
		self.waitListId = aDecoder.decodeObjectForKey(kWaitlistWaitListIdKey) as? Int
		self.waitListRefUser = aDecoder.decodeObjectForKey(kWaitlistWaitListRefUserKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(waitListRefGarden, forKey: kWaitlistWaitListRefGardenKey)
		aCoder.encodeObject(waitListDateUpdate, forKey: kWaitlistWaitListDateUpdateKey)
		aCoder.encodeObject(waitListDateCreation, forKey: kWaitlistWaitListDateCreationKey)
		aCoder.encodeObject(waitListId, forKey: kWaitlistWaitListIdKey)
		aCoder.encodeObject(waitListRefUser, forKey: kWaitlistWaitListRefUserKey)

    }

}
