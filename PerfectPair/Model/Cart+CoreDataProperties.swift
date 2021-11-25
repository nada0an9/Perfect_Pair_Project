//
//  Cart+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 18/04/1443 AH.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var cart_date: String?
    @NSManaged public var proudect_qty: String?
    @NSManaged public var proudect_size: String?
    @NSManaged public var proudect_name: String?
    @NSManaged public var proudect_price: String?
    @NSManaged public var toCustomer: Customer?
    @NSManaged public var toProudect: NSSet?
  

    

}

// MARK: Generated accessors for toProudect
extension Cart {

    @objc(addToProudectObject:)
    @NSManaged public func addToToProudect(_ value: Proudect)

    @objc(removeToProudectObject:)
    @NSManaged public func removeFromToProudect(_ value: Proudect)

    @objc(addToProudect:)
    @NSManaged public func addToToProudect(_ values: NSSet)

    @objc(removeToProudect:)
    @NSManaged public func removeFromToProudect(_ values: NSSet)

}

extension Cart : Identifiable {

}
