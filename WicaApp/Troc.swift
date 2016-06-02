//
//  Troc.swift
//
//  Created by Mathieu Larcher on 29/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Troc: NSObject {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTrocGardenIdKey: String = "garden_id"
    internal let kTrocTrocRefVegetableWantedKey: String = "troc_ref_vegetable_wanted"
    internal let kTrocTrocIdKey: String = "troc_id"
    internal let kTrocTrocDescriptionKey: String = "troc_description"
    internal let kTrocTrocUserSellKey: String = "troc_user_sell"
    internal let kTrocTrocUserAcceptKey: String = "troc_user_accept"
    internal let kTrocTrocQuantityWantedKey: String = "troc_quantity_wanted"
    internal let kTrocTrocRefVegetableOfferKey: String = "troc_ref_vegetable_offer"
    internal let kTrocTrocQuantityOfferKey: String = "troc_quantity_offer"
    
    
    // MARK: Properties
    public var gardenId: String?
    public var trocRefVegetableWanted: String?
    public var trocId: String?
    public var trocDescription: String?
    public var trocUserSell: String?
    public var trocUserAccept: String?
    public var trocQuantityWanted: String?
    public var trocRefVegetableOffer: String?
    public var trocQuantityOffer: String?
    
    
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
        gardenId = json[kTrocGardenIdKey].string
        trocRefVegetableWanted = json[kTrocTrocRefVegetableWantedKey].string
        trocId = json[kTrocTrocIdKey].string
        trocDescription = json[kTrocTrocDescriptionKey].string
        trocUserSell = json[kTrocTrocUserSellKey].string
        trocUserAccept = json[kTrocTrocUserAcceptKey].string
        trocQuantityWanted = json[kTrocTrocQuantityWantedKey].string
        trocRefVegetableOffer = json[kTrocTrocRefVegetableOfferKey].string
        trocQuantityOffer = json[kTrocTrocQuantityOfferKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if gardenId != nil {
            dictionary.updateValue(gardenId!, forKey: kTrocGardenIdKey)
        }
        if trocRefVegetableWanted != nil {
            dictionary.updateValue(trocRefVegetableWanted!, forKey: kTrocTrocRefVegetableWantedKey)
        }
        if trocId != nil {
            dictionary.updateValue(trocId!, forKey: kTrocTrocIdKey)
        }
        if trocDescription != nil {
            dictionary.updateValue(trocDescription!, forKey: kTrocTrocDescriptionKey)
        }
        if trocUserSell != nil {
            dictionary.updateValue(trocUserSell!, forKey: kTrocTrocUserSellKey)
        }
        if trocUserAccept != nil {
            dictionary.updateValue(trocUserAccept!, forKey: kTrocTrocUserAcceptKey)
        }
        if trocQuantityWanted != nil {
            dictionary.updateValue(trocQuantityWanted!, forKey: kTrocTrocQuantityWantedKey)
        }
        if trocRefVegetableOffer != nil {
            dictionary.updateValue(trocRefVegetableOffer!, forKey: kTrocTrocRefVegetableOfferKey)
        }
        if trocQuantityOffer != nil {
            dictionary.updateValue(trocQuantityOffer!, forKey: kTrocTrocQuantityOfferKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.gardenId = aDecoder.decodeObjectForKey(kTrocGardenIdKey) as? String
        self.trocRefVegetableWanted = aDecoder.decodeObjectForKey(kTrocTrocRefVegetableWantedKey) as? String
        self.trocId = aDecoder.decodeObjectForKey(kTrocTrocIdKey) as? String
        self.trocDescription = aDecoder.decodeObjectForKey(kTrocTrocDescriptionKey) as? String
        self.trocUserSell = aDecoder.decodeObjectForKey(kTrocTrocUserSellKey) as? String
        self.trocUserAccept = aDecoder.decodeObjectForKey(kTrocTrocUserAcceptKey) as? String
        self.trocQuantityWanted = aDecoder.decodeObjectForKey(kTrocTrocQuantityWantedKey) as? String
        self.trocRefVegetableOffer = aDecoder.decodeObjectForKey(kTrocTrocRefVegetableOfferKey) as? String
        self.trocQuantityOffer = aDecoder.decodeObjectForKey(kTrocTrocQuantityOfferKey) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(gardenId, forKey: kTrocGardenIdKey)
        aCoder.encodeObject(trocRefVegetableWanted, forKey: kTrocTrocRefVegetableWantedKey)
        aCoder.encodeObject(trocId, forKey: kTrocTrocIdKey)
        aCoder.encodeObject(trocDescription, forKey: kTrocTrocDescriptionKey)
        aCoder.encodeObject(trocUserSell, forKey: kTrocTrocUserSellKey)
        aCoder.encodeObject(trocUserAccept, forKey: kTrocTrocUserAcceptKey)
        aCoder.encodeObject(trocQuantityWanted, forKey: kTrocTrocQuantityWantedKey)
        aCoder.encodeObject(trocRefVegetableOffer, forKey: kTrocTrocRefVegetableOfferKey)
        aCoder.encodeObject(trocQuantityOffer, forKey: kTrocTrocQuantityOfferKey)
        
    }
    
}
