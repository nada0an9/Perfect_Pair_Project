//
//  Order+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var order_date: String?
    @NSManaged public var order_status: String?
    @NSManaged public var order_quantity: String?
    @NSManaged public var order_size: String?
    @NSManaged public var toProudect: NSSet?
    @NSManaged public var toCustomer: Customer?

}

// MARK: Generated accessors for toProudect
extension Order {

    @objc(addToProudectObject:)
    @NSManaged public func addToToProudect(_ value: Proudect)

    @objc(removeToProudectObject:)
    @NSManaged public func removeFromToProudect(_ value: Proudect)

    @objc(addToProudect:)
    @NSManaged public func addToToProudect(_ values: NSSet)

    @objc(removeToProudect:)
    @NSManaged public func removeFromToProudect(_ values: NSSet)

}

extension Order : Identifiable {

}
