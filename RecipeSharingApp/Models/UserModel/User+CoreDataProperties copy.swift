//
//  User+CoreDataProperties.swift
//  
//
//  Created by to hoang nam on 29/5/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var password: String?
    @NSManaged public var profileImage: Data?


}
