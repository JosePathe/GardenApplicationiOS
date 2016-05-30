//
//  User.swift
//
//  Created by Johann Berthet on 23/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class User: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kUserCreatedAtKey: String = "created_at"
	internal let kUserPasswordResetTokenKey: String = "password_reset_token"
	internal let kUserDateBirthKey: String = "date_birth"
	internal let kUserLastnameKey: String = "lastname"
	internal let kUserFirstnameKey: String = "firstname"
	internal let kUserEmailKey: String = "email"
	internal let kUserUsernameKey: String = "username"
	internal let kUserInternalIdentifierKey: String = "id"
	internal let kUserUpdatedAtKey: String = "updated_at"
	internal let kUserAccountTypeKey: String = "account_type"
	internal let kUserAuthKeyKey: String = "auth_key"
	internal let kUserStatusKey: String = "status"
	internal let kUserPasswordHashKey: String = "password_hash"


    // MARK: Properties
	public var createdAt: Int?
	public var passwordResetToken: String?
	public var dateBirth: String?
	public var lastname: String?
	public var firstname: String?
	public var email: String?
	public var username: String?
	public var internalIdentifier: String?
	public var updatedAt: Int?
	public var accountType: String?
	public var authKey: String?
	public var status: Int?
	public var passwordHash: String?


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
		createdAt = json[kUserCreatedAtKey].int
		passwordResetToken = json[kUserPasswordResetTokenKey].string
		dateBirth = json[kUserDateBirthKey].string
		lastname = json[kUserLastnameKey].string
		firstname = json[kUserFirstnameKey].string
		email = json[kUserEmailKey].string
		username = json[kUserUsernameKey].string
		internalIdentifier = json[kUserInternalIdentifierKey].string
		updatedAt = json[kUserUpdatedAtKey].int
		accountType = json[kUserAccountTypeKey].string
		authKey = json[kUserAuthKeyKey].string
		status = json[kUserStatusKey].int
		passwordHash = json[kUserPasswordHashKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if createdAt != nil {
			dictionary.updateValue(createdAt!, forKey: kUserCreatedAtKey)
		}
		if passwordResetToken != nil {
			dictionary.updateValue(passwordResetToken!, forKey: kUserPasswordResetTokenKey)
		}
		if dateBirth != nil {
			dictionary.updateValue(dateBirth!, forKey: kUserDateBirthKey)
		}
		if lastname != nil {
			dictionary.updateValue(lastname!, forKey: kUserLastnameKey)
		}
		if firstname != nil {
			dictionary.updateValue(firstname!, forKey: kUserFirstnameKey)
		}
		if email != nil {
			dictionary.updateValue(email!, forKey: kUserEmailKey)
		}
		if username != nil {
			dictionary.updateValue(username!, forKey: kUserUsernameKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kUserInternalIdentifierKey)
		}
		if updatedAt != nil {
			dictionary.updateValue(updatedAt!, forKey: kUserUpdatedAtKey)
		}
		if accountType != nil {
			dictionary.updateValue(accountType!, forKey: kUserAccountTypeKey)
		}
		if authKey != nil {
			dictionary.updateValue(authKey!, forKey: kUserAuthKeyKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kUserStatusKey)
		}
		if passwordHash != nil {
			dictionary.updateValue(passwordHash!, forKey: kUserPasswordHashKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.createdAt = aDecoder.decodeObjectForKey(kUserCreatedAtKey) as? Int
		self.passwordResetToken = aDecoder.decodeObjectForKey(kUserPasswordResetTokenKey) as? String
		self.dateBirth = aDecoder.decodeObjectForKey(kUserDateBirthKey) as? String
		self.lastname = aDecoder.decodeObjectForKey(kUserLastnameKey) as? String
		self.firstname = aDecoder.decodeObjectForKey(kUserFirstnameKey) as? String
		self.email = aDecoder.decodeObjectForKey(kUserEmailKey) as? String
		self.username = aDecoder.decodeObjectForKey(kUserUsernameKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kUserInternalIdentifierKey) as? String
		self.updatedAt = aDecoder.decodeObjectForKey(kUserUpdatedAtKey) as? Int
		self.accountType = aDecoder.decodeObjectForKey(kUserAccountTypeKey) as? String
		self.authKey = aDecoder.decodeObjectForKey(kUserAuthKeyKey) as? String
		self.status = aDecoder.decodeObjectForKey(kUserStatusKey) as? Int
		self.passwordHash = aDecoder.decodeObjectForKey(kUserPasswordHashKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(createdAt, forKey: kUserCreatedAtKey)
		aCoder.encodeObject(passwordResetToken, forKey: kUserPasswordResetTokenKey)
		aCoder.encodeObject(dateBirth, forKey: kUserDateBirthKey)
		aCoder.encodeObject(lastname, forKey: kUserLastnameKey)
		aCoder.encodeObject(firstname, forKey: kUserFirstnameKey)
		aCoder.encodeObject(email, forKey: kUserEmailKey)
		aCoder.encodeObject(username, forKey: kUserUsernameKey)
		aCoder.encodeObject(internalIdentifier, forKey: kUserInternalIdentifierKey)
		aCoder.encodeObject(updatedAt, forKey: kUserUpdatedAtKey)
		aCoder.encodeObject(accountType, forKey: kUserAccountTypeKey)
		aCoder.encodeObject(authKey, forKey: kUserAuthKeyKey)
		aCoder.encodeObject(status, forKey: kUserStatusKey)
		aCoder.encodeObject(passwordHash, forKey: kUserPasswordHashKey)

    }

}
