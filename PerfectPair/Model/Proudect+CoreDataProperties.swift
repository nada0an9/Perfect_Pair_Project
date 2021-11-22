//
//  Proudect+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 16/04/1443 AH.
//
//

import Foundation
import CoreData


extension Proudect {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Proudect> {
        return NSFetchRequest<Proudect>(entityName: "Proudect")
    }

    @NSManaged public var proudect_name: String?
    @NSManaged public var proudect_size: String?
    @NSManaged public var proudect_price: String?
    @NSManaged public var proudect_photo: String?
    @NSManaged public var toOrder: Order?

}

extension Proudect : Identifiable {

}
