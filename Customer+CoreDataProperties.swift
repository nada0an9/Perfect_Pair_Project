//
//  Customer+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 22/04/1443 AH.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var customer_address: String?
    @NSManaged public var customer_email: String?
    @NSManaged public var customer_name: String?
    @NSManaged public var customer_password: String?
    @NSManaged public var toCart: NSSet?
    @NSManaged public var toOrder: NSOrderedSet?

}

// MARK: Generated accessors for toCart
extension Customer {

    @objc(addToCartObject:)
    @NSManaged public func addToToCart(_ value: Cart)

    @objc(removeToCartObject:)
    @NSManaged public func removeFromToCart(_ value: Cart)

    @objc(addToCart:)
    @NSManaged public func addToToCart(_ values: NSSet)

    @objc(removeToCart:)
    @NSManaged public func removeFromToCart(_ values: NSSet)

}

// MARK: Generated accessors for toOrder
extension Customer {

    @objc(insertObject:inToOrderAtIndex:)
    @NSManaged public func insertIntoToOrder(_ value: NSManagedObject, at idx: Int)

    @objc(removeObjectFromToOrderAtIndex:)
    @NSManaged public func removeFromToOrder(at idx: Int)

    @objc(insertToOrder:atIndexes:)
    @NSManaged public func insertIntoToOrder(_ values: [NSManagedObject], at indexes: NSIndexSet)

    @objc(removeToOrderAtIndexes:)
    @NSManaged public func removeFromToOrder(at indexes: NSIndexSet)

    @objc(replaceObjectInToOrderAtIndex:withObject:)
    @NSManaged public func replaceToOrder(at idx: Int, with value: NSManagedObject)

    @objc(replaceToOrderAtIndexes:withToOrder:)
    @NSManaged public func replaceToOrder(at indexes: NSIndexSet, with values: [NSManagedObject])

    @objc(addToOrderObject:)
    @NSManaged public func addToToOrder(_ value: NSManagedObject)

    @objc(removeToOrderObject:)
    @NSManaged public func removeFromToOrder(_ value: NSManagedObject)

    @objc(addToOrder:)
    @NSManaged public func addToToOrder(_ values: NSOrderedSet)

    @objc(removeToOrder:)
    @NSManaged public func removeFromToOrder(_ values: NSOrderedSet)

}

extension Customer : Identifiable {

}
