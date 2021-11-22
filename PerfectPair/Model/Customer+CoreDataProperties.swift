//
//  Customer+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var customer_name: String?
    @NSManaged public var customer_address: String?
    @NSManaged public var customer_email: String?
    @NSManaged public var customer_password: String?
    @NSManaged public var toOrder: NSSet?

}

// MARK: Generated accessors for toOrder
extension Customer {

    @objc(addToOrderObject:)
    @NSManaged public func addToToOrder(_ value: Order)

    @objc(removeToOrderObject:)
    @NSManaged public func removeFromToOrder(_ value: Order)

    @objc(addToOrder:)
    @NSManaged public func addToToOrder(_ values: NSSet)

    @objc(removeToOrder:)
    @NSManaged public func removeFromToOrder(_ values: NSSet)

}

extension Customer : Identifiable {

}
