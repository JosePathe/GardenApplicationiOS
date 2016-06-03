//
//  Help.swift
//
//  Created by Mathieu Larcher on 01/06/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Help: NSObject{
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kHelpHelpTitleKey: String = "help_title"
    internal let kHelpHelpUserKey: String = "help_user"
    internal let kHelpHelpUserAcceptKey: String = "help_user_accept"
    internal let kHelpHelpIdKey: String = "help_id"
    internal let kHelpHelpTextKey: String = "help_text"
    
    
    // MARK: Properties
    public var helpTitle: String?
    public var helpUser: Int?
    public var helpUserAccept: String?
    public var helpId: String?
    public var helpText: String?
    
    
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
        helpTitle = json[kHelpHelpTitleKey].string
        helpUser = json[kHelpHelpUserKey].int
        helpUserAccept = json[kHelpHelpUserAcceptKey].string
        helpId = json[kHelpHelpIdKey].string
        helpText = json[kHelpHelpTextKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if helpTitle != nil {
            dictionary.updateValue(helpTitle!, forKey: kHelpHelpTitleKey)
        }
        if helpUser != nil {
            dictionary.updateValue(helpUser!, forKey: kHelpHelpUserKey)
        }
        if helpUserAccept != nil {
            dictionary.updateValue(helpUserAccept!, forKey: kHelpHelpUserAcceptKey)
        }
        if helpId != nil {
            dictionary.updateValue(helpId!, forKey: kHelpHelpIdKey)
        }
        if helpText != nil {
            dictionary.updateValue(helpText!, forKey: kHelpHelpTextKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.helpTitle = aDecoder.decodeObjectForKey(kHelpHelpTitleKey) as? String
        self.helpUser = aDecoder.decodeObjectForKey(kHelpHelpUserKey) as? Int
        self.helpUserAccept = aDecoder.decodeObjectForKey(kHelpHelpUserAcceptKey) as? String
        self.helpId = aDecoder.decodeObjectForKey(kHelpHelpIdKey) as? String
        self.helpText = aDecoder.decodeObjectForKey(kHelpHelpTextKey) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(helpTitle, forKey: kHelpHelpTitleKey)
        aCoder.encodeObject(helpUser, forKey: kHelpHelpUserKey)
        aCoder.encodeObject(helpUserAccept, forKey: kHelpHelpUserAcceptKey)
        aCoder.encodeObject(helpId, forKey: kHelpHelpIdKey)
        aCoder.encodeObject(helpText, forKey: kHelpHelpTextKey)
        
    }
    
}