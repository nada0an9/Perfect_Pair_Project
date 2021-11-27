//
//  Proudect+CoreDataProperties.swift
//  PerfectPair
//
//  Created by Nada Alansari on 22/04/1443 AH.
//
//

import Foundation
import CoreData


extension Proudect {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Proudect> {
        return NSFetchRequest<Proudect>(entityName: "Proudect")
    }

    @NSManaged public var proudect_name: String?
    @NSManaged public var proudect_photo: String?
    @NSManaged public var proudect_price: String?

}

extension Proudect : Identifiable {

}
