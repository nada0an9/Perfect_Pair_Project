//
//  Cart+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 22/04/1443 AH.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var cart_date: String?
    @NSManaged public var proudect_name: String?
    @NSManaged public var proudect_price: String?
    @NSManaged public var proudect_qty: String?
    @NSManaged public var proudect_size: String?
    @NSManaged public var toCustomer: Customer?
    @NSManaged public var toOrder: NSManagedObject?

}

extension Cart : Identifiable {

}
